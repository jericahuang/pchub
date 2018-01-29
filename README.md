# Peace Corps Hub

### Background

Systers has partnered with Peace Corps to develop several web and mobile applications. All of the applications have separate repos on our GitHub page, but we don't have a central HUB for Peace Corps staff and volunteers to access all of the applications.

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

### Goal of the Hack

The goal of the hackathon is to create a web application that will be the Peace Corps App HUB. The hub should have login access, but also include access to all of our Peace Corps products. The language you choose must be open source as to keep to the initiative of open government initiative of the Peace Corps.

Note: We do have mobile products. How would users view/access mobile products?

List of all of Systers Peace Corps projects can be found here >> [Systers GitHub page](http://systers.github.io/)

The Peace Corps Hub should include at the highest level access to the following.
1. Mobile App Control Center
2. Ushahidi Crowdmap (this contains only one Ushahidi application.
3. Photo Language Translation

The Mobile App Control Center should access the following Peace Corps mobile applications.
1. PeaceTrack
2. Malaria
3. PCSA

All this work was performed during Systers Google Summer of Code 2014 and 2015. Please see the GSoC assignments so for each year so that you can see what the students have worked on for each of the project. This is not a requirement, but you may want to read background on the projects.

[GSOC 2014 Assignments](http://systers.org/systers-dev/doku.php/gsoc2014assignments)  
[GSoC 2015 Assignments](http://systers.org/systers-dev/doku.php/gsoc2015assignments)  

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


#### After The Hack

After the hackathon, we would love for all the participants to continue to collaborate with Systers and others who will contribute and continue the work that you are doing. It would be great if you can submit a PR for your design work against the “develop” branch on Systers PCHub GitHub repo.

## Peace Corps Hub
Systers GHCOSD Mentor: Sandi Giver, Patrick Choquette, Gabe Krieshok, Sheila Campell

#### Project Description:
We've built several web and mobile applications for Peace Corps. We've also created a Mobile App Control Center (MACC) to push notifications and updates from web application to mobile app. However, the next phase in bringing all of the applications together is a Peace Corps Hub. 

We have initial design of the web application from Qualcomm EmpowHerment Hackathon. Please visit the [winners' page](http://devpost.com/software/pchub) for initial design.

Skills desired or want to learn: Python/Django, html, php

[PCHub Repo](https://github.com/systers/pchub)

#### Environment Setup:
The app-web-server server will host this application so please visit environment repo and choose [app-web-server](https://github.com/systers/app-web-server) for your environment setup.

#### Resources
[PCHub Winners site](http://devpost.com/software/pchub)  
[PCHub Detail Design Documentation](https://docs.google.com/presentation/d/1D_6P7iuT4En1I_R66iP0-BW9zEIvjs6khLF324Jia-M/edit#slide=id.g5baf8cfec_0_13)  
[PCHub Demo site](http://peacecorpshub.weebly.com/home.html)  

#### GHC15 OSD Tasks:
1. Create css template as specified in detail design documentation.
2. Create home page with access buttons.
3. Create buttons to go to each application we've created for Peace Corps. See list below.
 
##### Peace Corps apps

###### Mobile Applications
Malaria [Android](https://github.com/systers/malaria-app-android) [iOS](https://github.com/systers/malaria-app-ios)  
PeaceTrack [Android](https://github.com/systers/peacetrack-android) [iOS](https://github.com/systers/peacetrack-ios)  
Peace Corps Sexual Assault [Android](https://github.com/systers/PCSA) iOS - TBA  

###### Web Applications
[Ushahidi](https://github.com/systers/crowdmap)  
[Photo Language Translation](https://github.com/systers/language-translation)  
[Mobile App Control Center](https://github.com/systers/app-web-server)  
