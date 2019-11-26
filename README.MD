# Raspberry Pi Kiosk (guide and scripts)
This is a guide and scripts to create a kiosk with a Raspberry Pi.  This can be used with a TV or with the Raspberry Pi touchscreen.

## Getting Started

These instructions will get you up and going from a fresh install.  They may need some adaption for your use case.

### Prerequisites

To start you need a Raspberry Pi and an Micro SD card loaded with [NOOBS](https://www.raspberrypi.org/downloads/noobs/). I recommend NOOBS Lite for doing a network install.

### Installing OS

Install Raspbian Lite

```
placeholder
```

### First Boot (Basic OS Setup)

Here are some of the most common items that need to be configured on a fresh install. 

####
Install Updates (If you need to configure Wi-fi skip this step and come back after running raspi-config)
```
sudo apt update && sudo apt install -y raspi-config
```

####
Raspberry Pi Config (raspi-config) is a tool used to configure your Raspberry Pi

```
sudo raspi-config
    *Change Password
    *Network Options > Change Hostname
    *Network Options > Wi-fi (optional) 
    *Boot Options > Desktop/CLI > Console Autologin (NOT Desktop!!)
    *Localization Options > Change Locale > Enable 'en_US.UTF-8 UTF-8'
    *Localization Options > Time Zone > US > Central
    *Interfacing Options > SSH > Enable (optional)

```


## Kiosk Installation
### Download and change folder
```
cd ~
git clone https://github.com/bertramt/pikiosk.git

cd pikiosk
```
### Run install
```
./install.sh
```

## Uninstallation

### Change to dotfiles folder
```
cd ~/pikiosk
```

### Run uninstaller
```
./uninstall.sh
```