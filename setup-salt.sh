# Deploy configuration
# in order to get salt up and running on the system itself,
# Run this script to drop everything in place
# sh https://raw.githubusercontent.com/Orionx86/KVM-VFIO/master/setup-salt.sh
# https://git.io/vhWZt

sudo mkdir /srv/salt/
git clone https://github.com/Orionx86/KVM-VFIO.git /srv/salt
sudo apt-get install -y salt-master salt-minion salt-cloud
cp /srv/salt/states/setup/files/file_roots.conf /etc/salt/master.d/file_roots.conf
cp /srv/salt/states/setup/files/master.conf /etc/salt/minion.d/master.conf
systemctl restart salt*
salt '*' state.apply states.setup
