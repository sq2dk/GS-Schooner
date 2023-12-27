EESchema Schematic File Version 4
LIBS:lna_switch-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_01x03 J1
U 1 1 61F1CAAE
P 1950 2100
F 0 "J1" H 1868 1775 50  0000 C CNN
F 1 "Conn_01x03" H 1868 1866 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 1950 2100 50  0001 C CNN
F 3 "~" H 1950 2100 50  0001 C CNN
	1    1950 2100
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 61F1D1CF
P 2450 2300
F 0 "#PWR04" H 2450 2050 50  0001 C CNN
F 1 "GND" H 2455 2127 50  0000 C CNN
F 2 "" H 2450 2300 50  0001 C CNN
F 3 "" H 2450 2300 50  0001 C CNN
	1    2450 2300
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR03
U 1 1 61F1D3C4
P 2450 1950
F 0 "#PWR03" H 2450 1800 50  0001 C CNN
F 1 "+12V" H 2465 2123 50  0000 C CNN
F 2 "" H 2450 1950 50  0001 C CNN
F 3 "" H 2450 1950 50  0001 C CNN
	1    2450 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 2000 2450 2000
Wire Wire Line
	2450 2000 2450 1950
Wire Wire Line
	2150 2200 2450 2200
Wire Wire Line
	2450 2200 2450 2300
$Comp
L power:+12V #PWR012
U 1 1 61F2B377
P 6950 2550
F 0 "#PWR012" H 6950 2400 50  0001 C CNN
F 1 "+12V" H 6965 2723 50  0000 C CNN
F 2 "" H 6950 2550 50  0001 C CNN
F 3 "" H 6950 2550 50  0001 C CNN
	1    6950 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 61F2C45D
P 9900 2950
F 0 "#PWR018" H 9900 2700 50  0001 C CNN
F 1 "GND" H 9905 2777 50  0000 C CNN
F 2 "" H 9900 2950 50  0001 C CNN
F 3 "" H 9900 2950 50  0001 C CNN
	1    9900 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 61F3E2F0
P 3200 1800
F 0 "R1" H 3130 1754 50  0000 R CNN
F 1 "1.2k" H 3130 1845 50  0000 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 3130 1800 50  0001 C CNN
F 3 "~" H 3200 1800 50  0001 C CNN
	1    3200 1800
	-1   0    0    1   
$EndComp
Wire Wire Line
	2150 2100 2800 2100
Wire Wire Line
	3200 1950 3200 2100
$Comp
L power:+12V #PWR06
U 1 1 61F42F77
P 3200 1600
F 0 "#PWR06" H 3200 1450 50  0001 C CNN
F 1 "+12V" H 3215 1773 50  0000 C CNN
F 2 "" H 3200 1600 50  0001 C CNN
F 3 "" H 3200 1600 50  0001 C CNN
	1    3200 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 1600 3200 1650
$Comp
L Device:R R3
U 1 1 61F483BC
P 4900 2000
F 0 "R3" V 4693 2000 50  0000 C CNN
F 1 "1k" V 4784 2000 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 4830 2000 50  0001 C CNN
F 3 "~" H 4900 2000 50  0001 C CNN
	1    4900 2000
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 61F48D43
P 4950 2900
F 0 "R4" V 4743 2900 50  0000 C CNN
F 1 "1k" V 4834 2900 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 4880 2900 50  0001 C CNN
F 3 "~" H 4950 2900 50  0001 C CNN
	1    4950 2900
	0    1    1    0   
$EndComp
$Comp
L power:+12V #PWR09
U 1 1 61F53455
P 5600 1600
F 0 "#PWR09" H 5600 1450 50  0001 C CNN
F 1 "+12V" H 5615 1773 50  0000 C CNN
F 2 "" H 5600 1600 50  0001 C CNN
F 3 "" H 5600 1600 50  0001 C CNN
	1    5600 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 2000 4600 2000
Wire Wire Line
	4600 2900 4800 2900
