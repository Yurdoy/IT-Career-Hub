#!/bin/sh
#
#
# При запуске без ключа автоматически обновим программу из переменной ниже 
# C параметро install устанавливаем список пакетов  из файла version_install.txt
#
PROGRAMM="radar"
#
HOME="/home/user/bin/rld"
INSTALLDIR="/opt/radar_display"
BACKUPCFG="/opt/radar-display-cfg/"
BINARI="./rld"
#
#
#
case "$1" in
"" ) # Авто обновление 
echo "$PROGRAMM"  # Программа для обновления
if sudo apt update && sudo apt list --upgradable | grep "$PROGRAMM" > $HOME/upgradable.txt  # Проверяем наличие обновлений 
then {
    sudo dpkg --list | grep "$PROGRAMM" | awk '{print $2"="$3}' > $HOME/version_old.txt;    # Сохраняем список старых версий для отката
    sudo apt install `cat  $HOME/upgradable.txt | awk -F '/smolensk' '{split($2,a," "); print $1"="a[1]}'` <<-EOF
yes
EOF
sudo chown -R user.user $INSTALLDIR; 
#cp $BACKUPCFG* $INSTALLDIR/cfg/;
cd $INSTALLDIR;
exec "$BINARI" &  # Запускаем и ждем 55 sec
sleep 55;
PID=$(pidof $BINARI) 
if test -z "$PID"  # Проверяем что запустилась
then  # Если Не запустилась или сразу упала откатим на старую версию
    { 
	echo `date` "Not started" \ >> $HOME/strar_result.txt   
        sudo dpkg --list | grep "$PROGRAMM" | awk '{print $2"="$3}' > $HOME/version_new.txt
	sudo apt remove `cat $HOME/version_new.txt` <<-EOF 
yes 
EOF
	sudo apt install `cat $HOME/version_old.txt`<<-EOF
yes 
EOF
	exit 1
    }
else # Запустилось
    { 
	echo `date` "Started Ok! PID=" $PID  \ >> $HOME/strar_result.txt
	kill -9 $PID
	echo  `date` "Killed PID=" $PID >> $HOME/strar_result.txt
	exit 1
    }
fi;
    }
 else   echo `date` "Not update" \ >> $HOME/strar_result.txt;  # Обновлений не было 

fi;
;;

install) 
	sudo apt install `cat $HOME/version_install.txt`<<-EOF
yes
EOF

	exit 1
;;
esac
exit 0
