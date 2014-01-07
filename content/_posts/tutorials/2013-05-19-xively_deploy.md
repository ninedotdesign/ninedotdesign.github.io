---
layout: tutorial
section: dev
active: tutorials
name: Xively Basics, the Deploy stage
description: A quick overview of the deploy stage, where you turn prototypes into products at the push of a button.
categories: ["dev", "tutorials"]
tags: ["process", "in progress"]
image: tutorials/xively_deploy/deploy.png

sidebar:
  - link: deploy
    label: The Deploy Stage
  - link: manage
    label: Move to Manage
---

<!-- Section beginning -->
<div id="deploy" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

#The Deploy Stage

![Deploy]({% asset_path tutorials/xively_deploy/deploy_modal.jpg %})

Turn prototypes into products at the push of a button. When you deploy, you create a batch of virtual products in Xively that correspond to a batch of manufactured physical products. You also transition from the Develop stage to the Manage stage. A product batch is defined by product metadata, an optional feed template, and a list of serial numbers.

- In the Workbench, click the Deploy button to begin the process of creating a product batch. Xively extracts a device template from the development device, which includes the device name and the channels from your development device.
- Click Next.

![Add Product]({% asset_path tutorials/xively_deploy/add_product.jpg %})

- Optional: You can customize the product template prior to adding a product batch.
- Click **Add Product Batch**. By default, the name, description, and privacy are the same as the prototype device, but you can change them at this time as needed for the final product.  Note that the Device Template shows the channels that every device in the product batch will have.
- Click **Add Batch**.

![Manage]({% asset_path tutorials/xively_deploy/manage.jpg %})

- Observe that Xively has auto-generated a Product ID and the Product Secret for your new product batch.

- Click Add Serial Numbers and add serial numbers to pre-register devices in this batch. You pre-register devices either by uploading a CSV file which has one device serial number per line or by entering the serial numbers manually. Pre-registering creates a batch of virtual products in Xively that correspond to physical products, enabling Xively to recognize authorized devices when they wake up and transmit an activation code during the provisioning process.

- Observe that all your devices now appear in the Devices table, sorted by Serial Number.

- Click on a device to drill down. Xively displays a page that shows all the same device details you originally configured when prototyping: list of the channels, request log, triggers, etc.

- At any time, you can add more devices by clicking 'Add Serial Numbers'.

**Note**
You might instead choose to create a “clean deployment,” which means that your product is not based on a development device. You do this from the Management Workbench, by creating a product batch with no template. This means that there are no default channels associated with this product batch. You then manually enter or upload the list of serial numbers for this batch as when you deploy a development device that is based on a template. 

<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->


<!-- Section beginning -->
<div id="manage" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

#Move to Management

Once we've deployed a device, it's time to move to the management console.

<p>
  <a href="/dev/tutorials/xively_manage/" class="button">Go to Manage<i class="button-icon icon-arrow-right"></i></a>
</p>

<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->
