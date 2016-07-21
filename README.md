# PCHubTests Installation Procedure

### Set up the PCHub Environment 
1. Install Ruby.  
  ```
  sudo apt-get update  
  sudo apt-get install ruby-full

  ```
2. Install Rails  
  ```
  curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -  
  sudo apt-get install -y nodejs  
  gem install rails -v 4.2.6

   ```
3. Run ```rails -v``` to ensure rails has been installed.  
4. Clone the PCHub repository  

   ```
   git clone https://github.com/systers/pchub.git
   ```
5. Change directory to pchub/pchub.


  ```
  cd pchub/pchub
  ```
6. Run the following commands.  

  ```
    bundle install
    bin/rake db:migrate RAILS_ENV=development
  ```
7. Run the server. 

  ```
  rails s
  ```
8. Checkout PCHub on the browser.

  ```
  http://localhost:3000
  ```  
  
### Set up the PCHub Testing Environment

1. Download [Selenium for Java] (http://www.seleniumhq.org/download/).  
   At the time of this writing, selenium 2.53 with Ubuntu 16.04 was used.  

2. Ensure Firefox is installed.  
   Selenium 2.53 is compatible with Firefox 45.  Check [CHANGELOG] (https://github.com/SeleniumHQ/selenium/blob/master/java/CHANGELOG) to view the compatibility of selenium versions between browsers.  

3. Download [Apache POI] (https://poi.apache.org/download.html) API.  

4. Download and install [Eclipse] (http://www.eclipse.org/downloads/packages/). 

5. Clone the project and import it into eclipse.
  ```
  git clone https://github.com/daisyab/PCHubTest.git
  ```
6. In eclipse, include selenium and Apache POI jars in the build path of the project.

7.  In the src/main/java/pchub/utilities/Constants.java, change sqlite_database_file_path to the path to the development.sqlite3 located in the db directory of the PCHub project.

7. Run the tests located in /src/test/java/pchub.

