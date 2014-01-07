---
layout: apidoc
section: dev
active: api
name: Activate a Device
order: 10
---

Device Activation is the process by which a Device is [provisioned](/dev/docs/api/product_management/provisioning/) with a Feed ID and API Key upon initial wakeup.

The steps below outline how to configure your devices to Activate.

1. Devices are individual instances of a particular Product. Before a Device activates, it must be pre-registered with Xively under its parent Product, so that the API knows to expect an activation call from that particular device when it wakes up for the first time.  Pre-registering a Device is accomplished by uploading the Device's Serial Number - either from the Management Console of its parent Product, or [via the API](/dev/docs/api/product_management/devices/create_device/).  

2. Once pre-registered, a Device can Activate by sending an Activation Code to the Xively API.  This signals to Xively that the Device has woken up for the first time, and is requesting to be provisioned with a Feed ID and API Key that it can use.  A Device's Activation Code is generated using an HMAC-SHA1 hash that combines the Device's Serial Number with its parent Product's Product Secret to makes it effectively impossible for someone to extract the Product Secret from the activation code, or to fraudulently impersonate a Device in the provisioning process.

3. Upon successful activation, Xively automatically creates a Feed for the activated Device that is based on the Feed template of its parent Product family. The Feed ID of that new Feed, and an API key which allows full access permission to that Feed, are returned in the API call response. Once this process takes place, the Feed ID and API Key can also be retrieved independently with the use of a Master API Key and the Device’s Serial Number (see [keys](/dev/docs/api/security/keys/)).


**Notes**

- Device activation is most often called directly by the activating device, but as outlined in the [provisioning overview](/dev/docs/api/product_management/provisioning/), it can also be called by applications or services on behalf of an object.

- After the first Activation of a device, all future Activation calls must send the API Key originally issued with the Feed ID, or a Master API Key in order to prove identity.  This prevents fraudulent duplicate activations.

- To learn more about pre-registering Devices, and Device Serial Numbers, see [Create a Device](/dev/docs/api/product_management/devices/create_device/)

<h2>Request</h2>


<div class="code-examples">
  <table class="code-examples-table twelve">
    <thead>
      <tr>
        <th colspan="2">Parameters</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Method</td>
        <td>GET</td>
      </tr>
      <tr>
        <td>Base URL</td>
        <td>https://api.xively.com</td>
      </tr>
      <tr>
        <td>API Endpoint</td>
        <td>/v2/devices/ACTIVATION_CODE/activate</td>
      </tr>
    </tbody>
  </table> 

  <table class="code-examples-table twelve">  
    <thead>
      <tr>
        <th colspan="2">Headers</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>X-ApiKey</td>
        <td>API_KEY_HERE</td>
      </tr>
    </tbody>
  </table>
  
  <table class="code-examples-table twelve">
    <thead>
      <tr>
        <th colspan="2">Body</th>
      </tr>
    </thead>
  </table>  

  <!-- 
    REQUEST EXAMPLE
    notice the "response" id is replaced with "request" in the request table, this is important to maintain for styling
  -->
  <dl class="apidoc-tabs tabs">
    <dd class="active"><a href="#request-json">JSON</a></dd>
    <dd><a href="#request-xml">XML</a></dd>
    <dd><a href="#request-csv">CSV</a></dd>
  </dl>
  <ul class="apidoc-tabs-content tabs-content">
    <li class="active" id="request-jsonTab">
      <p>
        <strong style="margin-right:1em">GET</strong>/v2/devices/ACTIVATION_CODE/activate
      </p>
      <!-- JSON -->

      <div class="language-markup">

{% capture section %}

~~~
This request does not require body data.

If the device has already been activated once, making this call again 
will return "This device has already been activated" unless the 
API Key for the Feed is included with the request.
~~~

{% endcapture %}  
{{ section | unindent | markdownify }} 

      </div>

    </li>
    <li id="request-xmlTab">
      <!-- XML -->
      <div class="language-markup">

{% capture section %}

~~~  
XML format not available for this call
~~~

{% endcapture %}  
{{ section | unindent | markdownify }} 

    </div>
    </li>

    <li id="request-csvTab">
      <p>
        <strong style="margin-right:1em">GET</strong>/v2/devices/ACTIVATION_CODE/activate
      </p>
      <!-- CSV -->
      <div class="language-markup">

{% capture section %}

~~~  
This request does not require body data.

If the device has already been activated once, making this call again 
will return "This device has already been activated" unless the 
API Key for the Feed is included with the request.
~~~

{% endcapture %}  
{{ section | unindent | markdownify }} 

      </div>
    </li>
  </ul>
</div>

 

 

<h2>Response</h2>

<div class="code-examples">
  <table class="code-examples-table twelve">
    <thead>
      <tr>
        <th colspan="2">Parameters</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Status Code</td>
        <td>200 OK</td>
    </tbody>
  </table> 

<table class="code-examples-table twelve">  
    <thead>
      <tr>
        <th colspan="2">Headers</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Location</td>
        <td>https://api.xively.com/v2/products/h5wT2IlOMrd09r_qd1jm/devices</td>
      </tr>
    </tbody>
  </table>
  
  <table class="code-examples-table twelve">
    <thead>
      <tr>
        <th colspan="2">Body</th>
      </tr>
    </thead>
  </table>  

  <!-- 
    RESPONSE EXAMPLE
    notice the "request" id is replaced with "response" in the response table, this is important to maintain for styling
  -->
  <dl class="apidoc-tabs tabs">
    <dd class="active"><a href="#response-json">JSON</a></dd>
    <dd><a href="#response-xml">XML</a></dd>
    <dd><a href="#response-csv">CSV</a></dd>
  </dl>
  <ul class="apidoc-tabs-content tabs-content">
    <li class="active" id="response-jsonTab">
      <!-- JSON -->

      <div class="language-javascript">

{% capture section %}

~~~
{
    "apikey": "API_KEY_HERE",
    "feed_id": FEED_ID_HERE,
    "datastreams": [
        "temperature"
    ]
}
~~~

{% endcapture %}  
{{ section | unindent | markdownify }} 

      </div>

    </li>
    <li id="response-xmlTab">
      <!-- XML -->
      <div class="language-markup">

{% capture section %}

~~~  
XML format not available for this call
~~~

{% endcapture %}  
{{ section | unindent | markdownify }} 

    </div>
    </li>

    <li id="response-csvTab">
      <!-- CSV -->
      <div class="language-markup">

{% capture section %}

~~~  
API_KEY_HERE,FEED_ID_HERE,NUMBER_OF_CHANNELS_HERE,CHANNEL_NAME_HERE
~~~

{% endcapture %}  
{{ section | unindent | markdownify }} 

    </div>
    </li>
  </ul>
</div>
