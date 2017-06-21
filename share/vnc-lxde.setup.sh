if [ "$TK_PLATFORM" == "darwin" ]; then
  brew install vnc-viewer

elif [ "$TK_PLATFORM" == "linux-ubuntu" ]; then
  sudo apt install -y xfce4 xfce4-goodies
  sudo apt install tightvncserver

  vncserver
  vncserver -kill :1

  # baskup and craate new startup script
  vnc_startup_script=$HOME/.vnc/xstartup
  mv $vnc_startup_script $vnc_startup_script.backup
  cat <<EOF > $vnc_startup_script
#!/bin/bash
xrdb ${HOME}/.Xresources
startxfce4 &
EOF
  chmod +x $vnc_startup_script

  # create vnc systemd service
  vnc_systemd_script=vncserver
  cat <<EOF > "./${vnc_systemd_script}@.service"
[Unit]
Description=Start TightVNC server at startup
After=syslog.target network.target

[Service]
Type=forking
User=${USER}
PAMName=login
PIDFile=/home/${USER}/.vnc/%H:%i.pid
ExecStartPre=-/usr/bin/vncserver -kill :%i > /dev/null 2>&1
ExecStart=/usr/bin/vncserver -depth 24 -geometry 1280x800 :%i
ExecStop=/usr/bin/vncserver -kill :%i

[Install]
WantedBy=multi-user.target
EOF
  sudo mv "./${vnc_systemd_script}@.service" /etc/systemd/system/

  # reload and ebable service
  sudo systemctl daemon-reload
  sudo systemctl enable "${vnc_systemd_script}@1.service"

  # start service
  sudo systemctl start "${vnc_systemd_script}@1"

fi
