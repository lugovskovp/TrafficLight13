# Traffic Light DIY toy on ATtiny13 (or ATMega328).
Features:
- Used 4 pins for control 12 dumbs LEDs, plus one pin for button.
- ISP programming for ATtiny13, RESET pin **not** used.
- Traffic Light signals are fully compatible with [Vienna Convention on Road Signs and Signals](https://en.wikipedia.org/wiki/Vienna_Convention_on_Road_Signs_and_Signals#Traffic_lights).
- Work from one 1.5v Alcaline AA battery.
- I trust my dauther then she describe it as "cutie".
- Short pressing button change working between next modes:
  - Amber flashing.
  - Red -> Red and Amber -> Green -> Flashing Green -> Amber -> Red -> ...
- Long push button for sleep|wakeup Traffic Light to|from power down mode.

## Table of contents
* [Directories & description](#directories-and-files-description)
* [Source - supported MCU](#is-this-stuff-for-attiny-or-atmega)
* [How it seems?](#youtube-video-of-traffic-light-working)

![Schematic screenshot](https://github.com/lugovskovp/TrafficLight13/blob/master/pix/02-03.png)

## Directories and files description
 + [***TrafficLight13***](https://github.com/lugovskovp/TrafficLight13/tree/master/TrafficLight13)  Source code, C language altrouth .ino (arduino) extention of file.
 	+ *TrafficLight13.ino*
	+ *TrafficLight13.vcxproj*
	+ *TrafficLight13.vcxproj.filters*
 + [***docs***](https://github.com/lugovskovp/TrafficLight13/tree/master/docs)  Documentation. Appnotes, datasheets ect.
	+ *ATtiny13A datasheet.pdf*
 	+ *ATmega328 datasheet.pdf*
	+ *AVR4013 — PicoPower basics.pdf*
	+ *AVR4027 - Tips and Tricks to Optimize Your C Code.pdf*
	+ *Button state machine.vsd*
	+ *power.xlsx*
 + [***gcc***](https://github.com/lugovskovp/TrafficLight13/tree/master/gcc)  One pair command files for win-cmd shell: compile and upload firmware to ATtiny13.
 	+ *0_MAKE & asm.cmd*
	+ *0_MAKE & upload.cmd*
 + [***pix***](https://github.com/lugovskovp/TrafficLight13/tree/master/pix) Project pictures.
 	+ *arduino pro mini pinout.png*
	+ *attiny13 min setup.png*
	+ *Button state machine.jpg*
	+ *usbasp pinout.png*
	+ *vs scr.png*
	+ *led colors and voltages.jpg*
	+ *attiny13piout.jpg*
 + [***schematic***](https://github.com/lugovskovp/TrafficLight13/tree/master/schematic) Schematic Layout and PCB design files for [DipTrace](https://diptrace.com/) CAD.
	+ *traffic light ver0.dch*
	+ *traffic light.dch*
	+ *traffic light.dip*
	
 ## Is this stuff for ATtiny or ATMega?
 PCB only for ATtiny13.
 Source code of programm fully works on ATtiny13, but on ATMega328 not realised only button functions. 
 
 ## Youtube video of Traffic Light working
 Oups, You should understand Russian voice, sorry. )))) Or You can press Mute and just get pleasure from light show, its awesome.
 
[![I think this is awesome](https://img.youtube.com/vi/23ju4JVKMeA/0.jpg)](https://www.youtube.com/watch?v=23ju4JVKMeA)

