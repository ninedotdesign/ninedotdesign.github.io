---
layout: tutorial
section: dev
active: tutorials
name: Xively Basics, the Develop stage
description: A quick overview of the Xively develop stage, where you get your devices, apps and services working together through Xively.
categories: ["dev", "tutorials"]
tags: ["process", "in progress"]
image: tutorials/xively_develop/develop.png

sidebar:
  - link: develop
    label: The Develop Stage
  - link: workbench
    label: The Developer Workbench
  - link: deploy
    label: Move to Deploy
---


<!-- Section beginning -->
<div id="develop" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

#The Develop Stage

In the Develop stage, the goal is to get a prototype of your product working quickly and easily. In this stage, you create a device, connect your devices, services, and/or apps, and test.

![Add Device]({% asset_path tutorials/xively_develop/develop_add_device.png %})

**Create a Device** 
Just click the Add Device button and give the device a name, description, and privacy (whether the feed can be viewed by external users). Xively automatically creates the Feed ID and API Key you’ll need to connect your device.

- **Feed ID** A Feed is the collection of channels (datastreams) defined for a device plus any metadata, such as location, whether the device is physical/virtual, fixed/mobile, indoor/outdoor, etc.
- **API Key** API Keys determine levels of permissions for access to Xively resources. Xively creates an API key automatically for your prototype with full permission: read, update, create, delete. You can also create more finely-grained permissions for greater security (see below) to give the right access at the right time to the right person.

**Connect Your Devices, Services, and Apps** 
To connect your device, just copy the displayed Feed ID and API Key to the code in your device responsible for establishing bi-directional communication with Xively. You can also connect any app or service that you would like to this feed through the Xively API. We provide many [Libraries](/dev/libraries/) and [Tutorials](/dev/tutorials/) that make the process easy.


**Test** 
Using the Developer Workbench, you can debug in real time and monitor bi-directional communication between your device and Xively. Watch the values refresh on the channel, see the request log updated, and see the actual HTTP requests.

<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->

<!-- Section beginning -->
<div id="workbench" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

#The Developer Workbench

Your device has its own customizable Workbench where you configure channels, meta-data, fine-grain permissions, and connection with services.

<img src="{{ asset_path tutorials/xively_develop/workbench.png }}">

**Channels**
You need to add at least one channel to a device. A channel enables the bi-directional exchange of datapoints between the Xively platform and authorized devices, applications, and services. Each datastream represents a specific attribute, unit, or type of information, for example readings from a sensor or commands from an app. 

**Locations**
Notice that there’s a link to manually add location data to your channel. If your device is stationary, you could manually add a waypoint to it now, but  devices can easily also send location data via the API.

**Metadata**
Creator is a URL referencing the creator of the feed and Website refers to the URL of a website which is relevant to this feed, for example a home page. Many more Xively defined feed attributes can be specified using the Xively API. To specify additional metadata that you want to define you can use tags, which are key=value pairs.

**API Keys**
Keys determine permissions for access to Xively resources. Xively creates an API key automatically for your prototype with full access: read, update, create, delete. But you can create keys with fine-grained permissioning for tighter security to restrict access to Xively feeds, datastreams and datapoints. For example, a key might specify one permission that provides read-only access to all public resources and another permission that restricts write access for a particular IP address to a single feed. Note that you’ll use this API key when you provision your device.

**Triggers**
Use triggers to integrate first-party and third-party services. You specify the channel, the condition (e.g. greater than, equal), and the type of trigger (e.g. Tweet). When the condition is met, the trigger “fires” and sends a notification to the service.

**Note**
Triggers created in the Developer Workbench are for testing purposes only (not transferred to production devices). To create a trigger for a production device, an application, service, or the device itself uses the API.

**Request Log**
Here you can debug in real time and monitor communication and functionality. Watch the values refresh on the channel, see the request log updated, and click on GET and PUT to see the actual HTTP requests.

<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->



<!-- Section beginning -->
<div id="deploy" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

#Time to Deploy

Now that we've finished developing, it's time to move to the deploy stage.

<p>
  <a href="/dev/tutorials/xively_deploy/" class="button">Go to Deploy<i class="button-icon icon-arrow-right"></i></a>
</p>

<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->
