Exquisite Clock Client 
======================

The current setup instructions install the Exquisite Clock from the current Github repository and makes use of OSX native apache2 installation. It assumes the client will be installed in Sites/ folder a user in a OSX 10.9 (or superior) installation of MacOS.It makes use of Brew to install the necessary packages (wget and GIT). This installation was tested in: Mac OSX 10.9 

###Setup Instructions

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

####Shell Processes
Update .sh and command files with current base directory of Exquisite Clock (~/Sites is default)

```script_startup.command```
Updates the clock with most recent JPG files populating the folder clock/
Downloads the last JSON feed from web platform and populates the folder feeds/feed.json


``script_update.sh``` 
Start auto update process donwloading a JSON file every 5 seconds and compares to local version
If file encounters a new number in serialized list it downloads that number to clock/

####Webframe Application
Check URL specified in URL.txt pointing at local apache server (or test server). The application will extend itself to the maximum width of the current configured output displays.

open exquisite_client_final.app to launch application



