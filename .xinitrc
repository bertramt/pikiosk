export DISPLAY=:0.0
xset s off
xset -dpms
xset s noblank
numlockx on
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' ~/.config/chromium/'Local State'
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/; s/"exit_type":"[^"]\+"/"exit_type":"Normal"/' ~/.config/chromium/Default/Preferences
#chromium-browser --window-size=1920,1080 --window-position=0,0 --kiosk --no-default-browser-check --no-first-run --disable-infobars --disable-session-crashed-bubble "https://google.com"
chromium-browser --no-default-browser-check --no-first-run --disable-infobars --disable-session-crashed-bubble "https://google.com"
