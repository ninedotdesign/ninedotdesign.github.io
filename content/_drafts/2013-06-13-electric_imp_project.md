---
layout: tutorial
section: dev
active: tutorials
name: Electric Imp + Arduino
description: A demo project showing the imp as a serial WiFi gateway for an Arduino, which in turn displays a Xively feed on an LCD
categories: ["dev", "tutorials"]
tags: ["hardware", "chris"]
image: tutorials/imp_project/imp.jpg


sidebar:
  - link: introduction
    label: Introduction
  - link: components
    label: Components
  - link: hardware-setup
    label: Hardware Setup
  - link: imp-software
    label: imp Software
  - link: arduino-software
    label: Arduino Setup
  - link: bring-it-together
    label: Bring it Together


---

**TODO: This tutorial needs to reworked to pickup where first tutorial leaves off. Will use LCD and arduino though. **

<!-- Section beginning -->
<div id="introduction" class="tutorial-section">

{% capture section %}
<!-- /Section beginning -->

# Introduction

This tutorial builds on the previous [Xively electric imp serial tutorial](/dev/tutorials/electric_imp_serial/). For this tutorial we will be using the electric imp -> Xively UART bridge we set up with an Arduino microcontroller and LCD shield with our electric imp. This will allow us to create a device which is capable of sending data to Xively as well as retrieving data from Xively. We will start with the same code we were using for device and agent in the previous tutorial. We will make some changes to the agent code to use the table functionality. We will then create some Arduino code to take the input and display it on the LCD screen. 

<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->


<!-- Section beginning -->
<div id="components" class="tutorial-section">

{% capture section %}
<!-- /Section beginning -->

# Components

| | electric imp | $29.95  
| | Sparkfun imp April dev board | $12.95  
|   | or |    
| | Sparkfun imp Arduino Shield | $19.95  
| | Arduino Uno R3 | $29.95  
| | Adafruit 16x2 LCD Shield | $24.95  

 

The Arduino Uno R3 connects to the Adafruit LCD Shield and the SparkFun April electric imp development board. You can alternately replace these components with the SparkFun electric imp shield for Arduino, and stack all the shields together.

 <!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->

<!-- Section beginning -->
<div id="hardware-setup" class="tutorial-section">

{% capture section %}
<!-- /Section beginning -->


# Hardware Setup

If you are continuing from the previous tutorial. You should disconnect the FTDI cable from the imp April board. You can leave the leads connected to the April board, as you will need them again soon.

1. Mount the Arduino to the LCD shield by lining up the pins. 
2. Connect imp pin 5 and 7 (on your breakout board) to Arduino Digital pins 9 and 10 respectively.
3. Connect the VIN pin on the imp April to the 5v pin on the Arduino.
4. Connect the imp's GND pin (next to its VIN), to a GND pin on the Arduino

**Note for imp shield users: **All you need to do is mount the imp shield on the Arduino then the LCD shield on top of that. 

Here is a diagram showing how to wire the LCD shield, with the Arduino underneath. The diagram below shows the connections on the Arduino for your reference. 

![]({% asset_path tutorials/imp_project/implcd.png %})

![]({% asset_path tutorials/imp_project/implcdarduino.png %})  
    
 <!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->

<!-- Section beginning -->
<div id="imp-software" class="tutorial-section">

{% capture section %}
<!-- /Section beginning -->

# imp Software 

We have already created most of the imp code we need in the previous tutorial. The device code will remain the same, but we are going to make changes to the agent. So make sure you make these changes or just copy the new code from below.

We will be using Squirrel's table functionality to parse the data from Xively and get it ready for the Arduino.

**Agent**

<script src="https://gist.github.com/xively-gists/5569436.js"></script>
 

The basic bidrectional device code remains the same.

**Device**

<script src="https://gist.github.com/xively-gists/5569445.js"></script>

<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->

<!-- Section beginning -->
<div id="arduino-software" class="tutorial-section">

{% capture section %}
<!-- /Section beginning -->

# Arduino Software

The Arduino software is going to take the values sent from the imp and format them a little bit further to be displayed on the LCD. Given the limited space of the the 16x2 character LCD, there is a maximum length for the Feed ID, datastream ID, and values that the screen can display at once. Your Feed ID can be a maximum of 11 characters, and your datastream ID and value combined can be a max of 15 characters.

**Note:** This code assumes you are using the Adafruit RGB LCD shield. If you are using a different LCD you might need to change the imports and the printlcd() function. 

**Arduino Code**

<script src="https://gist.github.com/xively-gists/5569462.js"></script>

**TODO: THIS CODE STILL NEEDS SOME WORK.**

<!-- Section end -->
{% endcapture %}
{{ section | unindent | markdownify }}
</div>
<!-- /Section end -->

<!-- Section beginning -->
<div id="bring-it-together" class="tutorial-section">

{% capture section %}
<!-- /Section beginning -->

# Bring it Together

You can now watch your Xively Feed on the Arduino LCD by connecting the Arduino with electric imp.


<!-- Section end -->
{% endcapture %}
{{ section | unindent | markdownify }}
</div>
<!-- /Section end -->