$Comp
L Device:R R2
U 1 1 61F28A2B
P 3700 2600
F 0 "R2" H 3770 2646 50  0000 L CNN
F 1 "4.7k" H 3770 2555 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.42x1.75mm_HandSolder" V 3630 2600 50  0001 C CNN
F 3 "~" H 3700 2600 50  0001 C CNN
	1    3700 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 61F28FC9
P 3700 2850
F 0 "#PWR08" H 3700 2600 50  0001 C CNN
F 1 "GND" H 3705 2677 50  0000 C CNN
F 2 "" H 3700 2850 50  0001 C CNN
F 3 "" H 3700 2850 50  0001 C CNN
	1    3700 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 2750 3700 2850
$Comp
L power:GND #PWR014
U 1 1 61F2B0E3
P 7850 2500
F 0 "#PWR014" H 7850 2250 50  0001 C CNN
F 1 "GND" H 7855 2327 50  0000 C CNN
F 2 "" H 7850 2500 50  0001 C CNN
F 3 "" H 7850 2500 50  0001 C CNN
	1    7850 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 2400 7850 2500
Wire Wire Line
	6750 1850 7850 1850
Wire Wire Line
	8900 1850 8900 2400
Wire Wire Line
	6750 1850 6750 2350
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 61F32145
P 5700 3550
F 0 "J2" V 5664 3362 50  0000 R CNN
F 1 "Conn_Relay" V 5573 3362 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 5700 3550 50  0001 C CNN
F 3 "~" H 5700 3550 50  0001 C CNN
	1    5700 3550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR011
U 1 1 61F33A15
P 6050 3450
F 0 "#PWR011" H 6050 3200 50  0001 C CNN
F 1 "GND" H 6055 3277 50  0000 C CNN
F 2 "" H 6050 3450 50  0001 C CNN
F 3 "" H 6050 3450 50  0001 C CNN
	1    6050 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 3350 5700 3200
Wire Wire Line
	5700 3200 6050 3200
Wire Wire Line
	6050 3200 6050 3450
$Comp
L Device:C C5
U 1 1 61F37CEE
P 2800 2350
F 0 "C5" H 2915 2396 50  0000 L CNN
F 1 "1n" H 2915 2305 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 2838 2200 50  0001 C CNN
F 3 "~" H 2800 2350 50  0001 C CNN
	1    2800 2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 61F38760
P 2800 2600
F 0 "#PWR05" H 2800 2350 50  0001 C CNN
F 1 "GND" H 2805 2427 50  0000 C CNN
F 2 "" H 2800 2600 50  0001 C CNN
F 3 "" H 2800 2600 50  0001 C CNN
	1    2800 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 2100 2800 2200
Connection ~ 2800 2100
Wire Wire Line
	2800 2100 3200 2100
Wire Wire Line
	2800 2500 2800 2600
$Comp
L Device:C C2
U 1 1 61F4E913
P 1950 2800
F 0 "C2" H 2065 2846 50  0000 L CNN
F 1 "100n" H 2065 2755 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 1988 2650 50  0001 C CNN
F 3 "~" H 1950 2800 50  0001 C CNN
	1    1950 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 61F4FF1B
P 2250 2800
F 0 "C3" H 2365 2846 50  0000 L CNN
F 1 "10n" H 2365 2755 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 2288 2650 50  0001 C CNN
F 3 "~" H 2250 2800 50  0001 C CNN
	1    2250 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 61F501FA
P 2100 3100
F 0 "#PWR02" H 2100 2850 50  0001 C CNN
F 1 "GND" H 2105 2927 50  0000 C CNN
F 2 "" H 2100 3100 50  0001 C CNN
F 3 "" H 2100 3100 50  0001 C CNN
	1    2100 3100
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR01
U 1 1 61F50965
P 2100 2500
F 0 "#PWR01" H 2100 2350 50  0001 C CNN
F 1 "+12V" H 2115 2673 50  0000 C CNN
F 2 "" H 2100 2500 50  0001 C CNN
F 3 "" H 2100 2500 50  0001 C CNN
	1    2100 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2600 1950 2600
