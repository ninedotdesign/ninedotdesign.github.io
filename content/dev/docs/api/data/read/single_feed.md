---
layout: apidoc
section: dev
active: api
name: Single Feed
order: 20
---



Returns a snapshot of a single Feed at the current time. Contains the current value of each Datastream and of the Feed's metadata.

## HTTP Request

    
| Example URL | https://api.xively.com/v2/feeds/61916  
| Formats | json, xml, csv  
| Methods | GET  

## Notes

- If the disposition of the Feed is "mobile" and waypoints have been created by writing locations to the Feed, then the read will return the list of waypoints as part of the location data.
- If the Feed serves data on request ("automatic" Feed) then the request triggers a refresh of the data, so that the next request (after the 5 second threshold) returns the updated data.
- The attribute "updated" (XML and JSON formats only) indicates when this data was last stored by Xively.
- The interpretation of the "status" element depends on whether the Feed is "manual" or "automatic":
  - **Manual**: 'live' means that the remote environment or device manually updated Xively (usually by PUT) with its data in the last 15 minutes; 'frozen' means that it was last updated more than 15 minutes ago
  - **Automatic**: 'live' means that Xively has successfully retrieved data from the remote environment or device in the last 15 minutes; 'frozen' means that either it has not retrieved data in the last 15 minutes or that the last time it attempted to retrieve data (within the last 15 minutes) it was unsuccessful.

## Filtering Datastreams

It is also possible to filter the Datastreams returned with the Feed by using the "datastreams" parameter and sending comma separated Datastream IDs. For example this request:

~~~  
https://api.xively.com/v2/feeds/10011.json?datastreams=energy,power  
~~~

will only return the Datastreams for Feed 10011 whose IDs are energy or power.

The following optional parameters can be applied to the returned Feed:

| Parameter | Description | Example  
|-----------|-------------|---------  
| Datastreams | Filter the returned Datastreams. Comma separated Datastream IDs. | https://api.xively.com/v2/feeds/123.json?datastreams=energy,power  
| show_user | Include user login for each Feed. Possible values: true, false (default). | https://api.xively.com/v2/feeds/123.xml?show_user=true (json/xml only)  


<h1>API Call Examples</h1>

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
        <strong style="margin-right:1em">GET</strong>/v2/feeds/FEED_ID_HERE.json
      </p>
      <!-- JSON -->

      <div class="language-markup">

{% capture section %}

~~~
This request does not require body data
~~~

{% endcapture %}  
{{ section | unindent | markdownify }} 

      </div>

    </li>
    <li id="request-xmlTab">
      <p>
        <strong style="margin-right:1em">GET</strong>/v2/feeds/FEED_ID_HERE.xml
      </p>  
      <!-- XML -->
      <div class="language-markup">

{% capture section %}

~~~  
This request does not require body data
~~~

{% endcapture %}  
{{ section | unindent | markdownify }} 

    </div>
    </li>

    <li id="request-csvTab">
      <p>
        <strong style="margin-right:1em">GET</strong>/v2/feeds/FEED_ID_HERE.csv
      </p>
      <!-- CSV -->
      <div class="language-markup">

{% capture section %}

~~~  
This request does not require body data
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

      <div class="language-markup">

{% capture section %}

~~~
 {
 	"id": 121601,
 	"title": "Demo",
 	"private": "false",
 	"feed": "https://api.xively.com/v2/feeds/121601.json",
 	"status": "frozen",
 	"updated": "2013-04-23T03:25:48.686462Z",
 	"created": "2013-03-29T15:50:43.398788Z",
 	"creator": "https://xively.com/users/calumbarnes",
 	"version": "1.0.0",
 	"datastreams": [
 	{
 		"id": "example",
 		"current_value": "333",
 		"at": "2013-04-23T01:10:02.986063Z",
 		"max_value": "333.0",
 		"min_value": "333.0"},
 	{
 		"id": "key",
 		"current_value": "value",
 		"at": "2013-04-23T00:40:34.032979Z"},
 	{
 		"id": "temp"
 	}],
 	"location": {
 		"domain": "physical"
 	}
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
 <?xml version="1.0" encoding="UTF-8"?>
<eeml 
 xmlns="http://www.eeml.org/xsd/0.5.1"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="0.5.1" xsi:schemaLocation="http://www.eeml.org/xsd/0.5.1 http://www.eeml.org/xsd/0.5.1/0.5.1.xsd">
 	<environment updated="2013-04-23T03:25:48.686462Z" created="2013-03-29T15:50:43.398788Z" id="121601" creator="https://xively.com/users/calumbarnes">
	 <title>Demo</title>
	 <feed>https://api.xively.com/v2/feeds/121601.xml</feed>
	 <status>frozen</status>
	 <private>false</private>
	 <location domain="physical" exposure="" disposition=""/>
	 <data id="example">
		 <current_value at="2013-04-23T01:10:02.986063Z">333</current_value>
		 <max_value>333.0</max_value>
		 <min_value>333.0</min_value>
	 </data>
	 <data id="key">
		 <current_value at="2013-04-23T00:40:34.032979Z">value</current_value>
	 </data>
	 <data id="temp"/>
 	</environment>
</eeml>
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
example,2013-04-23T01:10:02.986063Z,333
key,2013-04-23T00:40:34.032979Z,value
temp,,""
~~~

{% endcapture %}  
{{ section | unindent | markdownify }} 

      </div>
    </li>
  </ul>
</div>
