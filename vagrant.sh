rsync --recursive --perms --exclude=.git --exclude=.idea --exclude=vendor --exclude=app/cache --exclude=app/log --progress . /home/vagrant/halo/vagrant/symfony/

while true; do rsync --recursive --perms --exclude=.git --exclude=.idea --exclude=vendor --exclude=app/cache --exclude=app/log --progress . /home/vagrant/halo/vagrant/symfony/;