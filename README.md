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

###Run  Instructions

#Shell Processes
Update .sh and command files with current base directory of Exquisite Clock (~/Sites is default)

script_startup.command	> updates the clock with most recent JPG files and feed.json
script_update.sh > start auto update process

#Webframe Application
Check URL specified in URL.txt pointing at local apache server (or test server)

open exquisite_client_final.app to launch application



