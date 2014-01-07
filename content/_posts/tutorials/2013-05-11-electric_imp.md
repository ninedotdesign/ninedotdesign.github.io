---
layout: tutorial
section: dev
active: tutorials
name: Electric Imp as a Gateway
description: Use the Electric Imp as a serial-connected wireless gateway for the microcontroller of your choice
categories: ["dev", "tutorials"]
tags: ["hardware", "in progress"]
image: tutorials/imp_serial/imp.png


sidebar:
  - link: introduction
    label: Introduction
  - link: components
    label: Components
  - link: prepare
    label: Prepare Xively Information
  - link: setup
    label: Setup your Imp
  - link: setup-hardware
    label: Setup Hardware and Imp with FTDI
  - link: get-data
    label: Get data from Xively
  - link: outro
    label: Outro
---



<!-- Section beginning -->
<div id="introduction" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

#Introduction

The Electric Imp packs a WiFi radio, ARM Cortex M3 microcontroller, and 6 I/O pins into the form factor of an SD card. You can write custom device firmware for the imp MCU in the Electric Imp online IDE. This allows you to deploy code without being physically near the device. The online IDE also allows you to write server side code called Agents which can communicate very easily with the device. 

This server side code also makes it very easy to integrate Electric Imp with Xively. This tutorial will focus on connecting Electric Imp with Xively and then show you how to use your Electric Imp device to talk serial to another microcontroller. This is the easiest way to integrate Electric Imp into your project. 

It allows you to use all your existing hardware and code and then simply pass Serial UART messages to the Electric Imp which can in turn send them on to Xively. For the purposes of this tutorial we will show the the imp working with basic serial, using an FTDI cable to do basic UART. We will then show you how to integrate the Electric Imp with Arduino using UART communication. However, this code and tutorial could be adapted to work with any device or platform which support basic TX/RX lines, it will even work on Software Serial lines. 

<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->



<div id="components" class="tutorial-section">  
{% capture section %}  

#Components

