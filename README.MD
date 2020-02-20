# Raspberry Pi Kiosk (guide and scripts)
This is a guide and scripts to create a kiosk with a Raspberry Pi.  This can be used with a TV or with the Raspberry Pi touchscreen.

## Getting Started

These instructions will get you up and going from a fresh install.  They may need some adaption for your use case.

### Prerequisites

To start you need a Raspberry Pi and an Micro SD with Raspian Lite.  If your SD card came preinstalled with [NOOBS](https://www.raspberrypi.org/downloads/noobs/) you can use that to install Raspian Lite. If you are staring with a empty SD card you can install NOOBS Lite for doing a network install of Raspian Lite.  Alternatively you could choose to directly write the [Raspian Lite](https://www.raspberrypi.org/downloads/raspbian/) image to the SD card with [etcher](https://www.balena.io/etcher/)


### Installing OS

Install Raspbian Lite via NOOBS or writing the image to the SD card.


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
    * Change Password
    * Network Options > Change Hostname
    * Network Options > Wi-fi (optional) 
    * Boot Options > Desktop/CLI > Console Autologin (NOT Desktop!!)
    * Localization Options > Change Locale > Enable 'en_US.UTF-8 UTF-8'
    * Localization Options > Time Zone > US > Central        
    * Interfacing Options > SSH > Enable (optional)

```
## Optional Enhancements for Power and Touchsceen
While setting up serveral of these for AIO kiosks with 7" touchscreens and an inline POE adapter several tweaks were added.  The key option is the lcd_rotate that may be reqired if your using a touchscreen and not a TV.  The other options mostly apply mostly reducing the power use on a Raspberry Pi 3 because of the POE adapter that was being used. I used a POE splitter verses a POE sheild because it was the easist way to power the screen and Pi via POE.  The case I used for the touchscreen and POE splitter will not work with a Rasberry Pi 4 or newer devices.

For those wondering here is the equipment I used for the 7" AIO Kiosks.  
. Raspberry Pi 3
. [Touchscreen](https://www.amazon.com/dp/B0153R2A9I)
. [Touchscreen Case](https://www.amazon.com/dp/B01GQFUWIC)
. [POE Splitter](https://www.amazon.com/dp/B019BLMWY0)

Here are the /boot/config.txt options I added to rotate the screen and slightly reduce the power useage.
```
lcd_rotate=2
dtparam=act_led_trigger=none
dtparam=act_led_activelow=off
dtparam=pwr_led_trigger=none
dtparam=pwr_led_activelow=off
dtoverlay=pi3-disable-wifi
dtoverlay=pi3-disable-bt
```

## Kiosk Browser Installation
### Install git
```
sudo apt update && sudo apt install -y git
```

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

## Finishing Details

Head on over to the raspberry pi docs for more details on the [config.txt](https://www.raspberrypi.org/documentation/configuration/config-txt/).

### /boot/config.txt

#### Limit to 1080p
Some of my TVs are 4K and I really don't need to display at 4K
```
framebuffer_width=1920
framebuffer_height=1080

hdmi_group=1
hdmi_mode=16

disable_splash=1
```

### /boot/cmdline.txt

#### Quiet Down Boot
Adding or changing these options should quiet down the booting process.  This is done automaticly with the install script.
```
ADD: loglevel=3 consoleblank=0 quiet splash vt.global_cursor_default=0 logo.nologo plymouth.ignore-serial-consoles
CHANGE: console=tty1 to console=tty3
```

### Boot Splash Screen
This should be done automaticly via the install script.
```
sudo ln splash.png /opt/splash.png
sudo ln splashscreen.service /etc/systemd/system/splashscreen.service
sudo systemctl enable splashscreen
```


### Changing default URL(s)
This section needs to be cleaned up
```
edit chromium-browser add urls at end
```

### Tab Revolver (optional)
This section needs to be cleaned up
```
edit .xinitrc and remove --kiosk
https://chrome.google.com/webstore/detail/revolver-tabs/dlknooajieciikpedpldejhhijacnbda
more tools > extensions > detail > enable allow in incognito
Revolver Tabs Options
    - Autostart
    - Reload
    - Rotate only when inactive
edit .xinitrc and add --kiosk to 
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

## TODO
- ADD SMARTS to uninstall
- Install firewall
- Add a cleaner way to enable/disable kiosk mode
- Add a cleaner way to add/edit urls



## Helpful Links
https://raspberrypi.stackexchange.com/questions/59310/remove-boot-messages-all-text-in-jessie
https://yingtongli.me/blog/2016/12/21/splash.html