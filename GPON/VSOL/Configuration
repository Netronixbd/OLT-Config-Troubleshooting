VSOL GPON OLT Default Access Info
IP Address: 192.168.8.200

Username: admin
Password: Xpon@Olt9417#

Initial Configuration & VLAN Setup
# Login and Enable Mode
=======================
Username: admin
Password: Xpon@Olt9417#
gpon-olt> ena
enable password: Xpon@Olt9417#

# Basic VLAN Configuration
==========================
gpon-olt# configure terminal
gpon-olt(config)# vlan 500 - 508
gpon-olt(config)# exit

# Uplink Port Configuration (GE 0/9)
====================================
gpon-olt(config)# interface gigabitethernet 0/9
gpon-olt(config-if-ge0/9)# switchport mode trunk
gpon-olt(config-if-ge0/9)# switchport trunk VLAN 500 - 508
gpon-olt(config-if-ge0/9)# exit

Remote Management & Telnet
# Assign IP Address for Remote Access
======================================
gpon-olt(config)# interface vlan 500
gpon-olt(interface-vlan-500)# ip address 10.20.30.10 255.255.255.252
gpon-olt(interface-vlan-500)# exit

# Routing & Telnet Access
==========================
gpon-olt(config)# ip route 0.0.0.0/0 10.20.30.9
gpon-olt(config)# no login-access-list deny telnet 0.0.0.0 0.0.0.0

Profiles Configuration
# Creating ONU Profile
=======================
gpon-olt(config)# profile onu id 10 name xpononu
gpon-olt(profile-onu:10)# port-num eth 1
gpon-olt(profile-onu:10)# commit
gpon-olt(profile-onu:10)# exit
gpon-olt(config)# onu auto-learn default-onu-profile expon

# Creating DBA Profile
=======================
gpon-olt(config)# profile dba id 10 name dbaxpon
gpon-olt(config)# type 4 maximum 1024000
gpon-olt(config)# commit
gpon-olt(config)# exit

# Creating Service Profile
===========================
gpon-olt(config)# profile srv id 10 name srv_pon1_vlan_501
gpon-olt(profile-srv:10)# portvlan eth 1 mode tag vlan 501
gpon-olt(profile-srv:10)# commit
gpon-olt(profile-srv:10)# exit

# Creating Line Profile
========================
gpon-olt(config)# profile line id 10 name line_pon1_vlan_501
gpon-olt(profile-line:10)# tcont 1 name 1 dba dbagpon
gpon-olt(profile-line:10)# gemport 1 tcont 1 gemport_name 1
gpon-olt(profile-line:10)# service internet gemport 1 VLAN 501
gpon-olt(profile-line:10)# service-port 1 gemport 1 uservlan 501 VLAN 501
gpon-olt(profile-line:10)# commit
gpon-olt(profile-line:10)# exit

PON Port Binding
# Bind Profile to PON port 0/1
===============================
gpon-olt(config)# interface gpon 0/1
gpon-olt(config-pon-0/1)# onu auto-learn
gpon-olt(config-pon-0/1)# onu auto-learn srv-profile name srv_pon1_vlan_501
gpon-olt(config-pon-0/1)# onu auto-learn line-profile name line_pon1_vlan_501
gpon-olt(config-pon-0/1)# exit
