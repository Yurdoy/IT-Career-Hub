#!/bin/bash

#Написать скрипт, который будет бесконечно пинговать указанный адрес 
#(переменная или ввод пользователя) с интервалом 1 секунда между попытками. 
#Если время пинга превышает 100 мс или не удается выполнить пинг 
#в течение 3 последовательных отправок пакетов, скрипт просто выведет сообщения об этом. 

pingCheck() {

read -p "Enter ping address: " address

timeout=3
count=0

	while true; 
		do
			ping $address
			sleep 1
	done

pingResult=$(ping $count $address)

	if [[ $pingResult =~ "100% packet loss" ]];
		then
			echo "Unable to perform ping"
		elif [[ $pingResult =~ "ms" ]];
			then
				echo "Responding time more then 100ms"
			else 
				echo "Ping performed successfuly"
	fi

}

pingCheck




