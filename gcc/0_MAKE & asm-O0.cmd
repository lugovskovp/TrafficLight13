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
copy %1 %~n1.cpp

:: Путь к ехе установленным arduino
set AVRBINPATH="c:\Users\p.lugovskov\AppData\Local\arduino15\packages\arduino\tools\avr-gcc\5.4.0-atmel3.6.1-arduino2\bin"

:: компилировать
::@%AVRBINPATH%\avr-gcc.exe -Wall -Os -mmcu=attiny13 -c "%~n1.cpp" -o "./Release/%~n1.o"
@%AVRBINPATH%\avr-gcc.exe -Wall -O0 -mmcu=attiny13 -c "%~n1.cpp" -o "./Release/%~n1.o"

:: линкер
@%AVRBINPATH%\avr-gcc.exe -Wall -Os -mmcu=attiny13 -o "./Release/%~n1.elf" "./Release/%~n1.o"

:: hex файл
@%AVRBINPATH%\avr-objcopy.exe -j .text -j .data -O ihex "./Release/%~n1.elf" "./Release/%~n1.hex"

:: показать размер - что получилось то
@%AVRBINPATH%\avr-size.exe --format=avr --mcu=attiny13 "./Release/%~n1.elf"

pause

:: создать и показать asm в файл с тем же именем
::@%AVRBINPATH%\avr-objdump.exe -d "./Release/%~n1.elf">>"./Release/%~n1.asm"
@%AVRBINPATH%\avr-objdump.exe -S "./Release/%~n1.elf">"./Release/%~n1.asm"

@cd Release
@echo "------------------------------------------------------------------"
@type "%~n1.asm"

pause
