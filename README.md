# Net-UP
Network-based Startup Module Framework (Network Dropper)

Net-UP is a Bash Framework to make loading Scripts that depend on internet connectivity
to start ONLY when connected. We (Private-Locker & Myself) use this Framework with a 
series of "Homemade Modules". Net-UP also allows use to drop a network scan script,
into a secure network to gain intelligence about the network. (subscan module)

### Features:
- Network-based Startup Script. -- If no Connection on selected INTERFACE, 120 seconds,
    then restarts device. (Set in a loop with a Cronjob)
- Easy intergration with Existing Bash/Python/Perl/Ruby Scripts. via Modules 
    (Read README.txt inside modules folder)
- Enablemod/Disablemod commands to help with toggling Modules ON/OFF. - Located in Modules
    folder.
### Modules:
- Subscan - Original Subnet Nmap Scan by -REDD-
- PythonBackdoor - Python Tunnel Backdoor by -REDD-
- HackCaptivePortals - Script forked from https://github.com/systematicat/hack-captive-portals
- IPInfo - Script forked from https://github.com/niklasberglund/ipinfo
- More to come.. (Community Published Modules are welcome)

## Easy Install Script:
```sh
wget https://raw.githubusercontent.com/private-locker/Net-UP/master/install.sh && sudo /bin/bash install.sh
```

## Syntax/Examples:
```sh

Syntax: ./netup
        ./netup [enable/disable/list/run/updatemods] [module]

Examples:
    ./netup help                    - This help screen displayed.
    ./netup updatemods              - Sync's all Modules with Public Repo.
    ./netup list                    - Shows all enabled/disabled modules.
    ./netup run listmods            - Runs specific module/script using NET-UP.
    ./netup enable subscan          - Enables Subscan module for NET-UP.
    ./netup disable pythonbackdoor  - Disables Backdoor module for NET-UP.
    
```




### TODO List:
- Adding stuff here later.


### Huge Thanks to -REDD- of Private-Locker for building this whole Project.

License
----

The MIT License

Copyright (c) 2018-2018 Private-Locker, LLC. https://www.private-locker.com

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
