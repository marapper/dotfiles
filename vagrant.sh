rsync --recursive --perms --exclude=.git --exclude=.idea --exclude=vendor --exclude=app/cache --exclude=app/log --progress . /home/vagrant/halo/vagrant/symfony/

while true; do rsync --recursive --perms --exclude=.git --exclude=.idea --exclude=vendor --exclude=app/cache --exclude=app/log --progress . /home/vagrant/halo/vagrant/symfony/;

cd ~/www-clone/pamm6

rm -rf app/var/cache/* 

sudo chmod -R 777 app/var



sudo rsync --recursive --verbose --perms --exclude=.git --exclude=vendor --exclude=app/var /home/vagrant/www/pamm6/ /home/vagrant/www-clone/pamm6/
    
sudo rsync --recursive --verbose --perms --exclude=misc --exclude=.git --exclude=vendor --exclude=app/var /home/vagrant/www/pamm6/ /home/vagrant/www-clone/pamm6/

sudo rsync --recursive --verbose --perms --exclude=misc --exclude=.git --exclude=vendor --exclude=app/var /home/vagrant/www/pamm6/ /home/vagrant/www-clone/pamm6/ && bin/phpunit.phar -c src/Gtt/Pamm/Tests/phpunit.xml src/Gtt/Pamm/Tests/Functional/PublicApi/InsertTest.php

sudo rsync --recursive --verbose --perms --exclude=misc --exclude=.git --exclude=vendor --exclude=app/var /home/vagrant/www/pamm6/ /home/vagrant/www-clone/pamm6/ && bin/phpunit.phar -c src/Gtt/Pamm/Tests/phpunit.xml --group try src/Gtt/Pamm/Tests/Functional/PublicApi/.

sudo rsync --recursive --verbose --perms --exclude=misc --exclude=.idea --exclude=.git --exclude=vendor --exclude=app/var /home/vagrant/www/pamm6/ /home/vagrant/www-clone/pamm6/ > /dev/null && sudo rsync --recursive --verbose --perms --exclude=misc --exclude=.git --exclude=vendor --exclude=app/var /home/vagrant/www/pamm6/vendor/bundles/Gtt/Bundle/Pamm6Client/ /home/vagrant/www-clone/pamm6/vendor/bundles/Gtt/Bundle/Pamm6Client/ > /dev/null && bin/phpunit.phar -c src/Gtt/Pamm/Tests/phpunit.xml src/Gtt/Pamm/Tests/Functional/PublicApi/.

sudo rsync --recursive --verbose --perms --exclude=misc --exclude=.git --exclude=vendor --exclude=app/var /home/vagrant/www/pamm6/misc/ /home/vagrant/www-clone/pamm6/misc/ && php app/console pamm:db-reset && php app/console pamm:db-deploy && php app/console pamm:install