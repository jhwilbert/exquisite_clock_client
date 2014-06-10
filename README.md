Exquisite Clock Client 
======================

###Setup Instructions
Mac OSX 10.9 

Client for Exquisite Clock. With startup processes and updates.

Dependencies: Ruby, Python


A. Install Brew

```$ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"```

B. Install Wget (using Brew)

```$ brew install wget```

C. Install Git (using Brew)

```$ brew install git```


C. Create Server Config File

```sudo vi /etc/apache2/users/exquisiteclock.conf```

D. Edit Config file adding clock user sites folder

```
<Directory "/Users/exquisiteclock/Sites/">
    Options Indexes MultiViews
    AllowOverride None
    Order allow,deny
    Allow from all
</Directory>
```

C. Restart Apache

``` $ sudo apachectl restart```

D. Check site in http://localhost/~exquisiteclock/

###Run Instructions Instructions




