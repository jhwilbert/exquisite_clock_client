exquisite_clock_client
======================

Client for Exquisite Clock. With startup processes and updates
Dependencies: ruby, Python

1. Install Brew

$ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

2. Install Wget (using Brew)

$ brew install wget


3. Install Git (using Brew)

$ brew install git

4. Create Server Config File

sudo vi /etc/apache2/users/exquisiteclock.conf

5. Edit Config file adding clock user sites folder

<Directory "/Users/exquisiteclock/exquisite_client/">
    Options Indexes MultiViews
    AllowOverride None
    Order allow,deny
    Allow from all
</Directory>

6. Restart Apache

$ sudo apachectl restart

7. Check site in http://localhost/~exquisiteclock/


