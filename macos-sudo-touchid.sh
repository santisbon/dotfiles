cd /etc/pam.d
sudo cp sudo_local.template sudo_local
sudo nano sudo_local
# uncomment the line with `pam_tid.so`