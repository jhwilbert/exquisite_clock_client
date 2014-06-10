import urllib2
import json
import md5
import os
import time

REMOTE_FEED_URL = "http://www.exquisiteclock.org/clock/feed/feed.json" # json feed with numbers and image
REMOTE_IMAGE_URL = "http://www.exquisiteclock.org/v1/adm/installation_rotated/clock/" #rotated clock images


LOCAL_IMAGE_DIR = '/clock/' # root is ~exquistecclock/
LOCAL_FEED_DIR = '/feeds/'
BASE_DIR = os.getcwd()

def parse_download_files():
    f = open(os.getcwd()+LOCAL_FEED_DIR+'feed.json', 'r')
    file_content = f.read()
    json_output= json.loads(file_content)
    
    download_files(json_output)
    

def download_files(json):
    for number in json:   
         print number, "------------------------------------------" 
         for digit in  json[number]:
             local_image_url = os.getcwd()+LOCAL_IMAGE_DIR
             remote_image_url = REMOTE_IMAGE_URL+digit["URL"]
             get_remote_file(remote_image_url,local_image_url)
    
def get_remote_json():
    
    get_remote_file(REMOTE_FEED_URL,BASE_DIR+LOCAL_FEED_DIR)
    parse_download_files()
    
        
def get_remote_file(remote_url,local_dir):
    os.chdir(local_dir)    
    file_name = remote_url.split('/')[-1]
    u = urllib2.urlopen(remote_url)
    f = open(file_name, 'wb')
    meta = u.info()
    file_size = int(meta.getheaders("Content-Length")[0])
    print "Downloading: %s Bytes: %s" % (file_name, file_size)

    file_size_dl = 0
    block_sz = 8192
    while True:
        buffer = u.read(block_sz)
        if not buffer:
            break

        file_size_dl += len(buffer)
        f.write(buffer)
        status = r"%10d  [%3.2f%%]" % (file_size_dl, file_size_dl * 100. / file_size)
        status = status + chr(8)*(len(status)+1)
        print status,
    
    f.close()
    os.chdir(BASE_DIR)
#
get_remote_json()  
#time.sleep(4)
#parse_download_files()  