Wire Wire Line
	1950 2600 1950 2650
Wire Wire Line
	2100 2500 2100 2600
Wire Wire Line
	2100 2600 2250 2600
Wire Wire Line
	2250 2600 2250 2650
Connection ~ 2100 2600
Wire Wire Line
	1950 2950 1950 3000
Wire Wire Line
	1950 3000 2100 3000
Wire Wire Line
	2100 3000 2100 3100
Wire Wire Line
	2250 2950 2250 3000
Wire Wire Line
	2250 3000 2100 3000
Connection ~ 2100 3000
$Comp
L Device:C C4
U 1 1 61F561E2
P 2500 2800
F 0 "C4" H 2615 2846 50  0000 L CNN
F 1 "100n" H 2615 2755 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 2538 2650 50  0001 C CNN
F 3 "~" H 2500 2800 50  0001 C CNN
	1    2500 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 61F56789
P 1700 2800
F 0 "C1" H 1815 2846 50  0000 L CNN
F 1 "10n" H 1815 2755 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 1738 2650 50  0001 C CNN
F 3 "~" H 1700 2800 50  0001 C CNN
	1    1700 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 2600 1700 2600
Wire Wire Line
	1700 2600 1700 2650
Connection ~ 1950 2600
Wire Wire Line
	1950 3000 1700 3000
Wire Wire Line
	1700 3000 1700 2950
Connection ~ 1950 3000
Wire Wire Line
	2250 3000 2500 3000
Wire Wire Line
	2500 3000 2500 2950
Connection ~ 2250 3000
Wire Wire Line
	2500 2650 2500 2600
Wire Wire Line
	2500 2600 2250 2600
Connection ~ 2250 2600
$Comp
L Device:D D1
U 1 1 61F64FE5
P 5650 3900
F 0 "D1" H 5650 4116 50  0000 C CNN
F 1 "M7" H 5650 4025 50  0000 C CNN
F 2 "Diode_SMD:D_SMA-SMB_Universal_Handsoldering" H 5650 3900 50  0001 C CNN
F 3 "~" H 5650 3900 50  0001 C CNN
	1    5650 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:D D2
U 1 1 61F65756
P 7850 2100
F 0 "D2" V 7804 2179 50  0000 L CNN
F 1 "M7" V 7895 2179 50  0000 L CNN
F 2 "Diode_SMD:D_SMA-SMB_Universal_Handsoldering" H 7850 2100 50  0001 C CNN
F 3 "~" H 7850 2100 50  0001 C CNN
	1    7850 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	7850 2250 7850 2400
Connection ~ 7850 2400
Wire Wire Line
	7850 1950 7850 1850
Connection ~ 7850 1850
Wire Wire Line
	7850 1850 8900 1850
Wire Wire Line
	5600 3350 5350 3350
Wire Wire Line
	5350 3350 5350 3900
Wire Wire Line
	5350 3900 5500 3900
Wire Wire Line
	5800 3900 5900 3900
Wire Wire Line
	5900 3900 5900 3350
Wire Wire Line
	5900 3350 5700 3350
Connection ~ 5700 3350
$Comp
L Device:C C6
U 1 1 61FA3D9C
P 9700 2700
F 0 "C6" H 9815 2746 50  0000 L CNN
F 1 "100n" H 9815 2655 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 9738 2550 50  0001 C CNN
F 3 "~" H 9700 2700 50  0001 C CNN
	1    9700 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 61FA6462
P 9800 4050
F 0 "#PWR0101" H 9800 3800 50  0001 C CNN
F 1 "GND" H 9805 3877 50  0000 C CNN
F 2 "" H 9800 4050 50  0001 C CNN
F 3 "" H 9800 4050 50  0001 C CNN
	1    9800 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_BCE Q1
U 1 1 61F69B20
P 5500 2000
F 0 "Q1" H 5691 2046 50  0000 L CNN
F 1 "BCX54" H 5691 1955 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-89-3_Handsoldering" H 5700 2100 50  0001 C CNN
F 3 "~" H 5500 2000 50  0001 C CNN
	1    5500 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NPN_BCE Q2
