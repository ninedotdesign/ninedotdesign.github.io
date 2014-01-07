---
layout: tutorial
section: dev
active: tutorials
name: Xively Basics, the Manage stage
description: A quick overview of the Manage stage, where you manage batches of products no matter the size, one or one million, and support your devices in real time.. 
categories: ["dev", "tutorials"]
tags: ["process", "in progress"]
image: tutorials/xively_manage/manage.png

sidebar:
  - link: manage
    label: The Manage Stage
  - link: support
    label: Managing and Support
  - link: go
    label: Let's Go
---

<!-- Section beginning -->
<div id="manage" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

#The Manage Stage

Manage batches of products no matter the size, one or one million, and support your devices in real time. Now you’re managing your business, using the Management Console to support your product and your clients in the following ways.

![Manage console]({% asset_path tutorials/xively_manage/manage_console.jpg %})

**Final Product Secret**
At the top of the Management Console, you see the final product secret and product ID. You’ll need to add the product secret to the firmware in your manufactured devices.

**Add Serial Numbers** Just click the link to add more devices to your product batch.

**Search for a specific device** Enter a partial or full serial number and press Enter to filter the list of displayed devices.

**Show All Devices** If the Device List has been filtered, Click 'Show All' to show all devices in the product batch.

Filter by Activation Status: Click on the Activated or Not Activated links.

<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->

<!-- Section beginning -->
<div id="support" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

#Monitor Devices and Support Users

Click on the serial number of a device to monitor the device. The monitoring page is virtually identical to the Workbench page on which you configured your original prototype device. You can see your devices, channels, location, metadata, request log, API Keys, and triggers. At this stage, the information is presented for monitoring only, you almost never will be changing these attributes of a device in the field. As you’re monitoring, you commonly would do the following:

- **Deactivate a Device** If a device loses power and needs to provision itself again, click the Deactivate link. When the devices powers on again, it will send its activation code to Xively and be provisioned again.
- **Monitor Channels** To verify that the data coming from a device is as you expect and troubleshoot with users.
- **Monitor Request Log** Any call to the API made against this Feed ID shows up in the Request Log.

![Device Workbench]({% asset_path tutorials/xively_manage/deviceworkbench.jpg %})


<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->

<!-- Section beginning -->
<div id="go" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

#Let's Go

You've read the tutorials, and you're ready to start.  It's time to head to the Develop Workbench and get going.

<p>
  <a href="/develop/" class="button">Get Started<i class="button-icon icon-arrow-right"></i></a>
</p>

<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->
