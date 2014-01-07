---
layout: apidoc
section: dev
active: api
name: List All Triggers
order: 50
---

Retrieves a list of all triggers for the authenticated account or a filtered list of only the triggers for a specified Feed.


Note:

- The data for a trigger read can only be encoded as xml or json, not csv.

A full list of trigger parameters is available on the [API Resource Attributes](/dev/docs/api/quick_reference/api_resource_attributes/) page.



##Parameters

The following optional parameter can be applied to filter the returned triggers:

| Parameter | Description | Example  
|-----------|-------------|---------  
| Feed_id | Filter the returned triggers to include only those on Datastreams of the specified Feed. | https://api.xively.com/v2/triggers?feed_id=123  


##Example filtered by FEED_ID

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
        <td>/v2/triggers</td>
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
        <strong style="margin-right:1em">GET</strong>/v2/triggers.json?feed_id=FEED_ID_HERE
      </p>
      <!-- JSON -->

      <div class="language-javascript">

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
        <strong style="margin-right:1em">GET</strong>/v2/triggers.xml?feed_id=FEED_ID_HERE
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
      <!-- CSV -->

{% capture section %}

~~~  
CSV format not available for this call
~~~
{: .language-markup}

{% endcapture %}  
{{ section | unindent | markdownify }} 

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
        <td></td>
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
[
    {
        "id": 21961,
        "url": "http://requestb.in/131tsul1",
        "trigger_type": "lt",
        "user": "USERNAME",
        "environment_id": 121601,
        "stream_id": "example",
        "threshold_value": "15.0",
        "notified_at": "2013-05-06T20:08:17Z"
    },
    {
        "id": 21962,
        "url": "http://requestb.in/131tsul1",
        "trigger_type": "lt",
        "user": "USERNAME",
        "environment_id": 121601,
        "stream_id": "example",
        "threshold_value": "15.0",
        "notified_at": "2013-05-06T20:08:17Z"
    },
    {
        "id": 21955,
        "url": "http://requestb.in/131tsul1",
        "trigger_type": "change",
        "user": "USERNAME",
        "environment_id": 121601,
        "stream_id": "example",
        "notified_at": "2013-05-06T20:08:17Z"
    }
]
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
<datastream-triggers type="array">
   <datastream-trigger>
   <id type="integer">21961</id>
   <url>http://requestb.in/131tsul1</url>
   <trigger-type>lt</trigger-type>
   <threshold-value type="float">15.0</threshold-value>
   <notified-at type="datetime">2013-05-06T20:08:17Z</notified-at>
   <user>calumbarnes</user>
   <environment-id type="integer">121601</environment-id>
   <stream-id>example</stream-id>
   </datastream-trigger>
   <datastream-trigger>
   <id type="integer">21962</id>
   <url>http://requestb.in/131tsul1</url>
   <trigger-type>lt</trigger-type>
   <threshold-value type="float">15.0</threshold-value>
   <notified-at type="datetime">2013-05-06T20:08:17Z</notified-at>
   <user>calumbarnes</user>
   <environment-id type="integer">121601</environment-id>
   <stream-id>example</stream-id>
   </datastream-trigger>
   <datastream-trigger>
   <id type="integer">21955</id>
   <url>http://requestb.in/131tsul1</url>
   <trigger-type>change</trigger-type>
   <notified-at type="datetime">2013-05-06T20:08:17Z</notified-at>
   <user>calumbarnes</user>
   <environment-id type="integer">121601</environment-id>
   <stream-id>example</stream-id>
   </datastream-trigger>
</datastream-triggers>
~~~

{% endcapture %}  
{{ section | unindent | markdownify }} 

    </div>
    </li>

    <li id="response-csvTab">
      <!-- CSV -->

{% capture section %}

~~~  
CSV format not available for this call
~~~
{: .language-markup}

{% endcapture %}  
{{ section | unindent | markdownify }} 

    </li>
  </ul>
</div>
