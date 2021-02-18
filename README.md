

### preparing Ubuntu files for  LAMP offline installation
```bash
./dependencies.sh
packages=(mysql-server apache2 php libapache2-mod-php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip
)
for pkg in ${packages[@]}; do
./getpkg.sh $pkg repo/
done
```


### references
[0] https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-20-04
[1] https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-on-ubuntu-20-04-with-a-lamp-stack


### installing from local repo
```bash
./install.sh
```
