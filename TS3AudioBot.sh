#!/bin/bash

if [ "$1" == "start" ]; then
    if ! screen -list | grep -w "TS3AudioBot"; then
		screen -dmS TS3AudioBot dotnet TS3AudioBot.dll
		echo -e "\033[1;37mWlaczono TS3AudioBot!\033[0m"
	else
		echo -e "\033[1;37mTS3AudioBot jest juz wlaczony!\033[0m"
	fi
elif [ "$1" == "stop" ]; then
    if screen -list | grep -w "TS3AudioBot"; then
		screen -S TS3AudioBot -p 0 -X stuff ^C
		echo -e "\033[1;37mWylaczono TS3AudioBot!\033[0m"
	else
		echo -e "\033[1;37mTS3AudioBot nie jest wlaczony!\033[0m"
	fi
elif [ "$1" == "restart" ]; then
    if screen -list | grep -w "TS3AudioBot"; then
		screen -S TS3AudioBot -p 0 -X stuff ^C
		screen -dmS TS3AudioBot dotnet TS3AudioBot.dll
		echo -e "\033[1;37mZrestartowano TS3AudioBot!\033[0m"
	else
		screen -dmS TS3AudioBot dotnet TS3AudioBot.dll
		echo -e "\033[1;37mZrestartowano TS3AudioBot!\033[0m"
	fi
else
	echo -e "\033[1;37m./TS3AudioBot [start|stop|restart]\033[0m"
fi

