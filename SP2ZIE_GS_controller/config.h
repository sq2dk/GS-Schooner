#ifndef CONFIG_H
#define CONFIG_H

//Serial 1 ports are:
// PB9 - TX
// PB10 - RX

// Stepper motor pins
#define motor_pin_D PB10
#define motor_pin_C PB1
#define motor_pin_B PA15
#define motor_pin_A PB3

#define filter_limit_pin PA7

#define CABLE_CONNECTED PB4

#define LED_Y PB5
#define LED_R PB8

#define KEY_L PB13
#define KEY_R PB12

#define ENC_PRESS PA8
#define ENC_CLK PB15
#define ENC_DATA PB14



#define VOLT_INP PA1

// Attenuator pins
#define ATT_V1 PB9    //LSB
#define ATT_V2 PA2
#define ATT_V3 PA3
#define ATT_V4 PA4
#define ATT_V5 PA5
#define ATT_V6 PA6    //MSB

//filter bypass pin
#define FLTR_BPS PB11

//transmit pin (should switch off power to LNA and force max attenaution
#define PTT_IN PB0

#define LNA_BOX_SW PC13       // TX/RX switch feedback from LNA box
#define PTT_FORCE PA0         // Force TX by microcontroler
#define PTT_OUT PC14          // PTT OUT to radio - controlled by microcontroller
#define PTT_INH PC15          // When high (high resistance) no TX is possible (yaesu)
#define LNABOX_FEEDBACK PC13  // Feedback from LNA BOX

#define KEY1 PB12
#define KEY2 PB13
#define KEY3 PB14
#define ENC_PIN1 PB15
#define ENC_PIN2 PB8



#endif // CONFIG_H
