---
layout: tutorial
section: dev
active: tutorials
name: Arduino Ethernet
description: Connect the Arduino Ethernet board to Xively
categories: ["dev", "tutorials"]
tags: ["hardware", "in progress"]
image: tutorials/arduino_ethernet/arduino_ethernet.jpg

sidebar:
  - link: introduction
    label: Introduction
  - link: connect
    label: Connect the mbed
  - link: import
    label: Import libraries
  - link: app-board
    label: Connect the Application Board
  - link: workbench
    label: Watch the Workbench
  - link: finish
    label: Take this code and run!
---

<!-- Section beginning -->
<div id="introduction" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

 #Introduction

This guide will show you how to get started using the Xively Arduino library, and hopefully demonstrate how much easier it is to use this library than to construct HTTP requests manually as you used to have to do.

This guide assumes you've already signed up to Xively, and will walk you through creating a feed and publishing data to it from your Arduino.

###Prerequisites
Before starting, you'll need to make sure you have an up to date version of the Arduino software. At time of writing the current version is Arduino 1.0.3, but the latest version should always be available from the Arduino downloads page.

NOTE: The following tutorial will not work if the version of your Arduino software is less than 1.0 as this was the first version to include the version of the Ethernet library capable of using DHCP and DNS rather than hard coded IP addresses, so if you have an old version of the Arduino software, go ahead and upgrade it before we begin.

Importantly, you'll also need either an Arduino (or compatible) board with an Arduino Ethernet Shield, or an Arduino Ethernet (i.e. the model with onboard Ethernet).

You should also note that the Xively library will not work with boards that don't use the Wiznet W5100 Ethernet chipset, so for example ENC28J60 based boards will not work. This is because it depends on the stock Ethernet library under the hood, which doesn't work with other Ethernet controllers.


<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->

<!-- Section beginning -->
<div id="connect" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

 #Installing Libraries
We hope at some point to bundle the Xively library with the main Arduino distribution, which will mean you'll be able to get started using it without jumping through any extra hoops, but until that point you need to manually install the library.

Installing a library is a fairly straightforward process however, and you'll only need to do this once.

###Installing a 3rd party library
The main Arduino site has a guide to installing 3rd party Arduino libraries, which it's worth having a read through especially if this is the first library you've installed.

The basic idea is you just need to download the library (which is typically distributed as a .ZIP file), and copy the unpacked contents into the libraries folder within your Arduino installation folder. For more details on this you should read the Arduino documentation.

Alternatively if you are familiar with Git version control software, then both of the libraries you need are available on Github, so can be installed by simply cloning the repositories into your libraries folder.

###Finding your libraries folder
In general your libraries folder will live inside the DocumentsArduinolibraries folder in both Windows and OSX (allowing for the obvious differences between the platforms). The location on Linux may vary depending on how you installed the platform. If the location is not obvious however, you will always be able to locate it by opening the File > Preferences menu item, and viewing the directory location listed as the Sketchbook location. Your libraries folder will be within this folder.

###Installing the HttpClient library
As I stated previously, the Xively library depends on the core Ethernet library that is packaged with the main Arduino download, however it also depends on the HttpClient library which provides a higher level interface for interacting with web services. So to make the Xively library work, you first need to download and install this library.

The latest version of HttpClient is available for download here: https://github.com/amcewen/HttpClient/archive/master.zip, so that should be downloaded and unpacked into your libraries directory.

Alternatively to install the library via Git, you should open a terminal, change into your libraries directory, and run something like:

$ git clone git://github.com/amcewen/HttpClient.git HttpClient

###Installing the Xively library
Once you've installed the HttpClient library, then you should go ahead and install the Xively library. This is available to download here: https://github.com/Xively/xXivelyively-arduino/archive/master.zip, so again this should also be downloaded and unpacked into your libraries directory.

Alternatively you can use Git again by running:

$ git clone git://github.com/xivelyXively/xively_arduino.git XivelyArduino

