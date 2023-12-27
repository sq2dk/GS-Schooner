
//This simple program is for driving filter/LNA/distributor made for SP2ZIE PWSat-3 Ground Station

#include <Stepper.h>       // for stepper motor in filter
#include <Wire.h>
#include <LiquidCrystal_I2C.h>   //although it is not for STM32 it works.
#include <IWatchdog.h>               //watchdog 

LiquidCrystal_I2C lcd(0x27, 16, 2);


// pinout for STM32 blue pill
#include "config.h"

#define STM32DUINO_CORE


const int stepsPerRevolution = 200;  // change this to fit the number of steps per revolution
const long menu_timeout_max= 3000; //[ms] menu display time



// initialize the stepper library on pins 8 through 11:
Stepper myStepper(stepsPerRevolution, motor_pin_A, motor_pin_B, motor_pin_C, motor_pin_D);
long stepCount = 0;         // number of steps the motor has taken
byte steps_per_MHz = 93;    // number of steps per MHz of cf band change
long initial_qrg = 440870;  // freqiency in kHz (frequency after reset / on limit switch)
long global_qrg;            // current frq;
byte global_att = 1;        // global_var atteunation;
byte bypass_on = 1;         // bypass sysus 1=on, 0=off
byte tx_on = 0;             // tx status 1=on, 0=off;
String comm;
int letter=0;
char sign_l;
int step_inc;
int step_inc1;
String step_l;
String NMEA_String;         //for received and transmit data - not more than 82 characters
byte RX_enable=0;           // enable for receiver - if cable not connected RX path not to be enabled.
byte filter_ok=1;           // status of filter 1=OK, 0=ERROR
byte err_code=0;            // error code - 0=no error - bit coded
byte enc_changed=0;         // encoder or keyboard position change indicator
byte kbd_enable=1;          // is keyboard enabled
byte TX_mode=0;
long menu_timeout=menu_timeout_max;     // display menu timout [ms]
byte menu_item=0;           // actie menu item
byte debug_level=1;         // debug level 1=only essential feedback

volatile uint32_t encoderCount;


void setup() {
  //configure attenuator setting pins as output. 
  pinMode(ATT_V1, OUTPUT);
  pinMode(ATT_V2, OUTPUT);
  pinMode(ATT_V3, OUTPUT);
  pinMode(ATT_V4, OUTPUT);
  pinMode(ATT_V5, OUTPUT);
  pinMode(ATT_V6, OUTPUT);

  pinMode(PTT_FORCE,OUTPUT);
  digitalWrite(PTT_FORCE,LOW);

  pinMode(LED_R, OUTPUT);
  digitalWrite(LED_R,LOW);

  pinMode(LED_Y, OUTPUT);
  digitalWrite(LED_Y,LOW);

  pinMode(KEY_L, INPUT_PULLUP);
  pinMode(KEY_R, INPUT_PULLUP);
  pinMode(ENC_PRESS, INPUT_PULLUP);
  pinMode(ENC_CLK, INPUT_PULLUP);
  pinMode(ENC_DATA, INPUT_PULLUP);

  pinMode(CABLE_CONNECTED, INPUT_PULLDOWN);    // pin detecting if cable for radio is connected (connected wen high)
  attachInterrupt(digitalPinToInterrupt(CABLE_CONNECTED), Cable_interrupt, CHANGE);

  pinMode(PTT_INH, OUTPUT);
  digitalWrite(PTT_INH,LOW);

  pinMode(LNABOX_FEEDBACK, INPUT_PULLUP);   //feedback from LNA BOX - Active low

  pinMode(filter_limit_pin, INPUT_PULLUP);  // limit switch active will be shortened to GND.
 
  pinMode(PTT_IN, INPUT_PULLUP);                   // PTT_IN - normally high, active when low.
  
  attachInterrupt(digitalPinToInterrupt(PTT_IN), PTT_interrupt, CHANGE);  //any change on PTT_In to trigger interrupt routine 

  attachInterrupt(digitalPinToInterrupt(KEY_R), menuDisplay, LOW);
  attachInterrupt(digitalPinToInterrupt(KEY_L), menuExe, LOW);

  
  
  pinMode(FLTR_BPS, OUTPUT);                // Pin stiching baypass realy. LOW-signal going through filter, HIGH-filter bypass
  
  keyb_enable();
  
  // initialize the serial port:
  Serial1.begin(9600);             //Serial1 is one connected to right pins, 9600 - slow, but steady
  //lcd.begin(16, 2);                //LCD type decl
  lcd.init();
  lcd.backlight();
  //lcd.setCursor(0, 0); 
  //lcd.print("PW-Sat3");           //Welcome message
  reset_holding();                //just in case reset stepper
  disp_att(global_att);

  digitalWrite(FLTR_BPS,HIGH);
  Cable_interrupt();
 
  if (filter_ok){
     if (debug_level>1) Serial1.println("Reset to zero");
     reset_step();
  }

IWatchdog.begin(500000);    //watchdog set to approx 500ms

}


