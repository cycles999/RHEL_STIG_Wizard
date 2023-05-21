#!/bin/bash

decide() {
    #$1 = code (v-2000)
    #$2 = description
    #$3 = fix commands
    #$4 = detect commands
    
    #if fix command is empty, say that you cant fix
    
    read -p "f (auto fix)/ d (detect)/ n (nothing)" decision
    if [[ "$decision" == "f" ]] 
    then
        echo "you chose to auto fix"
    fi
    if [[ "$decision" == "d" ]] 
    then
        echo "you chose to detect"
    fi
    if [[ "$decision" == "n" ]]
    then
        echo "you chose to do nothing"
    fi
}

V244541[code]="V-244541"
V244541[description]="RHEL 8 must not allow blank or null passwords in the system-auth file."
V244541[fix]="sed -i \"s/nullok//g\"/etc/pam.d/system-auth"
V244541[detect]="grep -i nullok /etc/pam.d/system-auth"

V244540[code]="V-244540"
V244540[description]="RHEL 8 must not allow blank or null passwords in the password-auth file."
V244540[fix]="sed -i \"s/nullok//g\"/etc/pam.d/password-auth"
V244540[detect]="grep -i nullok /etc/pam.d/password-auth"

V244540[code]="V-244540"
V244540[description]="RHEL 8 must not allow blank or null passwords in the password-auth file."
V244540[fix]="sed -i \"s/nullok//g\"/etc/pam.d/password-auth"
V244540[detect]="grep -i nullok /etc/pam.d/password-auth"

V230380[code]="V-230380"
V230380[description]="RHEL 8 must not allow accounts configured with blank or null passwords."
V230380[fix]=""
V230380[detect]="awk -F: \\'$2 == \"\" { print $1, \"has empty password!. Please set a strong password ASAP!!\" }\\' /etc/shadow"



decide
