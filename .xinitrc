export DISPLAY=:0.0
xrandr -s 1920x1080
#xrandr -s 1080x1920
#xrandr --output HDMI-1 --rotate left
#xinput set-prop 6 "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
#xinput set-prop 7 "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
#xinput set-prop 8 "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
#xinput set-prop 9 "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
#xinput set-prop 10 "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
xset s off
xset -dpms
xset s noblank
numlockx on
#/home/pi/showserail.sh > /dev/null &
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' ~/.config/chromium/'Local State'
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/; s/"exit_type":"[^"]\+"/"exit_type":"Normal"/' ~/.config/chromium/Default/Preferences
#chromium-browser --window-size=1920,1080 --window-position=0,0 --kiosk --no-default-browser-check --no-first-run --disable-infobars --disable-session-crashed-bubble --simulate-outdated-no-au='Tue, 31 Dec 2099 23:59:59 GMT' --disable-component-update "https://google.com"

#chromium-browser https://chrome.google.com/webstore/detail/revolver-tabs/dlknooajieciikpedpldejhhijacnbda
#chromium-browser --window-size=1920,1080 --kiosk --no-default-browser-check --no-first-run --disable-infobars --disable-session-crashed-bubble --disable-translate --simulate-outdated-no-au='Tue, 31 Dec 2099 23:59:59 GMT' --disable-component-update "https://theslideshow.net/#simple/landscape"
touch urllist.txt
URL_LIST=`cat urllist.txt`

#Normal TV
chromium-browser --window-size=1920,1080 --kiosk --no-default-browser-check --no-first-run --disable-infobars --disable-session-crashed-bubble --simulate-outdated-no-au='Tue, 31 Dec 2099 23:59:59 GMT' --disable-component-update -–disable-features=TouchpadOverscrollHistoryNavigation $URL_LIST

#Vertical Touchscreen
chromium-browser --window-size=1080,1920 --kiosk --no-default-browser-check --no-first-run --disable-infobars --disable-session-crashed-bubble --simulate-outdated-no-au='Tue, 31 Dec 2099 23:59:59 GMT' --disable-component-update  $URL_LIST