U 1 1 61F6A53E
P 5500 2900
F 0 "Q2" H 5691 2946 50  0000 L CNN
F 1 "BCX54" H 5691 2855 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-89-3_Handsoldering" H 5700 3000 50  0001 C CNN
F 3 "~" H 5500 2900 50  0001 C CNN
	1    5500 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 2000 5300 2000
Wire Wire Line
	5600 1600 5600 1800
Wire Wire Line
	5600 2350 6750 2350
Wire Wire Line
	5600 2200 5600 2350
Wire Wire Line
	5100 2900 5300 2900
Wire Wire Line
	5600 3100 5600 3350
Connection ~ 5600 3350
$Comp
L Transistor_BJT:BC848 Q3
U 1 1 61F6CD26
P 3600 2100
F 0 "Q3" H 3791 2146 50  0000 L CNN
F 1 "BC848" H 3791 2055 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3800 2025 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BC847SERIES_BC848SERIES_BC849SERIES_BC850SERIES-DS-v01_01-en.pdf?fileId=db3a304314dca389011541d4630a1657" H 3600 2100 50  0001 L CNN
	1    3600 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 2000 4600 2350
Wire Wire Line
	3200 2100 3400 2100
Connection ~ 3200 2100
Wire Wire Line
	3700 1900 3700 1650
Wire Wire Line
	3700 1650 3200 1650
Connection ~ 3200 1650
Wire Wire Line
	3700 2300 3700 2350
Wire Wire Line
	3700 2350 4600 2350
Connection ~ 3700 2350
Wire Wire Line
	3700 2350 3700 2450
Connection ~ 4600 2350
Wire Wire Line
	4600 2350 4600 2900
$Comp
L Relay:G5V-2 K?
U 1 1 620BFE76
P 8450 2800
F 0 "K?" V 7683 2800 50  0000 C CNN
F 1 "G5V-2" V 7774 2800 50  0000 C CNN
F 2 "Relay_THT:Relay_DPDT_Omron_G5V-2" H 9100 2750 50  0001 L CNN
F 3 "http://omronfs.omron.com/en_US/ecb/products/pdf/en-g5v_2.pdf" H 8250 2800 50  0001 C CNN
	1    8450 2800
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J?
U 1 1 620D786E
P 10450 2400
F 0 "J?" H 10530 2442 50  0000 L CNN
F 1 "Conn_01x03" H 10530 2351 50  0000 L CNN
F 2 "" H 10450 2400 50  0001 C CNN
F 3 "~" H 10450 2400 50  0001 C CNN
	1    10450 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 620E246F
P 10100 2700
F 0 "C?" H 10215 2746 50  0000 L CNN
F 1 "100n" H 10215 2655 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 10138 2550 50  0001 C CNN
F 3 "~" H 10100 2700 50  0001 C CNN
	1    10100 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 2400 8900 2400
Wire Wire Line
	7850 2400 8150 2400
$Comp
L Device:CP C?
U 1 1 620EE13F
P 1450 2800
F 0 "C?" H 1568 2846 50  0000 L CNN
F 1 "CP" H 1568 2755 50  0000 L CNN
F 2 "" H 1488 2650 50  0001 C CNN
F 3 "~" H 1450 2800 50  0001 C CNN
	1    1450 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 2600 1450 2600
Wire Wire Line
	1450 2600 1450 2650
Connection ~ 1700 2600
Wire Wire Line
	1700 3000 1450 3000
Wire Wire Line
	1450 3000 1450 2950
Connection ~ 1700 3000
$Comp
L Connector_Generic:Conn_01x03 J?
U 1 1 620F9C5A
P 10400 3400
F 0 "J?" H 10480 3442 50  0000 L CNN
F 1 "Conn_01x03" H 10480 3351 50  0000 L CNN
F 2 "" H 10400 3400 50  0001 C CNN
F 3 "~" H 10400 3400 50  0001 C CNN
	1    10400 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 2300 9700 2300
