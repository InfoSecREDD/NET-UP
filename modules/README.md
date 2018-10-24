The Modules Folder of NET-UP - This Folder will read any bash/shell/
python/perl/ruby/etc script. To initiate this loading process, make
a default bash/shell script to load your desired files as a "module" 
in NET-UP and Save the Script as a .mdu file. 

This will get NET-UP to see the script as a "Module" for the Framework.

Usage to easily Enable/Disable modules:

Enable single Module.
```sh
./enablemod -f <module_name>
```
Enable ALL Modules in Folder.
```sh
./enablemod -a
```
Disable single Module.
```sh
./disablemod -f <module_name>
```
Disable ALL Modules in Folder.
```sh
./disablemod -a
```
Examples:
```sh
./disablemod -f subscan
./enablemod -f IPInfo
```

 If you would like to contribute to NET-UP. Feel free to commit changes.
-REDD-

