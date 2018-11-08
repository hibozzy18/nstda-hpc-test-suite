sacctmgr add cluster tara

sudo sacctmgr add account ansible
sacctmgr add user ansible account=ansible
sudo sacctmgr add user ansible account=hpcadmin
# add user then