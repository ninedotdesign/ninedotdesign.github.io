---
layout: tutorial
section: dev
active: tutorials
name: Overlay Data with SensMap
description: A tutorial created by Wislab to showcase how to overlay Xively data on a map using the SensMap Visualization Framework.
categories: ["dev", "tutorials"]
tags: ["service"]
image: tutorials/wislab/wislab_tutorial.png

sidebar:
  - link: intro
    label: Introduction
  - link: demo
    label: Live Demo    
  - link: link
    label: Link to Tutorial
  - link: feedback
    label: Feedback
---

<!-- Section beginning -->
<div id="intro" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

#Introduction

The SensMap Visualization Framework, a tool created by Wislab provides a variety of ways to view your data, including on an interactive map.  

The SensMap Visualization Framework provides a simple framework for visualizing when, what, and where your data was measured. They have integrated Xively into their framework, which means that you can use SensMap to view the data in your Xively feeds. You can create buildings that contain Xively devices and then view those buildings on a map. They also built in graphing tools for your data, as well as an easy export feature. 

The Wislab team has written a great tutorial of how to use SensMap with Xively. The tutorial assumes that you already have some devices setup on Xively. So if you haven't yet setup any devices on Xively you should look at these tutorials: 

*  [Arduino Wifi](/dev/tutorials/arduino_wi-fi/)
*  [Raspberry Pi](/dev/tutorials/pi/)
*  [ARM mBed](/dev/tutorials/mbed/)
*  [electric imp](/dev/tutorials/electric_imp/)

<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->

<!-- Section beginning -->
<div id="demo" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

#SensMap Demo
Wislab, the creators of SensMap, have setup a demonstration of using the SensMap Visualization Framework with Xively. They have created a wireless sensor network based on ZigBee Pro. Each node has a ZigBee radio on it, as well as 4 analog inputs, nodes can have a variety of sensors connected to them, such as: light, temperature, and more. They have deployed 10 of these across the faculty building for the Department of Telecommunications at Bern University in the Czech Republic.   

[Click here to checkout the demo](http://wislab.cz/wsnapp/outdoorview/index.htm?&user=wislab&tag=&ft=&lat=&lng=&radius=)  

<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->

<!-- Section beginning -->
<div id="link" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

#SensMap Tutorial
[![picture of wislab]({% asset_path tutorials/wislab/wislab_screenshot.png %})](http://www.wsnapp.wislab.cz/quick-start-guide/)
[http://www.wsnapp.wislab.cz/quick-start-guide/](http://www.wsnapp.wislab.cz/quick-start-guide/)


<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->

<!-- Section beginning -->
<div id="feedback" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

#Feedback
Wislab has created a form to provide feedback about the tutorial and system directly to them. This is what you should use if you are having issues, find bugs, or just want to offer your thoughts on the the Wislab Visualization Framework.
     
   
[Feedback Form](http://www.wsnapp.wislab.cz/send-a-feedback/)
<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->
