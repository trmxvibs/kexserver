#!/bin/bash
# Author : Lokesh kumar
#  Date : 10/02/2025
clear

echo "🚀 Kali NetHunter TigerVNC Setup Script 🚀"
sleep 2
echo -e "\e[1;32m"
echo "========================================="
echo "   🚀 Kali NetHunter TigerVNC Setup "
echo "========================================="
echo -e "\e[1;33mAuthor  : Lokesh Kumar"
echo "YouTube : https://youtube.com/@termuxvibes"
echo -e "\e[1;32m=========================================\e[0m"
sleep 2

# 1️⃣ Update & Install Required Packages
echo "🔄 Updating and installing required packages 🔄..."
sleep 2
apt update && apt upgrade -y
clear
sleep 1
echo "🔄 Installing Required Package 🔄"
apt install tigervnc-standalone-server xfce4 xfce4-terminal dbus-x11 x11-xserver-utils -y
clear 
sleep 1
echo "🚀 Kali NetHunter TigerVNC Setup Script 🚀"
sleep 2
echo -e "\e[1;32m"
echo "========================================="
echo "   🚀 Kali NetHunter TigerVNC Setup "
echo "========================================="
echo -e "\e[1;33mAuthor  : Lokesh Kumar"
echo "YouTube : https://youtube.com/@termuxvibes"
echo -e "\e[1;32m=========================================\e[0m"
sleep 2
echo -e "\e[1;32m<All Package Installed  >\e[0m"
sleep 3
clear
# 2️⃣ Ensure .vnc & .Xauthority Files Exist
echo "🚀 Kali NetHunter TigerVNC Setup Script 🚀"
sleep 2
echo -e "\e[1;32m"
echo "========================================="
echo "   🚀 Kali NetHunter TigerVNC Setup "
echo "========================================="
echo -e "\e[1;33mAuthor  : Lokesh Kumar"
echo "YouTube : https://youtube.com/@termuxvibes"
echo -e "\e[1;32m=========================================\e[0m"
sleep 2
echo "🛠 Creating necessary directories & fixing permissions..."
mkdir -p /root/.vnc /root/.config/tigervnc
touch /root/.Xauthority
chmod 600 /root/.Xauthority
sleep 3 
# 3️⃣ Fix Migration Issue (If Exists)
if [ -d "/root/.vnc" ] && [ ! -L "/root/.vnc" ]; then
    echo "🔄 Fixing TigerVNC Migration Issue..."
    sleep 3
    mv /root/.vnc/* /root/.config/tigervnc/ 2>/dev/null
    rm -rf /root/.vnc
    ln -s /root/.config/tigervnc /root/.vnc
fi

# 4️⃣ Clean Up Previous VNC Sessions (If Any)
echo "🧹 Cleaning up old VNC sessions..."
sleep 3
vncserver -kill :1 > /dev/null 2>&1
rm -rf /tmp/.X11-unix/X1 /tmp/.X1-lock
clear
# 5️⃣ Set VNC Password (If Not Set)
if [ ! -f "/root/.vnc/passwd" ]; then
    echo "🔑 Setting up VNC password..."
    sleep 3
    vncpasswd
fi
clear

# 6️⃣ Fix XRDB Error (Create Missing .Xresources)
if [ ! -f "/root/.Xresources" ]; then
    echo "✨ Creating missing .Xresources file..."
    sleep 3
    touch /root/.Xresources
fi

# 7️⃣ Configure XFCE for VNC
echo "📁 Configuring XFCE for VNC..."
sleep 5
echo "#!/bin/bash
xrdb \$HOME/.Xresources
export DISPLAY=:1
xhost +  # Allow clients to connect
dbus-launch --exit-with-session startxfce4" > /root/.vnc/xstartup
chmod +x /root/.vnc/xstartup
clear
echo -e "\e[1;32m"
echo "========================================="
echo "   🚀 Kali NetHunter TigerVNC Setup "
echo "========================================="
echo -e "\e[1;33mAuthor  : Lokesh Kumar"
echo "YouTube : https://youtube.com/@termuxvibes"
echo -e "\e[1;32m=========================================\e[0m"
sleep 2

echo -e "\e[1;32m< Create Shortcut for VNC >\e[0m"
sleep 3
chmod +x start-kex
chmod +x stop-kex
chmod +x kex-passwd
mv start-kex /usr/bin/
mv stop-kex /usr/bin/
mv kex-passwd /usr/bin/
# 8️⃣ Start the VNC Server
echo "🚀 Starting VNC Server..."
sleep 3
vncserver :1 -geometry 1280x720 -depth 24
clear
sleep 1
echo "🚀 Kali NetHunter TigerVNC Setup Script 🚀"
sleep 2
echo -e "\e[1;32m"
echo "========================================="
echo "   🚀 Kali NetHunter TigerVNC Setup "
echo "========================================="
echo -e "\e[1;33mAuthor  : Lokesh Kumar"
echo "YouTube : https://youtube.com/@termuxvibes"
echo -e "\e[1;32m=========================================\e[0m"
sleep 2
# 9️⃣ Display VNC Connection Info
echo "✅ VNC Server is now running!"

echo -e "\e[1;32m< Shortcut for Vnc >\e[0m"
echo "kex-passwd   ==>>   configure the KeX password (only needed before 1st use)"
echo "start-kex    ==>>   start Kali NetHunter Desktop Experience user sessions"
echo "stop-kex     ==>>   stop Kali NetHunter Desktop Experience"
sleep 30

echo -e "\e[1;32m< Thanks to visit us >\e[0m"
sleep 3


