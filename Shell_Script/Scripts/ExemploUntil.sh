#!/bin/bash

until ps axu |grep gnome-calculator |grep -v grep > /dev/null
do
	echo Inicie a Calculadora...
	sleep 3
	echo
done

echo Calculadora Iniciada.
echo PID: $(pgrep gnome-calculato)