Wire Wire Line
	9350 2300 9350 2700
Wire Wire Line
	9350 2700 8750 2700
Wire Wire Line
	8750 2900 9500 2900
Wire Wire Line
	9500 2900 9500 2500
Wire Wire Line
	9500 2500 10100 2500
Wire Wire Line
	9700 2300 9700 2550
Connection ~ 9700 2300
Wire Wire Line
	9700 2300 9350 2300
Wire Wire Line
	10100 2550 10100 2500
Connection ~ 10100 2500
Wire Wire Line
	10100 2500 10250 2500
Wire Wire Line
	10250 2400 9900 2400
Wire Wire Line
	9900 2400 9900 2950
Wire Wire Line
	9900 2950 9700 2950
Wire Wire Line
	9700 2950 9700 2850
Connection ~ 9900 2950
Wire Wire Line
	10100 2850 10100 2950
Wire Wire Line
	10100 2950 9900 2950
$Comp
L Device:C C?
U 1 1 6210E749
P 10000 3800
F 0 "C?" H 10115 3846 50  0000 L CNN
F 1 "100n" H 10115 3755 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 10038 3650 50  0001 C CNN
F 3 "~" H 10000 3800 50  0001 C CNN
	1    10000 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6211143C
P 9600 3850
F 0 "C?" H 9715 3896 50  0000 L CNN
F 1 "100n" H 9715 3805 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 9638 3700 50  0001 C CNN
F 3 "~" H 9600 3850 50  0001 C CNN
	1    9600 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 3300 9500 3100
Wire Wire Line
	9500 3100 8750 3100
Wire Wire Line
	8750 3300 9100 3300
Wire Wire Line
	9100 3300 9100 3500
Wire Wire Line
	9100 3500 10000 3500
Wire Wire Line
	9500 3300 9600 3300
Wire Wire Line
	10200 3400 9800 3400
Wire Wire Line
	9800 3400 9800 4000
Wire Wire Line
	10000 3500 10000 3650
Connection ~ 10000 3500
Wire Wire Line
	10000 3500 10200 3500
Wire Wire Line
	9600 3700 9600 3300
Connection ~ 9600 3300
Wire Wire Line
	9600 3300 10200 3300
Wire Wire Line
	9600 4000 9800 4000
Connection ~ 9800 4000
Wire Wire Line
	9800 4000 9800 4050
Wire Wire Line
	10000 3950 10000 4000
Wire Wire Line
	10000 4000 9800 4000
$Comp
L Connector_Generic:Conn_01x02 J?
U 1 1 62128509
P 6350 2700
F 0 "J?" V 6314 2512 50  0000 R CNN
F 1 "26V" V 6223 2512 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6350 2700 50  0001 C CNN
F 3 "~" H 6350 2700 50  0001 C CNN
	1    6350 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 2700 5600 2700
Wire Wire Line
	6150 2800 6050 2800
Wire Wire Line
	6050 2800 6050 3200
Connection ~ 6050 3200
$Comp
L Connector_Generic:Conn_02x02_Counter_Clockwise J?
U 1 1 62130791
P 7400 2850
F 0 "J?" H 7450 3067 50  0000 C CNN
F 1 "Conn_02x02_Counter_Clockwise" H 7450 2976 50  0000 C CNN
F 2 "" H 7400 2850 50  0001 C CNN
F 3 "~" H 7400 2850 50  0001 C CNN
	1    7400 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 2800 7850 2800
Wire Wire Line
	7850 2800 7850 2850
Wire Wire Line
	7850 2850 7700 2850
Wire Wire Line
	7200 2850 6950 2850
Wire Wire Line
	6950 2550 6950 2850
Wire Wire Line
	7200 2950 7100 2950
Wire Wire Line
	7100 2950 7100 3100
Wire Wire Line
	7100 3100 7700 3100
Wire Wire Line
	7800 3100 7800 2950
Wire Wire Line
	7800 2950 7700 2950
