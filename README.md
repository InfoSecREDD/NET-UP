# NET-UP - Network Based Framework
[![made-with-bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/) ![BuildMessage](https://img.shields.io/badge/Build-Passed-brightgreen) [![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/InfoSecREDD/NET-UP/graphs/commit-activity) [![GitHub release](https://img.shields.io/github/release/InfoSecREDD/NET-UP.svg)](https://GitHub.com/InfoSecREDD/NET-UP/releases/) [![Contributions Welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/InfoSecREDD/NET-UP/issues)

Network-based Startup Module Framework (Network Dropper)

NET-UP is a Custom Bash Framework to make loading and launching Scripts that depend on
internet connectivity to start ONLY when connected. InfoSecREDD uses this Framework 
with a series of Modules (see below for more information) to do Security Auditing at 
local Corporations. NET-UP also allows the use of MANY scripts to run - OSINT Scripts,
Network Monitoring Scripts (MitM Attacks), Packet Capturing, and Basic Security 
Auditing. NET-UP was also designed to just use One Command to run. Doing so allow easy
execution of cronjobs or startup based scripts. 

### Features:
- Based on Native Bash Shell to allow flexibility.
- Auto Interface Detected Script (to manually set interface see below)
- Easy to Configure Commands and Variables.
- Easy to Install script. (located below)
- One Command runs the whole Script. - Can be used for Cronjobs/and other Scripting.
- Network-based Startup Script. -- If no Connection on selected INTERFACE, 120 seconds,
    then restarts device. (Set in a loop with a Cronjob - "netup autostart on" command.)
- Easy intergration with Existing Bash/Python/Perl/Ruby Scripts. via Modules 
    (Read README.txt inside modules folder.)

### Supported OS(s):
 - Ubuntu                         ⇨
 **Status:** ![BuildMessage](https://img.shields.io/badge/Build-Passed-brightgreen)
 - Debian                         ⇨
 **Status:** ![BuildMessage](https://img.shields.io/badge/Build-Passed-brightgreen)
 - Kali                           ⇨
 **Status:** ![BuildMessage](https://img.shields.io/badge/Build-Passed-brightgreen)
 - ParrotOS                       ⇨ 
 **Status:** ![BuildMessage](https://img.shields.io/badge/Build-Passed-brightgreen)
 - BlackBuntu                     ⇨
 **Status:** ![BuildMessage](https://img.shields.io/badge/Build-Unknown-lightgrey)
 - Mint                           ⇨
 **Status:** ![BuildMessage](https://img.shields.io/badge/Build-Unknown-lightgrey)
## Non-Supported but semi-functional OS(s):
 - Windows Ubuntu Subsystem       ⇨
 **Status:** ![BuildMessage](https://img.shields.io/badge/Build-Errors-orange)
 - Windows Kali Subsystem:        ⇨
 **Status:** ![BuildMessage](https://img.shields.io/badge/Build-Errors-orange)

### Developed on:
 - Kali 2019.2 Operating System
 - Raspberry Pi 3 B

### Modules:
- Subscan - Original Subnet Nmap Scan by -REDD-
- PythonBackdoor - Python Tunnel Backdoor by -REDD-
- HackCaptivePortals - Script forked from https://github.com/systematicat/hack-captive-portals (needs work)
- IPInfo - Script forked from https://github.com/niklasberglund/ipinfo (needs work)
- More to come.. (Community Published Modules are welcome)

(For More Reference on Modules/Scripts used for NET-UP, Please Check https://github.com/InfoSecREDD/NET-UP-modules)

## Easy Install Script:
```bash
wget https://raw.githubusercontent.com/InfoSecREDD/NET-UP/master/install.sh && sudo /bin/bash install.sh

```

Once Installed, allows you to:

## Run NET-UP:
```
netup
```
## Show NET-UP Directory/Version Information:
```
netup information
```
## Auto-detect Active Network Interface:
```
netup interface
```
## List all Modules:
```
netup list
```
## Easy Update Command:
```
netup update
```
(Press y when prompted. or "netup update -y" to force update.)

## Update only NET-UP (Backup & Restore Current Modules)
```
netup update --netup-only   (or netup update -n)
```
(Press y when prompted. or "netup update --netup-only -y" to force update.)

## Easy Update Modules Command:
```
netup updatemods
```
(Press y when prompted. or "netup updatemods -y" to force update of modules.)

## Syntax/Examples:
```

Syntax: ./netup
        ./netup [option] [module]/[on/off]

Examples:
    ./netup help                    - This help screen displayed.
    ./netup update                  - Updates entire NET-UP & Modules with Public Repo.
    ./netup information             - Displays current NET-UP Information.
    ./netup interface               - Automattically sets INTERFACE Variable.
    ./netup update                  - Updates NET-UP to Current GitHub Version.
    ./netup enablemods              - Enables all Modules in the Modules Folder.
    ./netup disablemods             - Disables all Modules in the Modules Folder.
    ./netup updatemods              - Syncs all Modules with Public Repo.
    ./netup autostart [on/off]      - Turns on/off crontab for NET-UP.
    ./netup autoreboot [on/off]     - Turns on/off AUTOREBOOT for NET-UP.
    ./netup autoexit [on/off]       - Turns on/off AUTOEXIT for NET-UP.
    ./netup list                    - Shows all enabled/disabled modules.
    ./netup run [module]            - Runs specific module/script using NET-UP.
    ./netup enable [module]         - Enables Selected module for NET-UP.
    ./netup disable [module]        - Disables Selected module for NET-UP.

```

## To Manually Set Network Interface of NET-UP:
Inside of "netup" file -
```sh
...
#############################################################
## User Adjustable Variables. - For More info please read  ##
##   the README.txt in the modules folder.                 ##
#############################################################

INTERFACE=eth0
AUTOREBOOT=NO
AUTOEXIT=YES
...
```
Change eth0 on INTERFACE Variable to desired Interface Name.

Example:
```sh
...
#############################################################
## User Adjustable Variables. - For More info please read  ##
##   the README.txt in the modules folder.                 ##
#############################################################

INTERFACE=ensp0
AUTOREBOOT=NO
AUTOEXIT=YES
...
```


### TODO List:
- Add more OSINT Scripts to https://github.com/InfoSecREDD/NET-UP-modules

## Contributors:
 - InfoSecREDD (Main Developer)
 - Sero of Thoth (Bugfixes and alternate Coding Methods)

License
----

The MIT License

Copyright (c) 2018-2023 InfoSecREDD https://infosecredd.github.io

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
