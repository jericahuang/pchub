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