from within your libraries folder.

The end result of these two processes should be that your libraries folder should contain both an HttpClient folder and a XivelyArduino one, and inside each of those folders should be the Arduino header/source files. If the unpacked folders have different names, it doesn't really matter, but feel free to rename them.

###Verifying your install
Once both libraries are installed you should quit the Arduino software if it is already running, or start it if not; then open up the File > Examples menu and you should see both HttpClient and XivelyArduino included in the examples list.

If the examples aren't visible anywhere, then it means you haven't installed the libraries correctly. In this case make sure that the code hasn't been unpacked in an extra child directory.

<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->

<!-- Section beginning -->
<div id="import" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

 #Getting your first example working
There are some examples bundled with the Xively library, which you should look at, as the following code is just a barely modified version of one of those examples, which demonstrates how to send data to Xively. But before we get to the Arduino code we need to first create a feed and API key on Xively to which we will be pushing data.

1. First of all you need to create a new feed, to which we'll be publishing data, so login to Xively, and then click the +Device/Feed button (or the big plus if you've never created a feed before).


Choose Arduino


Give your test feed a title


Then click through, without adding tags, and press Create.


This should bring up a success message which contains the sample sketch given below. This sample sketch should also have been pre-populated with your new feed ID and an API key that will allow your Arduino to both update and read from the feed.


Copy the sample code given into a new Arduino sketch, and then press Finish to close the modal, which should take you back to your console, and you should see that a new blank feed has been created.


If you didn't copy the sample code before pressing Finish, don't panic. The exact same code is given below, so you can just copy it from here. However you will need to manually add your feed ID and API key into the sketch.

Your feed ID can be found by clicking into the feed page (either in the URL, or there will be a Feed ID listed on the page. To find your API key you'll need to visit: https://xively.com/v2/users/YOUR_USERNAME/keys, and you should see a key labelled with the feed ID you just noted down.

<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->

<!-- Section beginning -->
<div id="app-board" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

 #Sample Xively Arduino Sketch

<script src="https://gist.github.com/xively-gists/5519661.js"></script>

This example combines the DatastreamUpload and DatastreamDownload examples included with the Xively library to both send and receive data from Xively.

Don't worry about the fact that you don't have a sensor attached to the pin we are trying to read from in this sketch - with nothing attached we'll end up reading a randomish value, which will then be sent up to Xively.

If required, change YOUR_FEED_ID and YOUR_API_KEY to the values created for you, and then hit Upload to compile your code, and load it to your Arduino.

If the upload fails, make sure the Arduino is correctly connected to the USB port, and that you have selected the correct board type from the Tools > Board menu. However if all goes smoothly, your code should have been uploaded to the board, and the Arduino should be running, publishing data to Xively.

<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->

<!-- Section beginning -->
<div id="workbench" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

#Watch the Xively Workbench

###Viewing your debug page
To verify that the data is reaching Xively, you should just try refreshing your feed page, which should show that it's started to receive updates. However if you'd like greater visibility into what it's sending, or if the upload doesn't seem to be working, you should next have a look at your debug page.

This page is available here: https://xively.com/users/YOUR_USERNAME/debug

This page attempts to show real-time updates of data hitting our system, which can sometimes give a clue to why something isn't working as expected. Here's a capture of my debug page having received a successful update:


If everything has worked, then you should see continuously updating stream of successful updates being received by our systems. If there's been any issues, then you should see some error updates coming in, with the important caveat that if the error is in the API key, then we don't have any way of correlating the incoming requests with your account, so those requests won't show on the debug page.

<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->

<!-- Section beginning -->
<div id="finish" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

#Take this code and run!
This example demonstrates the most basic way we can push data to Xively from an Arduino using the new library, but doesn't do anything else, i.e. consume any data and do something with it locally. For examples of this, or for more complicated examples that get/send data for multiple datastreams, please have a play with the other examples packaged with the Xively library.

<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->


