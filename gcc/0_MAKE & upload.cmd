:: Использование: 
:: "c:\path_to_ino_file\0_MAKE & upload.cmd" FILE.ino

:: For Notepad++ use F5 and in command window enter: "C:\Users\p.lugovskov\Documents\Arduino\TrafficLight13\gcc\0_MAKE & upload.cmd" $(FULL_CURRENT_PATH)

:: Переход в директорию исходника
cd %~p1
 
:: Создать директорию, почистить внутри файлы, если есть
@mkdir Release
@cd Release
@del -y "%~n1.elf"
@del -y "%~n1.o"
@del -y "%~n1.hex"
@cd ..

::avr-gcc.exe --h
copy %1 %~n1.cpp

:: Путь к ехе установленный arduino
set AVRBINPATH="c:\Users\p.lugovskov\AppData\Local\arduino15\packages\arduino\tools\avr-gcc\5.4.0-atmel3.6.1-arduino2\bin"

:: компилировать
@%AVRBINPATH%\avr-gcc.exe -Wall -Os -mmcu=attiny13 -c "%~n1.cpp" -o "./Release/%~n1.o"

:: линковать
@%AVRBINPATH%\avr-gcc.exe -Wall -Os -mmcu=attiny13 -o "./Release/%~n1.elf" "./Release/%~n1.o"

:: hex файл
@%AVRBINPATH%\avr-objcopy.exe -j .text -j .data -O ihex "./Release/%~n1.elf" "./Release/%~n1.hex"


:: показать размер - что получммлось то
@%AVRBINPATH%\avr-size.exe --format=avr --mcu=attiny13 "./Release/%~n1.elf"

:: Ну и залить что получилось в кристалл - 
:: !!! avrdude.conf от MicroCore !!!
@C:\Users\p.lugovskov\AppData\Local\arduino15\packages\arduino\tools\avrdude\6.3.0-arduino14\bin\avrdude.exe "-CC:\Users\p.lugovskov\AppData\Local\arduino15\packages\MicroCore\hardware\avr\1.0.3/avrdude.conf" -p t13a -c usbasp -b 115200 "-Uflash:w:./Release/%~n1.hex:a" -q

pause
exit

