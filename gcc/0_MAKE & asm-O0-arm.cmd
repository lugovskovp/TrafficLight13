:: Использование: 
:: c:\path_to_ino_file\0_MAKE & asm.cmd FILE.ino

:: For Notepad++ use F5 and in command window enter: "C:\Users\p.lugovskov\Documents\Arduino\TrafficLight13\gcc\0_MAKE & asm-O0.cmd" $(FULL_CURRENT_PATH)

:: Переход в директорию исходника
cd "%~p1"

:: Создать директорию, почистить внутри файлы, если есть
@mkdir Release
@cd Release
@del -y "%~n1.elf"
@del -y "%~n1.o"
@del -y "%~n1.hex"
@cd ..

::avr-gcc.exe --h
:: Сделать копию с расширением срр
//copy %1 %~n1.cpp

:: Путь к ехе установленным arduino
set AVRBINPATH="c:\Users\p.lugovskov\AppData\Local\arduino15\packages\arduino\tools\avr-gcc\5.4.0-atmel3.6.1-arduino2\bin"

::set TARGET="attiny13"
:: arm-none-eabi-gcc.exe  --version: 6.3.1 20170620 (release)
@set ARMGCC="c:\STM32\GNU Tools ARM Embedded\6 2017-q2-update\bin\arm-none-eabi-gcc.exe" 
@set ARMOBJ="c:\STM32\GNU Tools ARM Embedded\6 2017-q2-update\arm-none-eabi\bin\objcopy.exe" 
@set ARMDUMP="c:\STM32\GNU Tools ARM Embedded\6 2017-q2-update\arm-none-eabi\bin\objdump.exe" 
@set ARMSIZE="c:\STM32\GNU Tools ARM Embedded\6 2017-q2-update\bin\arm-none-eabi-size.exe" 


set TARGET="cortex-m3"
set TARGET="cortex-m0"
set TARGET="arm7"xscale
set TARGET="cortex-m7"
set TARGET="xscale"
set TARGET="cortex-a53"

:: компилировать
@%ARMGCC% -Wall -O0 -mcpu=%TARGET% -c "%~n1.cpp" -o "./Release/%~n1.o" 
@%ARMGCC% -Wall -O0 -mcpu=%TARGET% -c "%~n1-g.cpp" -o "./Release/%~n1-g.o"
:: линкер
@%ARMGCC% -Wall -O0 -mcpu=%TARGET% --specs=nosys.specs -o "./Release/%~n1.elf" "./Release/%~n1.o"
@%ARMGCC% -Wall -O0 -mcpu=%TARGET% --specs=nosys.specs -o "./Release/%~n1-g.elf" "./Release/%~n1-g.o"
:: hex файл
@%ARMOBJ% -j .text -j .data -O ihex "./Release/%~n1.elf" "./Release/%~n1.hex"
@%ARMOBJ% -j .text -j .data -O ihex "./Release/%~n1-g.elf" "./Release/%~n1-g.hex"
:: показать размер - что получилось то
set a=LOCAL
@%ARMSIZE% "./Release/%~n1.elf"
set a=GLOBAL
@%ARMSIZE% "./Release/%~n1-g.elf"
:: создать asm в файл с тем же именем
@%ARMDUMP%  -S "./Release/%~n1.elf">"./Release/%~n1.asm"
pause
exit

@cd Release
@echo "------------------------------------------------------------------"
@type "%~n1.asm"

pause
  Known ARM CPUs (for use with the -mcpu= and -mtune= options):
    arm1020e arm1020t arm1022e arm1026ej-s arm10e arm10tdmi arm1136j-s
    arm1136jf-s arm1156t2-s arm1156t2f-s arm1176jz-s arm1176jzf-s arm2 arm250
    arm3 arm6 arm60 arm600 arm610 arm620 arm7 arm70 arm700 arm700i arm710
    arm7100 arm710c arm710t arm720 arm720t arm740t arm7500 arm7500fe arm7d
    arm7di arm7dm arm7dmi arm7m arm7tdmi arm7tdmi-s arm8 arm810 arm9 arm920
    arm920t arm922t arm926ej-s arm940t arm946e-s arm966e-s arm968e-s arm9e
    arm9tdmi cortex-a12 cortex-a15 cortex-a15.cortex-a7 cortex-a17
    cortex-a17.cortex-a7 cortex-a32 cortex-a35 cortex-a5 cortex-a53 cortex-a57
    cortex-a57.cortex-a53 cortex-a7 cortex-a72 cortex-a72.cortex-a53 cortex-a8
    cortex-a9 cortex-m0 cortex-m0.small-multiply cortex-m0plus
    cortex-m0plus.small-multiply cortex-m1 cortex-m1.small-multiply cortex-m23
    cortex-m3 cortex-m33 cortex-m4 cortex-m7 cortex-r4 cortex-r4f cortex-r5
    cortex-r7 cortex-r8 ep9312 exynos-m1 fa526 fa606te fa626 fa626te fa726te
    fmp626 generic-armv7-a iwmmxt iwmmxt2 marvell-pj4 mpcore mpcorenovfp native
    qdf24xx strongarm strongarm110 strongarm1100 strongarm1110 xgene1 xscale
