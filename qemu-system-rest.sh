sudo su
systemctl stop libvirtd libvirtd.socket libvirtd-ro.socket libvirtd-admin.socket 2>/dev/null
pkill -9 -f libvirtd 2>/dev/null
pkill -9 -f dnsmasq 2>/dev/null
find /run/libvirt -name "*.pid" -delete 2>/dev/null
find /run/libvirt -name "*-sock" -delete 2>/dev/null
rm -f /run/libvirtd.pid
systemctl reset-failed libvirtd libvirtd.socket libvirtd-ro.socket libvirtd-admin.socket 2>/dev/null
sleep 2
systemctl start libvirtd.socket libvirtd-ro.socket libvirtd-admin.socket
systemctl start libvirtd
sleep 1
systemctl status libvirtd --no-pager
ls -la /run/libvirt/libvirt-sock
