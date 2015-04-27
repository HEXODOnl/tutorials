# Getting started with your first VPS
By: [@itscassa](http://github.com/itscassa)  

## Introduction
So, you got your first VPS, but how can you use it? In this tutorial I'll guide you through the basic steps.

## Installing the VPS
First, you have to go into our panel and put an operating system on the VPS.
To do this, go to [cp.hexodo.net](http://cp.hexodo.net) and use the login details you got in the welcome email.

Next, click on the tab VPS. This is where all your VPSes are listed.  
Now you can select the VPS you want to set up.

After this, go to the Configuration tab. Here you can set several things. The option we're looking for is reinstallation. Click on the button and then select the OS you want to install.

If you're just new to servers, I would recommend selecting the latest Debian x86_x64.

After clicking on this, you'll be asked for the root password. Choose something strong so nobody else can access your VPS.

## Connecting to the VPS

Connecting to the VPS can be done using SSH. Most of the Linux and Mac OS X operating system have this built in, but if you're running Windows, you need something like [PuTTY](http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe)

To connect to the VPS using Linux or Mac OS X, open a terminal and run the following command:

    ssh root@<yourserverip>

When using PuTTY, fill in the IP and click on Connect.

Now you have to fill in the root password you've just set at the reinstallation, press Enter and you're in!

## Updating

Now, we want to make sure that all of the packages are up to date. You can update the list using the following command:

    apt-get update

This will only update the list with the latest software, but won't update the software itself. To do this, run the following command:

    apt-get upgrade

This will ask you for an confirmation, just press Y and enter so it'll continue updating.

## Done

Well, this is the end of the tutorial. But this doesn't mean that this is the only thing you can do with a VPS! I'll post some more tutorials soon about what you can do, so keep checking out the Tutorials page!