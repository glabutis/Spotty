#!/bin/bash
printf "\n \n \n \n \n \n \n \n \n \n \nOSC HUB 14.0 \n \n \n \n"
while read -n1 -r -p "" && [[ $REPLY != q ]]; do
  case $REPLY in
    1) printf "[Half]\n \n";
	sendosc $ATEMIP 8888 /atem/macros/7/run f 9.000
		while read -n1 -r -p "" && [[ $REPLY != q ]]; do
  	case $REPLY in
   	 1) 	printf "[Full]\n \n";
		sendosc $ATEMIP 8888 /atem/macros/6/run f 9.000
		break;;
    c) printf "\n[canceled]"
		sendosc $ATEMIP 8888 /atem/macros/11/run f 1.000
		break;;
	2) 	printf "[ON/OFF]\n \n";
		sendosc $ATEMIP 8888 /atem/macros/11/run f 9.000;;
		#break;;
    h) printf "[1] Half/Full (6)\n[c] Exit (7)\n[2] On/Off (11)\n[t] Test\n[h] Help";;
    t)     printf "\n[TEST1]";
		sendosc $ATEMIP 8888 /atem/preview/1000 f 9.000;;
    #*) printf "\n[invalid]";
     #break;;
  	esac
	done;;
    c) printf "\n[canceled]"
	sendosc $ATEMIP 8888 /atem/macros/11/run/ f 1.000
	break;;
	2) 	printf "[ON/OFF]\n \n";
		sendosc $ATEMIP 8888 /atem/macros/11/run f 9.000;;
 	t)     printf "\n[TEST2]";
    		sendosc $ATEMIP 8888 /atem/preview/1000 f 9.000;;
     h) printf "[1] Half/Full (6)\n[c] Exit (7)\n[2] On/Off (11)\n[t] Test\n[h] Help";;
        #break;;
    #*) printf "\n[invalid]";
   esac
done
