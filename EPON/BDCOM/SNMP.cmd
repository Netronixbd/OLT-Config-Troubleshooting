User Access Verification

Username: admin
Password:


                 Welcome to BDCOM P3310D EPON OLT


switch>
switch>ena
switch#config
switch_config#snmp-server community 0 noc rw
switch_config#snmp-server host 10.20.2.2 noc authentication configure snmp
switch_config#write all
Saving current configuration...
OK!
Now saving current ifindex to flash memory...
OK!
switch_config#exit
switch#
