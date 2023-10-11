export DISPLAY=:0.0
xrandr -s 1920x1080

#Rotated Touchscreen
#xrandr -s 1080x1920
#xrandr --output HDMI-1 --rotate left
#xinput set-prop 6 "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
#xinput set-prop 7 "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
#xinput set-prop 8 "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
#xinput set-prop 9 "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
#xinput set-prop 10 "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1

#Enable second screen
#xrandr --output HDMI-2 --auto --right-of HDMI-1

xset s off
xset -dpms
xset s noblank
numlockx on

#Attempts to extend SD life
sudo swapoff --all
rm -fr /home/pi/.cache/chromium
mkdir -p /run/user/1000/chromium/
ln -s /run/user/1000/chromium/ /home/pi/.cache/

#Cleanup Some files
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' ~/.config/chromium/'Local State'
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/; s/"exit_type":"[^"]\+"/"exit_type":"Normal"/' ~/.config/chromium/Default/Preferences

#If urllist.txt that doesn't exist then assuming first run and open up tab revolver install
if test -f /home/pi/urllist.txt; then
  chromium-browser https://chrome.google.com/webstore/detail/revolver-tabs/dlknooajieciikpedpldejhhijacnbda
fi

touch urllist.txt
URL_LIST=`cat urllist.txt`


#chromium-browser --window-size=1920,1080 --window-position=0,0 --kiosk --no-default-browser-check --no-first-run --disable-infobars --disable-session-crashed-bubble --simulate-outdated-no-au='Tue, 31 Dec 2099 23:59:59 GMT' --disable-component-update "https://google.com"

#Normal TV/Monitor
chromium-browser --window-size=1920,1080 --kiosk --no-default-browser-check --no-first-run --disable-infobars --disable-session-crashed-bubble --simulate-outdated-no-au='Tue, 31 Dec 2099 23:59:59 GMT' --disable-component-update $URL_LIST

#Vertical Touchscreen
#chromium-browser --window-size=1080,1920 --kiosk --no-default-browser-check --no-first-run --disable-infobars --disable-session-crashed-bubble --simulate-outdated-no-au='Tue, 31 Dec 2099 23:59:59 GMT' --disable-component-update $URL_LIST

#Dual Browsers
#chromium-browser --kiosk --new-window --user-data-dir="~/.config/chromium/Default/Preferences" --window-position=0,0 --window-size=1920,1080 --no-default-browser-check --no-first-run --disable-infobars --disable-session-crashed-bubble --simulate-outdated-no-au='Tue, 31 Dec 2099 23:59:59 GMT' --disable-component-update $URL_LIST &
#chromium-browser --kiosk --new-window --user-data-dir="~/.config/chromium/Default2/Preferences" --window-position=1921,0 --window-size=1920,1080 --no-default-browser-check --no-first-run --disable-infobars --disable-session-crashed-bubble --simulate-outdated-no-au='Tue, 31 Dec 2099 23:59:59 GMT' --disable-component-update $URL_LIST