void keyb_enable(){
 #ifdef LIBMAPLE_CORE  
  systick_attach_callback(&encoder1_read);
  //interrupts();
  kbd_enable=1;
  #endif  
 }
  

void keyb_disable(){
   #ifdef LIBMAPLE_CORE  
  systick_attach_callback();
  //noInterrupts();
  kbd_enable=0;
  #endif  
 
  }

void encoder1_read(void)
{
  volatile static uint8_t ABs = 0;
  uint8_t increment=1;
  //step_inc=0;
  if (menu_item!=0) menu_timeout--;
  ABs = (ABs << 2) & 0x0f; //left 2 bits now contain the previous AB key read-out;
  if (digitalRead(ENC_PRESS)==0) increment=10; else increment=1;
  ABs |= (digitalRead(ENC_CLK) << 1) | digitalRead(ENC_DATA);
  
  switch (ABs)
  {
    case 0x0d:
      if (digitalRead(KEY_L)==LOW){              //if with encoder moement we have left key pressed
        global_att++;
        if (global_att>127) {global_att=127;}
        if (debug_level>1) Serial1.println(global_att);

      }
      else {
        step_inc=increment;
      }
      break;
    case 0x0e:
      if (digitalRead(KEY_L)==LOW){              //if with encoder moement we have left key pressed
        if (global_att==1) {global_att=2;}
        global_att--;
        if (debug_level>1) Serial1.println(global_att);
        
      }
      else {
        step_inc=(-1)*increment;
      }
      break;
  }

  
}

void PTT_interrupt() {
long timer_start;
long time_elapsed=0;

timer_start=millis();

  if (digitalRead(PTT_IN)==LOW) {      //if in transmit mode
     set_att(63);                      //max attenaution
     err_code=(err_code & B11111011);         // reesets code for this procedure
     lcd.setCursor(14, 0);
     lcd.print("TX");
     digitalWrite(LED_Y,HIGH);
     TX_mode=1;
     if (debug_level>1) Serial1.println("TRANSMIT");
     
     while (((time_elapsed<100)) & (digitalRead(LNABOX_FEEDBACK)==HIGH) )    //repeat untill time elapsed < 100ms and feedbak received
     {
         time_elapsed=millis()-timer_start;
     }
      if (time_elapsed<100)             //if we ave wated <100ms for feedback from LNA box
      {
        tx_on=1;
        delay(20);                       //wait additional 20ms to enable transmision <------------------------------------------------------
        digitalWrite(PTT_INH, HIGH);    // enable transmit

      }
      else   //if feedback from LNA BOX not received in time
      {
        err_code=(err_code | B00000100);     // set error code
        digitalWrite(PTT_INH, LOW);          // do not allow to start TX
        tx_on=0;                              
      }
      if (debug_level>2)
        {
         Serial1.print(timer_start);
         Serial1.print(" ");
         Serial1.print(millis());
         Serial1.print(" ");
         Serial1.println(time_elapsed);
        }

     
  }
  else 
  //if (RX_enable)               // we actually do not need this here
  {
     set_att(global_att);        //return to previous att
     disp_qrg(global_qrg);
     TX_mode=0;
     //digitalWrite(FLTR_BPS, LOW);
     lcd.setCursor(14, 0);
     lcd.print("RX");
     digitalWrite(LED_Y,LOW);
     if (debug_level>1) Serial1.println("RECEIVE ");
     digitalWrite(PTT_INH, LOW);
    // tx_on=0;
  }

 
 
    
  error_handler();
}

void Cable_interrupt() {                    //this activates when tere is an change from radio (cable connected or radio switched on/off)
  err_code=(err_code & B11111110);         // reesets code for this procedure
  if (digitalRead(CABLE_CONNECTED)==LOW)
   {
     RX_enable=0;
     err_code=(err_code | B00000001);
     //digitalWrite(PTT_FORCE,HIGH);                               //forces TX path to actiate - we ave to assume, that no LNA box is connected.
   }
   else
   {
     RX_enable=1;
   }
 error_handler();
}

void reset_holding(){   //sets all stepper driver pins for reducing power consumption and heat generation

  digitalWrite(motor_pin_A,LOW);
  digitalWrite(motor_pin_B,LOW);
  digitalWrite(motor_pin_C,LOW);
  digitalWrite(motor_pin_D,LOW);
}

