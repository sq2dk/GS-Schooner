# GS-Schooner
SP2ZIE Schooner Ground Station

This is repository for Ground Station for PWSat-3 satellite.

![alt text](https://github.com/sq2dk/GS-Schooner/blob/main/controller4.jpg?raw=true)

## Overview

![alt text](https://github.com/sq2dk/GS-Schooner/blob/main/PW-Sat3-GS_Schematic.png?raw=true)

Future PWSat-3 satellite will have communication module based on simplex operation on 437.xxxMHz. Modulation used would be most likely 2GFSK with downlink speeds from 1200bd up to maximum possible speeds which assure correct decoding. Uplink speeds will be probably limited to max 9600bd. Satellite will be using Endurosat UHF Transceiver II module, which seem to be based on one of the popular sub-gigahertz communications IC such as SI4463 or similar.

Simplex operation means that the same frequency will be used for uplink and transmit. This poses additional challenge of switching between transmitting and receiving, as the same antenna will be used both for transmit and receive side. Additionally to ensure effective communication with satellite, high transmit power should be used, and since satellite itself uses low power transmitter, ground station receiver has to be able to receive low signals. 

To help with weak signal receiving and maximizing power radiating by transmitter directional antennas have to be used. We have decided to use system of two shorter directional antennas rather, than one long antenna, as they are more manageable mechanicaly. Due to the undetermined orientation of satellite in space antennas have to have circular polarisation to avoid signal fade-outs.

Since antennas are directional, they need to be painted to satellite at all times – antenna rotator able to change position in azimuth and elevation is required.

To compensate for coaxial cable loss low noise amplifier for received signals is used placed next to the antenna. 

Due to high radio noise environment and presence of nearby high power transmitters on frequencies lying close to frequency of interest RF bandpass filter is added before LNA, not to saturate amplifier with unwanted signal.

Additional very low passband (about 100kHz) filter can be connected in line to further limit noise from unwanted transmissions. This filter due to low bandpass characteristic is tunable by stepper motor to tune to required frequency.

Received signal is further divided to 4 paths to allow simultaneous operation of up to 4 receivers (main station and up to 3 SDR receivers). Those might be essential to decode transmissions with speed of above 9600bd. 

TX path of the station leads directly from transmitter to antennas via 2 relays.

Yaesu FT-991 wash chosen as main transceiver. Although this radio is not specifically designed for satellite use, transceiver was only one currently in production and available on the market capable of producing 50W of RF power on 70cm band with 9600bd transmission/rx capability. 

## GS controller

![alt text](https://github.com/sq2dk/GS-Schooner/blob/main/PW-Sat3-GS_controller.png?raw=true)

Primary role of GS controller is managing switching between transmit and receive modes. Additionally block is additionally filtering and distributing signal for the receivers. All functions can be controlled by computer by serial protocol or manually by keys and encoders. On request from transmitter controller is checking if all conditions for transmit switching are meet and only then sends signal back to TRX to allow transmitting. Control and switching function as well as human interface functions are made by specially designed PCB based on STM blue pill microcontroller. Schematic of electronic circuit and PCB designed can be found in appropriate folder.  
Embedded software is written in Arduino environment and it is available in appropriate folder. 


## LNA Box
![alt text](https://github.com/sq2dk/GS-Schooner/blob/main/LNA_BOX.jpg?raw=true)
![alt text](https://github.com/sq2dk/GS-Schooner/blob/main/lna_box.png?raw=true)

This part contains LNA, RF bandpass filter, RF relay and electronic driver for relay and LNA power supply. Schematic and PCB design for driver is included in appropriate folder. This is a simple transistor and relay switch. 4 wire interface to GS controlled is used. 12V power, ground, RX signal (to GND) and feedback signal are passed from/to GS controller. Separate TX and RX lines are feed from GS controller to LNA box. Although this solution requires extra coaxial cable, it simplifies design a bit, since other coaxial relay for TX/RX switching can be placed in below deck equipment (BDE).  
## Antenna system

![alt text](https://github.com/sq2dk/GS-Schooner/blob/main/anteny_2.jpg?raw=true)
