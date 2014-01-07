---
layout: tutorial
section: dev
active: tutorials
name: BeagleBone
description: Connect the TI ARM-based BeagleBone microcomputer to Xively
categories: ["dev", "tutorials"]
tags: ["hardware", "in progress"]
image: tutorials/beaglebone/image2013-4-9 13-36-5.jpg

sidebar:
  - link: introduction
    label: Introduction
  - link: connecting
    label: Connecting to the Internet
---


<!-- Section beginning -->
<div id="introduction" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

# Introduction

The BeagleBone is a Linux microcomputer from TI. Because it packs on a powerful processor, it can easily run a web server or touch-screen UI, Python script, and a lot more. It also includes a USB port for connecting interface devices like a WiFi dongle, sound card or a USB fan (kidding). In addition, its pins operate at 3.3V, which is the native voltage of a huge range of sensors.

![](attachments/2588729/2654215.png?effects=border-simple,blur-border)

With on-board Ethernet and loads of I/O pins, this microcomputer can take some multitasking and media processing, and serves as the perfect prototyping platform for a product that is based around the mighty, yet power-efficient, TI Sitara (ARM Cortex-A) family of processors. Unlike the Raspberry Pi, BeagleBone provides all you would need for development via a USB connector (that includes power, serial, JTAG and even networking if you do not have an Ethernet switch on your desk).

***BeagleBone Specs Summary***

| **Board version** | [***original***](http://beagleboard.org/Products/BeagleBone) | [***black***](http://beagleboard.org/Products/BeagleBone%20Black)
| SoC | TI Sitara [AM3358](http://www.ti.com/product/am3358) |  TI Sitara [AM3359](http://www.ti.com/product/am3359)
| SDRAM | 256MB DDR2 | 512MB DDR3
| CPU Clock Speed | 720MHz | 1GHz
| Stand-by Power | 7mW | 7mW
| Power Supply | 3.3V or 5V (210-460mA) | 3.3V or 5V (210-460mA)
| On-board Flash Memory | _none_ | 2GB eMMC
| Networking | Ethernet, CAN | Ethernet, CAN
| Multimedia | USB 2.0, MicroSD | USB 2.0, HDMI, MicroSD
| Accessible Digital I/O | UART, GPIO, SPI, I2C, I2S | UART, GPIO, SPI, I2C, I2S, SPI
| Digital I/O Voltage | 3.3V | 3.3V
| Analogue I/O | 8-channel 12-bit ADC | 8-channel 12-bit ADC

_Please note that the table above is intended to give Xively users an idea of what features this device has. The user should refer to the documentation supplied by the vendor for the most correct details._

The Beaglebone board comes with out-of-the box embedded linux distribution called  [Angstrom](http://www.angstrom-distribution.org/), which is based on [OpenEmbedded](http://openembedded.org/). We do have all you may need to build a your own OpenEmbedded image, so please do contact Xively support team for details. The scope of this tutorial is aimed to get a novice user to write Python scripts that will connect the Beaglebone to Xively API.

<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->

<!-- Section beginning -->
<div id="connecting" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

# Connecting to the Internet

If haven't already done so, please connect an Ethernet from the BeagleBone to a switch or router. You will also need to hook-up a USB cable to your computer.

It would very redundant to provide complete instruction on how to set-up the BeagleBone on different operating systems.

* [Windows](http://learn.adafruit.com/beaglebone/installing-drivers)
* [Ubuntu Linux](http://www.lvr.com/beaglebone.htm)
* [Official guide (multiplatform)](http://beagleboard.org/Getting%20Started)


<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->



<!-- Section beginning -->
<div id="setup" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

There are some packages that we need to install from the [Angstrom repository](http://www.angstrom-distribution.org/repo/) and some that we have prepared for you. While packages named _mmap_ and _pyserial_ should sound familiar, you might wonder what the other ones are, here are the links:

  * [python-pybbio](https://github.com/alexanderhiam/PyBBIO) Arduino-style hardware I/O support for BeagleBone
  * [python-requests](http://python-requests.org/) the REST/HTTP library
  * [xively-python](https://github.com/xively/xively-python) our own library

<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->

## 3) Connect to the Internet



## 4) Install dependencies

## 5) Get the Xively Python Library

## 6) Write a Python Script

## 7) Arrange the script to run on bootup

## 8) Watch the results on your Xively dashboard

  ![](attachments/950275/1081348.gif)

 

 



You need to run the following as _root_ on the Beaglebone shell prompt:

~~~  
opkg install python-mmap python-pyserial  
opkg install http://s3.amazonaws.com/com.cosm.packages/python-pybbio_0.5-r0_armv7a-vfp-neon.ipk  
opkg install http://s3.amazonaws.com/com.cosm.packages/python-requests_1.2.0-r0_armv7a-vfp-neon.ipk  
opkg install http://s3.amazonaws.com/com.cosm.packages/cosm-python_0.0.1%2Bgit1%2B20c3c64de23453877a2d64e12d29c79122784e98-r0_armv7a-vfp-neon.ipk  
~~~

Provided that your Beaglebone is connected to the Interenet, you should see output like this:

~~~  
Downloading http://s3.amazonaws.com/com.cosm.packages/python-requests_1.2.0-r0_armv7a-vfp-neon.ipk. Installing python-requests (1.2.0-r0) to root... Configuring python-requests.  
~~~

Once both packages are installed, run  `python`  command and type in the following to check that everything is working:

~~~  
root@beaglebone:~# python Python 2.7.2 (default, Oct 9 2012, 10:03:27) [GCC 4.5.4 20120305 (prerelease)] on linux2 Type "help", "copyright", "credits" or "license" for more information. >>> import cosm >>> xively_api = cosm.XivelyAPIClient("YOUR_XIVELY_API_KEY") >>> feed = xively_api.feeds.create(title="Created by the Beaglbone")  
~~~

If you go to you  [Xively console](https://xively.com/) you will find a feed titled _"Created by the Beaglebone"_!

Now we want to hook-up some sensors to the Beaglebone. It's got an 8 analogue converter ports (12 bit, 200 kSPS), so there is quite a lot of stuff that you can do with these. For the purpose of this tutorial we just one `<TBD>`  sensor. But if you do not have the  `<TBD>`  at hand, you can aways measure the amazing natural phenomenon of noise.

To get the voltage on the ADC port 1, you do this:

~~~  
>>> from bbio import \* >>> inVolts(analogRead(AIN1))  
~~~
