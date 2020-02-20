export DISPLAY=:0.0
xrandr -s 1920x1080
xset s off
xset -dpms
xset s noblank
numlockx on
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' ~/.config/chromium/'Local State'
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/; s/"exit_type":"[^"]\+"/"exit_type":"Normal"/' ~/.config/chromium/Default/Preferences
#chromium-browser --window-size=1920,1080 --window-position=0,0 --kiosk --no-default-browser-check --no-first-run --disable-infobars --disable-session-crashed-bubble --simulate-outdated-no-au='Tue, 31 Dec 2099 23:59:59 GMT' --disable-component-update "https://google.com"

#chromium-browser https://chrome.google.com/webstore/detail/revolver-tabs/dlknooajieciikpedpldejhhijacnbda
chromium-browser --window-size=1920,1080 --kiosk --no-default-browser-check --no-first-run --disable-infobars --disable-session-crashed-bubble --simulate-outdated-no-au='Tue, 31 Dec 2099 23:59:59 GMT' --disable-component-update "https://theslideshow.net/#simple/landscape"