#!/bin/bash

echo "#RHEL STIG Script" > stiggy.sh

decide() {
    #$1 = code (v-2000)
    #$2 = description
    #$3 = fix commands
    #$4 = detect commands
    
    echo "Code: $1"
    echo "Description: $2"
    
    read -p "f (auto fix)/ d (detect)/ n (nothing)" decision
    if [[ "$decision" == "f" ]] 
    then
        echo "you chose to auto fix"
	echo $3 >> stiggy.sh
    fi
    if [[ "$decision" == "d" ]] 
    then
        echo "you chose to detect"
	echo $4 >> stiggy.sh
    fi
    if [[ "$decision" == "n" ]]
    then
        echo "you chose to do nothing"
	echo "Script was configured to do nothing for $1" >> stiggy.sh
    fi
}

V244541[code]="V-244541"
V244541[description]="RHEL 8 must not allow blank or null passwords in the system-auth file."
V244541[fix]="sed -i \"s/nullok//g\"/etc/pam.d/system-auth"
V244541[detect]="grep -i nullok /etc/pam.d/system-auth"

decide "${V244541[code]}" "${V244541[description]}" "${V244541[fix]}" "${V244541[detect]}"

V244540[code]="V-244540"
V244540[description]="RHEL 8 must not allow blank or null passwords in the password-auth file."
V244540[fix]="sed -i \"s/nullok//g\"/etc/pam.d/password-auth"
V244540[detect]="grep -i nullok /etc/pam.d/password-auth"

decide "${V244540[code]}" "${V244540[description]}" "${V244540[fix]}" "${V244540[detect]}"

V230380[code]="V-230380"
V230380[description]="RHEL 8 must not allow accounts configured with blank or null passwords."
V230380[fix]="#There are no sufficient automatic fixes for ${V230380[code]}"
V230380[detect]="awk -F: \\'$2 == \"\" { print $1, \"has empty password!. Please set a strong password ASAP!!\" }\\' /etc/shadow"

decide "${V23080[code]}" "${V23080[description]}" "${V23080[fix]}" "${V23080[detect]}"

V230284[code]="V-230384"
V230284[description]="There must be no .shosts files on the RHEL 8 operating system."
V230284[fix]="#There are no sufficient automatic fixes for ${V230284[code]}"
V230284[detect]="find / -name \'*.shosts'"

decide "${V230284[code]}" "${V230284[description]}" "${V230284[fix]}" "${V230284[detect]}"

V230283[code]="V-230383"
V230283[description]="There must be no shosts.equiv files on the RHEL 8 operating system."
V230283[fix]="#There are no sufficient automatic fixes for ${V230283[code]}"
V230283[detect]="find / -name shosts.equiv"

decide "${V230283[code]}" "${V230283[description]}" "${V230283[fix]}" "${V230283[detect]}"

V230487[code]="V-230487"
V230487[description]="RHEL 8 must not have the telnet-server package installed."
V230487[fix]="yum remove telnet-server"
V230487[detect]="yum list installed telnet-server"

decide "${V230487[code]}" "${V230487[description]}" "${V230487[fix]}" "${V230487[detect]}"

V230534[code]="V-230534"
V230534[description]="The root account must be the only account having unrestricted access to the RHEL 8 system."
V230534[fix]="#There are no sufficient automatic fixes for ${V230534[code]}"
V230534[detect]="awk -F: '$3 == 0 {print $1}' /etc/passwd"

decide "${V230534[code]}" "${V230534[description]}" "${V230534[fix]}" "${V230534[detect]}"

V230533[code]="V-230533"
V230533[description]="The Trivial File Transfer Protocol (TFTP) server package must not be installed if not required for RHEL 8 operational support."
V230533[fix]="yum remove tftp-server"
V230533[detect]="yum list installed tftp-server"

decide "${V230533[code]}" "${V230533[description]}" "${V230533[fix]}" "${V230533[detect]}"

V230492[code]="V-230492"
V230492[description]="RHEL 8 must not have the rsh-server package installed."
V230492[fix]="yum remove rsh-server"
V230492[detect]="yum list installed rsh-server"

decide "${V230492[code]}" "${V230492[description]}" "${V230492[fix]}" "${V230492[detect]}"

V230239[code]="V-230239"
V230239[description]="The krb5-workstation package must not be installed on RHEL 8."
V230239[fix]="yum remove krb5-workstation"
V230239[detect]="yum list installed krb5-workstation"

decide "${V230239[code]}" "${V230239[description]}" "${V230239[fix]}" "${V230239[detect]}"

V244549[code]="V-244549"
V244549[description]="All RHEL 8 networked systems must have SSH installed."
V244549[fix]="yum install openssh-server.x86_64"
V244549[detect]="yum list installed openssh-server.x86_64"

decide "${V244549[code]}" "${V244549[description]}" "${V244549[fix]}" "${V244549[detect]}"