void disp_qrg(long frq){
  if (bypass_on==0) {
    lcd.setCursor(1, 0);
    lcd.print(frq);
    lcd.setCursor(0, 0); 
    lcd.print(int(frq/1000));
    lcd.print(".");
    lcd.setCursor(7, 0);
    lcd.print("MHz");
  }
  if (bypass_on==1) {
   lcd.setCursor(0, 0);       //update info on LCD
   lcd.print(" -BYPASS- ");
  }

}

void error_handler(){
  if (err_code>0)
  {
    digitalWrite(LED_R, HIGH);
    lcd.setCursor(9, 1);
    lcd.print("ERROR");
    lcd.print(err_code);
    Serial1.print("ERROR ");
    
    if (err_code & B00000001){
      Serial1.println("Radio NOT connected");
    }
    if (err_code & B00000010){
      Serial1.println("Problem with filter");
    }
    if (err_code & B00000100){
      Serial1.println("No response from LNA BOX");
    }

  }
  else
  {
    digitalWrite(LED_R, LOW);
    lcd.setCursor(9, 1);
    lcd.print("       ");
  }
  //here we should take care about displaying all rerors
}

void set_att(byte att){ //sets the defined pins for digital (binary) output
    digitalWrite(ATT_V6, HIGH && (att & B00100000));  //MSB
    digitalWrite(ATT_V5, HIGH && (att & B00010000));
    digitalWrite(ATT_V4, HIGH && (att & B00001000));
    digitalWrite(ATT_V3, HIGH && (att & B00000100));
    digitalWrite(ATT_V2, HIGH && (att & B00000010));
    digitalWrite(ATT_V1, HIGH && (att & B00000001));  //LSB
}

void disp_att(byte att) {   //displays att level on LCD (in steps of 0.5dB)
    lcd.setCursor(0, 1);
    lcd.print("ATT ");
    lcd.setCursor(4, 1);
    lcd.print("-");
    lcd.print(int(att/2));
    lcd.print(".");
    if ((att%2)>0)
      {lcd.print("5");}
    else
      {lcd.print("0");}  
}

void reset_step(){  // retracts filter core untill pass limitt switch, then moves it back, just past it and resets count
long steps_made=0;
err_code=(err_code & B11111101);                                //resets error code for filter
  while ((digitalRead(filter_limit_pin)==LOW) and (filter_ok)){
     myStepper.step(1);
     delay(5);
     steps_made++;
      if (debug_level>2) Serial1.print("-");
      IWatchdog.reload();             //restet watchdog
     if (steps_made>2100) 
      {
        filter_ok=0;
        err_code=(err_code | B00000010);
      }
  }
  steps_made=0;
   while ((digitalRead(filter_limit_pin)==HIGH) and (filter_ok)){
     myStepper.step(-1);
     IWatchdog.reload();             //restet watchdog
     delay(50);
     steps_made++;
     if (steps_made>20)
     {
        filter_ok=0;
        err_code=(err_code | B00000010);
      }
   }

  stepCount=0;      //resets stepper count after reset procedure
  global_qrg=initial_qrg;
  disp_qrg(global_qrg);    //show approx freq on LCD
  
  reset_holding();  //resets holding power to reduce current consumption and heat generation
  error_handler();
}

void bypass_filter(boolean on){

  //digitalWrite(FLTR_BPS, !on);  //set pypass pin to appropriate state
  if (on==1) {
    lcd.setCursor(0, 0);       //update info on LCD
    lcd.print(" -BYPASS- ");
    bypass_on=1;
    digitalWrite(FLTR_BPS,LOW);
  }
  else {
    disp_qrg(global_qrg);
    lcd.setCursor(0, 0);
    bypass_on=0;
    digitalWrite(FLTR_BPS,HIGH);
  }
  
}

void menuDisplay() 
{

  if ((menu_timeout==menu_timeout_max) | (menu_timeout<(menu_timeout_max-500)))
  {
    menu_timeout=menu_timeout_max-1;
    menu_item++;
    if (menu_item==4) menu_item=1;
    lcd.setCursor(0, 1);       //update info on LCD
    if (menu_item==1) lcd.print("Bypass         ");
    if (menu_item==2) lcd.print("TX mode        ");
    if (menu_item==3) lcd.print("Reset filter   ");
    
   
  }
 
}

void menuExe(){

byte tx_line_status;

  if (menu_timeout<menu_timeout_max){
    if (menu_item==1) bypass_filter(!bypass_on);
    if (menu_item==2) { tx_line_status=digitalRead(PTT_FORCE); digitalWrite(PTT_FORCE,!tx_line_status); }
    if (menu_item==3) reset_step();
    menu_item=0;
    menu_timeout=menu_timeout_max;
    lcd.setCursor(0, 1);       //update info on LCD
    lcd.print("               ");
    disp_att(global_att);
    disp_qrg(global_qrg);

  }
}


