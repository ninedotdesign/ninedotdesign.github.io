---
layout: apidoc
section: dev
active: api
name: Locations & Waypoints
order: 30
---

The Xively API supports location metadata for devices. A device can optionally have: no location data, a static location, or a series of waypoints. By default devices have no location data.

Location information is input in **decimal format**.

The behavior of location data is determined by the “disposition” attribute of a device's Feed.

- If the "disposition" attribute is set to “fixed”, the location metadata for a Feed is static. Writing new location metadata to a Feed overwrites the previous location data. Reading a Feed will return the location information with the Feed's metadata.

- If the "disposition" attribute is set to “mobile”, the location metadata for a Feed is dynamic. Every time a new location is written to the device’s Feed, a waypoint is created from the existing location information and the timestamp, and stored in a list of historical waypoints. Reading a mobile Feed returns the location metadata representing the most recent location and a series of waypoints for each previous location stored. 

Details of location and waypoint attributes are provided on the [Xively Resource Attributes page](/dev/docs/api/quick_reference/api_resource_attributes/).



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
        <td>PUT</td>
      </tr>
      <tr>
        <td>Base URL</td>
        <td>https://api.xively.com</td>
      </tr>
      <tr>
        <td>API Endpoint</td>
        <td>/v2/feeds/FEED_ID_HERE</td>
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
        <strong style="margin-right:1em">DELETE</strong>/v2/feeds/FEED_ID_HERE.json
      </p>
      <!-- JSON -->

      <div class="language-javascript">

{% capture section %}

~~~
{
    "location": {
        "disposition": "mobile",
        "name": "Monuriki Island",
        "exposure": "outdoor",
        "domain": "physical",
        "ele": "370000",
        "lat": 17.609991828964787,
        "lon": 177.03402996826173
    }
}
~~~

{% endcapture %}  
{{ section | unindent | markdownify }} 

      </div>

    </li>
    <li id="request-xmlTab">
      <p>
        <strong style="margin-right:1em">DELETE</strong>/v2/feeds/FEED_ID_HERE.xml
      </p>
      <!-- XML -->
      <div class="language-markup">

{% capture section %}

~~~  
<?xml version="1.0" encoding="UTF-8"?>

<eeml>
    <environment>
        <location domain="physical" exposure="outdoor" disposition="mobile">
            <name>Monuriki Island</name>
            <lat>17.609991828964787</lat>
            <lon>177.03402996826173</lon>
            <ele>0</ele>
        </location>
    </environment>
</eeml>

~~~

{% endcapture %}  
{{ section | unindent | markdownify }} 

      </div>
    </li>

    <li id="request-csvTab">
      <!-- CSV -->
      <div class="language-markup">

{% capture section %}

~~~  
CSV format not supported for this call
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
        <td>No Headers</td>
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
This response does not contain body data
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
This response does not contain body data
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
This response does not contain body data
~~~

{% endcapture %}  
{{ section | unindent | markdownify }} 

      </div>
    </li>
  </ul>
</div>
