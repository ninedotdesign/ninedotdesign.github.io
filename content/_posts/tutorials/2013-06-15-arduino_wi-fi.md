---
layout: tutorial
section: dev
active: tutorials
name: Arduino WiFi
description: Connect an Arduino to Xively using the official Arduino WiFi shield
categories: ["dev", "tutorials"]
tags: ["hardware"]
image: tutorials/arduino_wifi/Arduino_WiFi_Shield.jpg

sidebar:
  - link: introduction
    label: Introduction
  - link: components
    label: Additional Components
  - link: arduino
    label: Set up the Arduino
  - link: sensors
    label: Connect some sensors
  - link: upload
    label: Upload your Code
---


<!-- Section beginning -->
<div id="introduction" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

# Introduction:

This tutorial shows you how to connect your Arduino Uno with an Official Arduino WiFi shield to Xively. This setup allows you to connect your Arduino to just about any web service. The Arduino is available for $30 and the WiFi shield is available for $85. This tutorial will establish bidirectional communication with Xively; allowing you to pass sensor data to Xively as well as receive actuation commands. 


### Hardware

Uno Stats:  [http://arduino.cc/en/Main/ArduinoBoardUno](http://arduino.cc/en/Main/ArduinoBoardUno)

Property | Description
---|---|  
Microcontroller | ATmega328  
Operating Voltage | 5V  
Input Voltage (recommended) | 7-12V  
Digital I/O Pins | 14 (of which 6 provide PWM output)  
Analog Input Pins | 6  
Flash Memory | 32 KB (ATmega328) of which 0.5 KB used by bootloader  
EEPROM | 1 KB (ATmega328)  
Clock Speed | 16 MHz  

 

Official WiFi shield:  [http://arduino.cc/en/Main/ArduinoWiFiShield](http://arduino.cc/en/Main/ArduinoWiFiShield)

<div class="disc">
  <li>Requires an Arduino board (not included)</li>
  <li>Operating voltage 5V (supplied from the Arduino Board)</li>
  <li>Connection via: 802.11b/g networks</li>
  <li>Encryption types: WEP and WPA2 Personal</li>
  <li>Connection with Arduino on SPI port</li>
  <li>on-board micro SD slot</li>
  <li>ICSP headers</li>
  <li>FTDI connection for serial debugging of WiFi shield</li>
  <li>Mini-USB for updating WiFi shield firmware</li>
</div>


 <!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>

<!-- Section beginning -->
<div id="components" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

# Components

<table>
  <thead>
    <tr>
      <th width="200">Picture</th>
      <th>Part</th>
      <th width="100">Price</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><img src="{% asset_path tutorials/arduino_wifi/ArduinoUno_R3_Front.jpg %}"></td>
      <td>Arduino Uno R3</td>
      <td>$29.95</td>
    </tr>
    <tr>
      <td><img src="{% asset_path tutorials/arduino_wifi/wifi_shield.jpg %}"></td>
      <td>Arduino WiFi Shield</td>
      <td>$84.95 </td>
    </tr>
    <tr>
      <td><img src="{% asset_path tutorials/arduino_wifi/photocell.jpg %}"></td>
      <td>Photocell*</td>
      <td>$1.50 </td>
    </tr>
    <tr>
      <td><img src="{% asset_path tutorials/arduino_wifi/resistor_1k.jpg %}"></td>
      <td>1k Ohm Resistor*</td>
      <td>$0.25</td>
    </tr>
    <tr>
      <td><img src="{% asset_path tutorials/arduino_wifi/resistor_220.jpg %}"></td>
      <td>220 Ohm Resistor</td>
      <td>$0.25</td>
    </tr>
    <tr>
      <td><img src="{% asset_path tutorials/arduino_wifi/breadboard.jpg %}"></td>
      <td>Any Breadboard*</td>
      <td>$3.00</td>
    </tr>
    <tr>
      <td><img src="{% asset_path tutorials/arduino_wifi/led.jpg %}"></td>
      <td>LED*</td>
      <td>$0.35</td>
    </tr>
  </tbody>
</table>

* These items are commonly included in [Arduino starter kits](https://www.sparkfun.com/products/11227), or [basic component packs](https://www.sparkfun.com/products/10003).


<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>

<!-- Section beginning -->
<div id="arduino" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

# Set up the Arduino

### Install IDE

If you have already used Arduino before this then you can skip this step. This will setup the Arduino development environment on your computer which will allow you to upload code to your Arduino. This is what we will be using to configure the Arduino to upload data to Xively. Go to the Arduino website and choose your platform (Windows, Mac, or Linux) and follow their [guide to installing the IDE](http://arduino.cc/en/Guide/HomePage). This will install the WiFi library required for using the WiFi shield. After installing the IDE come back to this guide to finish the rest of the setup.

### Install Custom Libraries

We have created a custom library for use with the Arduino in order to help making your calls to Xively a little bit easier. The [Xively Arduino Library](https://github.com/xively/xively_arduino) lives on Github, here's how you can set it up:

1. Download the Xively library:  [https://github.com/xively/xively_arduino/archive/master.zip](https://github.com/xively/xively_arduino/archive/master.zip)
2. Locate your Arduino sketchbook folder. This is usually called either sketchbook or Arduino and can be found in your My Documents (Windows) or Home (Mac / Linux) folder. 
3. Inside your sketchbook folder there should be a folder called 'libraries'. If not you should create one.
4. Unzip the library archive to inside the libraries folder and rename the folder  to xively
5. Download the the HTTP Client library:  [https://github.com/amcewen/HttpClient/archive/master.zip](https://github.com/amcewen/HttpClient/archive/master.zip)
6. Unzip the HTTP library into the libraries folder just like the Xively one, call this one HTTP
7. All done! Your development environment is now ready.



<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>

<!-- Section beginning -->
<div id="sensors" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

# Setup Sensors

Now it's time to connect some sensors to your Arduino and start getting some data. Xively is designed to take any and all types of sensor data. For this tutorial we will be creating a light sensing device that will measure the relative light level at the sensor. However, these same practices can be applied to wide range of sensors to connect to Xively. In order to make this device you will need a [photocell](https://www.sparkfun.com/products/9088),  [1k resistor](https://www.sparkfun.com/products/8980), and [breadboard](https://www.sparkfun.com/products/137) (any size will do, but we will only be using a very small portion). These are commonly included in [Arduino starter kits](https://www.sparkfun.com/products/11227) or [basic component packs](https://www.sparkfun.com/products/10003). 

### Part 1 - Photocell

1. Plug the photocell into the breadboard
2. Place the 1k Ohm resistor in the breadboard so that one of its arms is in the same row as the photocell
3. Connect the photocell only row to +5v pin on the Arduino
4. Connect the resistor only row to GND
5. Connect the row with both pins to the A2, analog input pin on the Arduino

    
**It should look similar to this Fritzing diagram:**

<img src="{% asset_path tutorials/arduino_wifi/fritzing_4.png %}">

### Part 2 - LED

1. Connect the 220 Ohm resistor (orange, orange, brown) to the same row as the 1k Ohm resistor ground (side not connected to photocell)
2. Connect the LEDs negative (short leg) to the 220 Ohm resistors other (non-ground) side. The LEDs positive (long leg) should be in its own row
3. Finally connect this row to pin 9 on the Arduino

**Note:** Most Arduino boards already have a built-in LED connect to pin 13. It is usually labeled L and is near pin 13. However, pin 13 does not offer PWM which is needed to dim our LED. Also, later on in the tutorial we will be covering this on-board LED with the WiFi shield. We still want a LED to be able to control from Xively later on. 

**Diagram with LED added:**

<img src="{% asset_path tutorials/arduino_wifi/fritzing_5.png %}">

<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>

<!-- Section beginning -->
<div id="upload" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

# Load the test code onto Arduino

Now that we have our circuit it's time to load some code onto the Arduino to test out our sensor circuit. This code is designed to provide a basic reading for any analog sensor connected to A2. This sketch will take 10 sensor readings and then average. This helps account for any noise or irregularities which may occur on a single reading. There are setup variables at the top where you can adjust the analog input pin, the number of readings per sample, and the time between each reading. The sketch is designed to work without any modification, but you can play with these values if you wish.


**Testing Environment**

<script src="https://gist.github.com/xively-gists/5519645.js"></script>

This sketch should take in light readings from the photocell and then inversely dim the LED. If you cover up the light sensor or turn down your lights you should see the LED brightness increase. It also prints all the sensor values to the Serial Monitor, so open the Serial Monitor and select 19200 baud. You should see the data start to pour in. If not, check your circuit and try again. 

## Setup New Xively:

Now that we know our sensing circuit works it is time to setup your Xively account. If you haven't made a Xively account already, [click here](/signup/) to get one. Now we will go through the process of adding a new device to the Xively Workbench, configuring it for our needs, and finding the necessary information to connect Xively to our Arduino sensing circuit. Start off by going to the Develop tab.


1. Once in the Develop tab, press the 'Add Device' button.
<img src="{% asset_path tutorials/arduino_wifi/screen_1.png %}">
2. This will bring you to the add new device page, fill in a descriptive name for your device. "Arduino Light Sensor" is a good one.
3. Select whether you want your feed to be public or private. More info about public/private devices [here](/dev/docs/api/security/public_and_private_feeds/).
4. You can also add an optional description at this stage.
<img src="{% asset_path tutorials/arduino_wifi/screen_2.png %}">
5. Finally click the "Add Device" button at the bottom to create your device
6. You will be taken to the newly created Xively Workbench for your device
7. The Xively Workbench is the center for all device development on Xively. It shows all your devices information (such as the feed ID which we will need later), recent requests to and from that device, current channel values, API keys, triggers, and more. 
8. In order to start sending data from the Arduino to Xively, you must add a Channel for each stream of data you want to send to Xively. Click the add Channel button.
9. Add two channels: one for the light sensor (something like "light" or "photocell") and one for the LED ("led" would be a good one)
<img src="{% asset_path tutorials/arduino_wifi/screen_3.png %}">
10. Whatever names your choose, make sure you keep track of them. You will also need your feed ID and API key for the next section so remember to keep them handy.   
    
## Connect Arduino to Xively:

Now that all the components are ready, we can connect the Arduino to Xively. This will allow for bidirectional communication between the Arduino and Xively. Your light readings will be available on the web and you will be able to toggle the LED from anywhere. Have your feed ID, channel names, and API key ready for this section. Start off by unplugging the breadboard leads from the Arduino Uno and then mate your Arduino Uno R3 with Official Arduino WiFi Shield.

Now reconnect the breadboard leads to the appropriate pins. In case you have forgotten, here is the Fritzing diagram again. Next I will go through the Arduino Sketch setup.

**Xively Wifi Tutorial**

Here is the Arduino sketch. See below for instructions on how to configure it.
<script src="https://gist.github.com/xively-gists/5561352.js"></script>

1. First we have to configure the WiFi shield to connect to your home wireless network. You will need to know your WiFi SSID, Security type, and passphrase or key.
2. Enter your SSID at the top of the sketch where it says "SSID_HERE". Do the same for your WEP key or WPA passphrase where is says "PASS_HERE".
3. Now you will use the feed ID, API key and channels you created in the previous step. Enter your key and feed ID where it says API_KEY_HERE and FEED_ID_HERE, respectively.
4. Finally, enter the names of your channels where it says LIGHT_SENSOR_CHANNEL and LED_CHANNEL respectively.
5. If you have connected your sensors to other pins you will need to change the pin values int he pin setup section
6. Your Arduino sketch should now be properly configured. Verify your code to make sure it will compile and everythign is setup correctly, then upload the code to the Arduino.
7. Open the serial monitor by clicking on the magnify glass button in the upper right hand corner of the Arduino IDE. This should allow you watch as the data does in and out of the Arduino. The serial monitor can also provide useful output for debugging if you are having problems.
8. You can also watch the data come into the [Xively workbench](/develop/)
9. You can change the brightness of your LED by changing the value in your wokrbench to something between 0 and 255. 
  <img src="{% asset_path tutorials/arduino_wifi/screen_4.png %}">


Your Arduino light sensing device should now be connected to Xively. You can see light readings and change the LED brightness. Feel free to modify this code to fit the needs of any sensor you want to connect to Xively. 

<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