void send_status(){            
                        //Status : "STST, Approx freq in kHz, number of steps of tunable filter, bypass on/off, attenator value (not used), RX enable=1 TX mode=0, TX in transmit mode, error code"

  NMEA_String="STST,";
  NMEA_String+=global_qrg;
  NMEA_String+=",";
  NMEA_String+=stepCount;
  NMEA_String+=",";
  NMEA_String+=bypass_on;
  NMEA_String+=",";
  NMEA_String+=global_att;
  NMEA_String+=","; 
  NMEA_String+=TX_mode; 
  NMEA_String+=","; 
  NMEA_String+=tx_on;
  NMEA_String+=","; 
  NMEA_String+=err_code;


  Serial1.println(NMEA_String);
}

void tune_filter(int steps){
  if (bypass_on==0)
  {
   if ((stepCount+steps)<0) steps=0;                      //if we are within limits
   if (stepCount+steps>1000) steps=0;
   keyb_disable(); 
   for (int a=0; a<abs(steps); a++){                           //move filter required number of steps
    if (steps>0) {
      myStepper.step(-1);
      stepCount++;
     }
    else {
      myStepper.step(+1);
      stepCount--;
    }
    delay(5);
    IWatchdog.reload();
    reset_holding();
    }
   keyb_enable();
   global_qrg=initial_qrg-int((stepCount*1000)/steps_per_MHz);
   disp_qrg(global_qrg);    //show approx freq on LCD
   if (debug_level>2) Serial1.print("  StepCount ");
   if (debug_level>2) Serial1.println(stepCount);  
   steps=0;
  }

}

void loop() {
  static uint32_t count;
  static uint32_t prevCount;
  static byte prev_att=1;
  byte step_no=0;

  if (step_inc !=0) {                                         //change of encoder status
    keyb_disable();                                           //this is not working I think
   if (debug_level>2) Serial1.print("step_inc ");
   if (debug_level>2) Serial1.print(step_inc);  
    tune_filter((-1)*step_inc);                              // step UP truns freuency down, thus -1*step. 
    step_inc=0;
    keyb_enable();

  } 
  
  if (prev_att!=global_att){           //if we have change in att. seting
      set_att(global_att);
      disp_att(global_att);
      prev_att=global_att;
  }
   
  if (menu_timeout==0){
     menu_timeout=menu_timeout_max;
     menu_item=0;
     lcd.setCursor(0, 1);       //update info on LCD
     lcd.print("               ");
     disp_att(global_att);

   }
  
  if (Serial1.available() > 0) {
                // read the incoming byte:

                //Commands so far...
                //STr - reset filter - go back to limit switch
                //STT - force on TX 
                //STR - force off tx
                //STB0 - switch off bypass
                //STB1 - switch on bypass
                //ST+[number] - adance filter [number] of steps
                //ST-[number] - retard filter [number] of steps
                
                
                comm = comm+char(Serial1.read());
        
                letter=letter+1;
                
                // Serial1.println(comm[letter-1]);
                if (comm[letter-1]==10) {    //end of line
                 if ((comm[0]=='S') && (comm[1]=='T')) {
                   sign_l=comm[2];
                   
                   if (sign_l=='r') {
                    reset_step();
                    if (debug_level>1) Serial1.println("reset");
                   }
                   else

                   if (sign_l=='T') {      //Transmit command - force PTT signal (FORCES diregarding external sources)
                    digitalWrite(PTT_FORCE,HIGH);
                   }
                   else

                   if (sign_l=='R') {      //Receive command - release PTT signal (still controlled by external source)
                    digitalWrite(PTT_FORCE,LOW);
                   }
                   else

                   if (sign_l=='B') {
                    if (comm[3]=='0') { 
                      bypass_filter(0); }
                    if (comm[3]=='1') { 
                      bypass_filter(1); }
                   }

                   else
                   if (sign_l=='?') {
                     send_status();
                   }

                   else

                   {
                      step_l=comm.substring(3);
                      step_inc1=step_l.toInt();
                     if ((sign_l=='-') && ((stepCount-step_inc1)<0)) {
                        step_inc1=stepCount;
                        step_l="min ";
                      }
                      if ((sign_l=='+') && ((stepCount+step_inc1)>1000)) {
                         step_inc1=1000-stepCount;
                         step_l="max ";
                      }
                      

                     if (sign_l=='-')  {step_inc1=(-1)*step_inc1;}

                     tune_filter(step_inc1);
                      
                      }                    
                   
                 
                   }
                   else{
                     Serial1.println("hmmmm?");
                  
                     }
                   comm="";
                  letter=0;
                 }
  }
  // step one step:
  
IWatchdog.reload();             //restet watchdog

}

  #ifdef STM32DUINO_CORE                     //checks encoder every 1ms
  void HAL_SYSTICK_Callback()
   {
     if (kbd_enable) encoder1_read();
   }
  #endif
  

