---
layout: tutorial
section: dev
active: tutorials
name: Electric Imp
description: Get WiFi and a microcontroller in the size of an SD card
categories: ["dev", "tutorials"]
tags: ["hardware", "in progress"]
image: tutorials/imp/electricimp_board.png

---



UNDER DEVELOPMENT

1) Intro 

* * *

The Electric Imp packs a WiFi router, microcontroller, and 6 I/O pins into the form factor of an SD card.  You write the Imp code in an online IDE, using a language called Squirrel, and the card runs 

![](attachments/2130218/2523138.jpg?effects=border-simple,blur-border)

In this tutorial, we will use an Electric Imp to report the light levels in a room back to Xively, and control an LED through a Xively feed.

## 2) Set up your Imp

Imp setup involves "commissioning" your Imp – which really just means passing the card your WiFi network name & password.

    

If you're using the Sparkfun "Electric Imp Breakout", you'll need to bridge the VIN and USB pins before any power will pass into the Imp. We didn't want to solder on headers, so we just threaded some solder between those two holes & twisted the ends together. Voila!

## 3)

## 4)

 

## 5)

### Calum's agent for CSV upload to a single Datastream/Channel

**Basic Integration**

~~~
const FEED_ID = "119865";
const API_KEY = "ENTER_API_KEY";
function send_xively(datastream, value) {
  local xively_url = "https://api.xively.com/v2/feeds/" + FEED_ID + ".csv";
  server.log(xively_url);
  local body = "" + datastream + "," + value;
  local req = http.put(xively_url, {"X-ApiKey":API_KEY, "Content-Type":"text/plain", "User-Agent":"Xively-Imp-Lib/1.0"}, body);
  local res = req.sendsync();
  if(res.statuscode != 200) {
    server.log("error sending message: "+res.body);
  }
}

device.on("temp", function(temp) {
  server.log("device on");
  send_xively("temp",temp);
  //send_sms(TWILIO_TO_NUMBER, "hello from imp agent! woburn office temp: " + temp + "C");
});
~~~
{: .language-javascript}

## 6) 

 

## 7) Watch the results on your Xively dashboard

 

  ![](attachments/950275/1081348.gif)

