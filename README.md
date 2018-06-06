# Peace Corps Hub

### Background

Systers has partnered with Peace Corps to develop several web and mobile applications. We've also created a Mobile App Control Center (MACC) to push notifications and updates from web application to mobile app. All of the applications have separate repos in our Github organization, but we don't have a central hub for Peace Corps staff and volunteers to access all of the applications. The next phase in bringing all of the applications together is the Peace Corps Hub.

#### Peace Corps apps

###### Mobile Applications
Malaria [Android](https://github.com/systers/malaria-app-android) [iOS](https://github.com/systers/malaria-app-ios)  
PeaceTrack [Android](https://github.com/systers/peacetrack-android) [iOS](https://github.com/systers/peacetrack-ios)  
FirstAide [Android](https://github.com/systers/FirstAide-Android) [iOS](https://github.com/systers/FirstAide-iOS)
RealTrack [Android](https://github.com/systers/realtrack-android) [iOS](https://github.com/systers/realtrack-ios)
[Mobile App Control Center](https://github.com/systers/app-web-server)

###### Web Applications
[Ushahidi](https://github.com/systers/crowdmap)  
[Photo Language Translation](https://github.com/systers/language-translation)
[FirstAide](https://github.com/systers/FirstAide-web)
[PC Prep Kit](https://github.com/systers/PC-Prep-Kit)

### Installation Guide

#### 1. Installing Ruby

There are several options to install Ruby, this tutorial will use the installation from source, but you can see tutorials of others options on the [Ruby page](https://www.ruby-lang.org/pt/documentation/installation/).

To install from source download and unpack [this package](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.1.tar.gz).
Then do:

    $ ./configure
    $ make
    $ sudo make install
    
By default, this will install Ruby into `/usr/local`. To change, pass the `--prefix=DIR` option to the `./configure` script.

#### 2. Installing SQLite

Today, almost all the flavours of Linux OS and latest version of Mac OS X are being shipped with SQLite. So you just issue the following command to check if you already have SQLite installed on your machine or not.

    $ sqlite3 --version

If you don't have SQLite installed, follow the steps below:

Download [this package](http://www.sqlite.org/2016/sqlite-autoconf-3150000.tar.gz).

Then do:

    $ tar xvfz sqlite-autoconf-3071502.tar.gz
    $ cd sqlite-autoconf-3071502
    $ ./configure --prefix=/usr/local
    $ make
    $ make install
    
#### 3. Installing Rails

To install Rails, use the gem install command provided by RubyGems:

    $ gem install rails
    
To verify that you have everything installed correctly, you should be able to run the following:

    $ rails --version

### Running tests
To run tests, run the following command:
    $ rake test

### Project History and Goals

This project was started in the Qualcomm EmpowHERment Hackathon. The goal during the hackathon was to create a web application that will be the Peace Corps app hub. The hub should have login access and also include access to all of our Peace Corps web and mobile app projects. It was specified that it must be implemented in an open source language in order to align with the open government initiative of the Peace Corps.

### Deliverables from the Hackathon
[PCHub Winners site (initial design)](http://devpost.com/software/pchub)  
[PCHub Detail Design Documentation](https://docs.google.com/presentation/d/1D_6P7iuT4En1I_R66iP0-BW9zEIvjs6khLF324Jia-M/edit#slide=id.g5baf8cfec_0_13)  
[PCHub Demo site](http://peacecorpshub.weebly.com/home.html)  

### After the Hackathon
PC Hub has been in the continuing works by independent contributors, as well as Open Source Day and Google Summer of Code. We invite you to contribute. You can submit a PR for your work against the “develop” branch on Systers PCHub GitHub repo.

PC Hub has been a project in Systers Google Summer of Code throughout the years. Please visit the GSoC wiki for each year so that you can see what the students have worked on. This will bring you up-to-date on the current state of the project.

[GSOC 2014](https://github.com/systers/pchub/wiki/GSoC-2014-Vaibhavi-Desai)  

[GSoC 2016](https://github.com/systers/pchub/wiki/GSoC-2016-Izabela-Cardoso-&-Daisy-Nkweteyim) 

[GSoC 2018](https://github.com/systers/pchub/wiki/GSoC-2018-Jerica-Huang)

### Requirements for the Project


#### User Interface/User Experience

1. Must have a clean look, aesthetically pleasing to the eye.

2. Must be easy to navigate.

3. Must be able to access and view on mobile device, tablets/iPad and Web browser on desktop/laptop.


#### Feature Requirements

1. Must have login.

Users can be - Administrators (Level 3, all access to everything, configuration, logins, etc.) - PC Staff (Level 2, Does not have access to administrative tasks, adding a PC volunteer) - PC Volunteers (Level 3, Access to all applications)

2. Must have simple listing or buttons to access all of the Peace Corps web and mobile applications.

3. Notification area where administrators can add important information about updates to the applications or just general information

4. Forum area would be a nice to have a forum feed similar to Facebook/Twitter/Google+ for people to - Start a discussion/topic - Comment on those discussions/topics - Chat feature where people can chat with other PC staff/volunteers who are LOGGED IN (Nice to have)