$Comp
L power:+12V #PWR?
U 1 1 6213AA16
P 8000 3100
F 0 "#PWR?" H 8000 2950 50  0001 C CNN
F 1 "+12V" H 8015 3273 50  0000 C CNN
F 2 "" H 8000 3100 50  0001 C CNN
F 3 "" H 8000 3100 50  0001 C CNN
	1    8000 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 3100 8000 3200
Wire Wire Line
	8000 3200 8150 3200
$Comp
L Regulator_Linear:KA78M05_TO252 U?
U 1 1 6213F9D4
P 7200 4150
F 0 "U?" H 7200 4392 50  0000 C CNN
F 1 "KA78M05_TO252" H 7200 4301 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 7200 4375 50  0001 C CIN
F 3 "http://www.fairchildsemi.com/ds/LM/LM78M05.pdf" H 7200 4100 50  0001 C CNN
	1    7200 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 621410C4
P 7200 4550
F 0 "#PWR?" H 7200 4300 50  0001 C CNN
F 1 "GND" H 7205 4377 50  0000 C CNN
F 2 "" H 7200 4550 50  0001 C CNN
F 3 "" H 7200 4550 50  0001 C CNN
	1    7200 4550
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 62141419
P 6500 4100
F 0 "#PWR?" H 6500 3950 50  0001 C CNN
F 1 "+12V" H 6515 4273 50  0000 C CNN
F 2 "" H 6500 4100 50  0001 C CNN
F 3 "" H 6500 4100 50  0001 C CNN
	1    6500 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 3100 7700 4150
Wire Wire Line
	7700 4150 7650 4150
Connection ~ 7700 3100
Wire Wire Line
	7700 3100 7800 3100
Wire Wire Line
	7200 4450 7200 4500
Wire Wire Line
	6500 4100 6500 4150
Wire Wire Line
	6500 4150 6700 4150
$Comp
L Device:C C?
U 1 1 6214C7A3
P 6700 4350
F 0 "C?" H 6815 4396 50  0000 L CNN
F 1 "100n" H 6815 4305 50  0000 L CNN
F 2 "" H 6738 4200 50  0001 C CNN
F 3 "~" H 6700 4350 50  0001 C CNN
	1    6700 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6214D092
P 7650 4350
F 0 "C?" H 7765 4396 50  0000 L CNN
F 1 "100n" H 7765 4305 50  0000 L CNN
F 2 "" H 7688 4200 50  0001 C CNN
F 3 "~" H 7650 4350 50  0001 C CNN
	1    7650 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 6214D3B5
P 7950 4350
F 0 "C?" H 8068 4396 50  0000 L CNN
F 1 "10u" H 8068 4305 50  0000 L CNN
F 2 "" H 7988 4200 50  0001 C CNN
F 3 "~" H 7950 4350 50  0001 C CNN
	1    7950 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6214DA2F
P 8300 4350
F 0 "C?" H 8415 4396 50  0000 L CNN
F 1 "10n" H 8415 4305 50  0000 L CNN
F 2 "" H 8338 4200 50  0001 C CNN
F 3 "~" H 8300 4350 50  0001 C CNN
	1    8300 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 4150 7950 4150
Wire Wire Line
	8300 4150 8300 4200
Connection ~ 7700 4150
Wire Wire Line
	7650 4200 7650 4150
Connection ~ 7650 4150
Wire Wire Line
	7650 4150 7500 4150
Wire Wire Line
	7950 4200 7950 4150
Connection ~ 7950 4150
Wire Wire Line
	7950 4150 8300 4150
Wire Wire Line
	6700 4150 6700 4200
Connection ~ 6700 4150
Wire Wire Line
	6700 4150 6900 4150
Wire Wire Line
	6700 4500 7200 4500
Connection ~ 7200 4500
Wire Wire Line
	7200 4500 7200 4550
Wire Wire Line
	7200 4500 7650 4500
Wire Wire Line
	7650 4500 7950 4500
Connection ~ 7650 4500
Wire Wire Line
	7950 4500 8300 4500
Connection ~ 7950 4500
$EndSCHEMATC