Picture | Part | Buy
---|---|---
![The imp]({% asset_path tutorials/imp_serial/imp_on_black.jpg %}) | [Electric Imp](https://www.sparkfun.com/products/11395) | $29.95
![The "April" Board]({% asset_path tutorials/imp_serial/imp_april_board.jpg %}) | [imp "April" Development Board](https://www.sparkfun.com/products/11400) | $12.95
![FTDI Breakout Board]({% asset_path tutorials/imp_serial/imp_ftdi_breakout.jpg %}) | [FTDI Breakout Board](https://www.sparkfun.com/products/9716) | $14.95

{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>

<div id="prepare" class="tutorial-section">  
{% capture section %} 

#Prepare Xively Information
We need to either decide to use an existing feed or create an entirely new feed to use for this device.

##To make a new device:
1. Go to xively.com and [login](/login/) to your account.
2. Once in the [Develop](/develop/) tab, press the 'Add Device' button.
3. This will bring you to the add new device page, fill in a descriptive name for your device. "Electric Imp Sensor" is a good one.
4. Select whether you want your feed to be [public or private](/dev/docs/api/security/public_and_private_feeds/).
5. You can also add an optional description.
6. Finally click the "Add Device" button at the bottom to create your device. You will be taken to the newly created Xively Workbench for your device
7. The Xively Workbench is the center for all device development on Xively. It shows all your devices information (such as the feed ID which we will need later), recent requests to and from that device, current channel values, API keys, triggers, and more. 
8. In order to start sending data from the Arduino to Xively, you must add a Channel for each stream of data you want to send to Xively. Click the add Channel button, and add any channels you need now.
9. Finally, make sure you have your Feed ID and API key handy as we will need them in the next step. 
10. Finally, make sure you have your Feed ID and API key handy as we will need them in the next step. 

##To use an existing device:
1. Login to your Xively account and find the workbench for your desired feed
2. Make sure you have the Feed ID and API key for the desired devices

{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>

<div id="setup" class="tutorial-section">  
{% capture section %} 

#Setup your Imp
Now it's time to setup the electric Imp. I will not cover the basic imp setup procedure, but I will link to any necessary imp documentation.  I will then provide example Squirrel code to get the Imp working with UART and Xively. 

<!-- custom ordered list -->
<ol>
  <li>Commission your imp as <a href="http://devwiki.electricimp.com/doku.php?id=commissioning">described by the imp team</a></li>
  <li>Once your imp is connected to your WiFi, go to the <a href="https://plan.electricimp.com/">IDE page</a></li>
  <li>You are now ready to start writing code for your imp.</li>
  <li>
    <p>First we need to setup the example code</p>
    <p>You will notice that the Electric Imp IDE has 3 collapsible windows: Agent, Device, and Logs. Logs provides all the collected and printed information from your device and code, this is an invaluable debugging tool. Agent and Device are where we will be putting our code. The Agent is the server side code, this code runs on Electric Imp's servers and allows you to execute heavier tasks including HTTP requests. The Device code is the code runs on the physical imp card, an ARM M3 microcontroller, that will be inserted into your device. Electric Imp has created an easy way to pass messages from the device to the agent and vice versa.</p>
    <p>First we will focus on the Agent code since this is where we will do the communication with Xively. This is the most basic Agent, which receives a pre formatted string with comma separated key,value pairs separated by newlines. There are a variety of ways to pass data to Xively, all will work with imp UART, but CSV is easiest to format by hand and simply demonstrates what we are doing.</p>
  </li>
  <li>
    <p>Copy the code below into your agent tab in the Electric Imp IDE.</p>

    <div class="tutorial-gist">
      <a href="#" data-ui-toggle data-target="next">Show/Hide Code</a>
      <div class="toggle-content" style="display:none">
        <!-- Gist Goes Here -->
        <script src="https://gist.github.com/xively-gists/5519538.js"></script>
      </div>
    </div>
    
  </li>
  <li>
    <p>Once copied, change where it says FEED_ID_HERE and API_KEY_HERE to your respective Xively Feed ID and API key that we talked about in the first section.</p>
    <p><strong>Note</strong>: A PUT to Xively returns only a 200 OK with no body, so don't expect to see a result of the request on the imp. However, you will be able to see the request come in, in your workbench debug panel.</p>
  </li>
  <li>
    <p>Next it is time to setup our device code. This code may need to vary depending on the type of UART device you are trying to interface with. The basic setup provided will work with and FTDI cable or Arduino microcontroller. Although untested, It should also work with most hardware development platforms.  However, you may need to experiment with the baud, parity, and stop bits if you are using a different platform.</p>

    <div class="tutorial-gist">
      <a href="#" data-ui-toggle data-target="next">Show/Hide Code</a>
      <div class="toggle-content" style="display:none">
        <p>This configures the device for unidirectional communication on the UART57 port which means that the RX/TX pins are pin 5 and 7 on the imp card and imp breakout. This code will poll this UART port 1000 times per second and check for new data. When it finds the new data it will send the full string to the agent and then on to Xively. We next have to setup the hardware so that this UART port is connected to something.</p>
        <!-- Gist Goes Here -->
        <script src="https://gist.github.com/xively-gists/5519543.js"></script>
      </div>
    </div>

  </li>
</ol>

{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>

<div id="setup-hardware" class="tutorial-section">  
{% capture section %}

#Setup Hardware and Imp with FTDI

![FTDI Connection Diagram]({% asset_path tutorials/imp_serial/imp_ftdi.png %})

We now have to setup our hardware. We will start with the most basic connection. By connecting the imp UART pins to an FTDI cable, we can interact with the imp through any serial monitor application; such as Hyperterm, Screen, putty, or the Arduino Serial Monitor. Here is a table of the pin connections in case it is hard to see.

| FTDI | imp ("April" Board") |
|---|---|
| RX | TX |
| TX | RX |
| VCC(5v) | VIN |
| GND | GND |

**Note**: RX goes to TX and TX goes to RX. 
 
Now that you have it hooked up, its time to start sending messages with our terminal program. Since we have connected this to our Xively feed. You can send data to Xively as you would in the CSV body of a post request. The UART device code has been configured to use start and stop bytes in order to ensure the correct reception of received messages. These are configurable in the first lines of the code and can be changed depending on the system you are using. Since most terminal programs will only send characters I have set the default start byte to be 124 which is a vertical bar: ( **\|** ) The end byte is 126 which is a tilde: ( **~** ) If you can write byte values as opposed to using characters you may better off using byte values 3 and 4 which are start text and stop text respectively. 

Here is an example that will create a datastream called sensor and make 100 its first value:

~~~
sensor,100~
~~~
<br>
To pass multiple datastreams, you must seperate your key,value pairs with a newline (byte 10 or \n on many platforms):

~~~
sensor1,33
sensor2,50
sensor3,75~
~~~
<br>
Here is what it should like in your imp log console when you are sending data:

![]({% asset_path tutorials/imp_serial/screen_1.png %})
 
We are using a serial terminal as a demonstration in this tutorial. However, you can pass values the same way from any platform or device that will talk UART. This means you can configure the imp to be your gateway to the internet and directly to Xively. As I said before this could should work out of the box for most UART platforms. 

{% endcapture %}  
{{ section | ueindent | markdownify }}  
</div>

<div id="get-data" class="tutorial-section">  
{% capture section %} 

# Get data from Xively

Now we know how to send our data over the UART to Xively. But what if we want to receive data from Xively to our device. We can do that by adding some small snippets of code to our existing imp agent and device code. This is very easy on the device side, just add the following code to the top level of your device:

##Device - Get Snippet
<script src="https://gist.github.com/xively-gists/5519556.js"></script>

 
On the agent side we need to add the pieces that will actually talk to Xively at a given interval to check for new data. Add the following code to the top level of your agent code:

##Agent - Get Snippet
<script src="https://gist.github.com/xively-gists/5519557.js"></script>
 
This function continues to call it self at a configurable interval. The default is 15 but you can change this by changing the "15.0" in the line where it says imp.wakeup(15.0, get_xively) to a number of seconds of your choosing. This code also provides options for what data you want to send back to the device, and thus back to your UART connect device. By default this code will send the entire JSON document containing all the feed information. However, this data is also parsed into a convenient table format which can be used to access the specific pieces of the data. This can be used if for example you want to send only the value of a single feed to your device. I have added some debug statements do you get an idea of how the table structure works. These Squirrel tables (associative arrays?) are very powerful and should allow you to format the data however you see fit. Alternatively, you can use the default, pass all the data and parse it later on your device.

**Here is each piece of code in its entirety:**

##Agent Code

<div class="tutorial-gist">
  <a href="#" data-ui-toggle data-target="next">Show/Hide Code</a>
  <div class="toggle-content" style="display:none">
    <!-- Gist Goes Here -->
    <script src="https://gist.github.com/xively-gists/5519561.js"></script>
  </div>
</div>



##Device Code

<div class="tutorial-gist">
  <a href="#" data-ui-toggle data-target="next">Show/Hide Code</a>
  <div class="toggle-content" style="display:none">
    <!-- Gist Goes Here -->
    <script src="https://gist.github.com/xively-gists/5519566.js"></script>
  </div>
</div>

<br>
After making the above changes to your code, run it on your imp. If you are connected with FTDI you should see the feed data streaming into your Serial monitor. You should see a new set of data every 15 seconds, or whatever you configured imp.wakeup to in the previous step. Here is what it looks like in the serial console:

![]({% asset_path tutorials/imp_serial/screen_2.png %})

{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>

<div id="outro" class="tutorial-section">  
{% capture section %} 

# Outro
You have now established bidrectional communication with Xively. This should provide a basic boilerplate for interfacing Electric Imp and Xively with your existing UART compatible device. This concludes this section of the Xively, Electric Imp UART tutorial. If this has given you a good idea of how to interface your product with Electric Imp that's great!

{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
