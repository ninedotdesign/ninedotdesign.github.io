---
layout: apidoc
section: dev
active: api
name: Single Datastream
order: 10

---


Returns a snapshot of the specified Datastream, without any of the Feed metadata.  Reading data from a single Datastream at a time is not recommended, as the same information can be returned for all Datastreams simultaneously by **[reading the Feed](/dev/docs/api/data/read/single_feed/)** that holds that Datastream.

Though it is often better to read a Feed as described above, a unique feature of reading data from a single Datastream is that this API call offers the ability to request a PNG graph of the Datastream's history.

##PNG Graphs

Requesting the Datastream as a PNG image will generate a customizable graph of the Datastream's history as a .png file.

The time period of the graph can be customized by appending time period parameters to the request URL, as outlined in the [API Resources Table](/dev/docs/api/quick_reference/api_resources/) under "datastreams - Read (range)".  The interval is calculated automatically depending on the time range.

The appearance of the graph can also be customized by appending a question mark ( **?** ) and the following parameters to the URL of the request. Combine more than one parameter using the ampersand ( **&** ) character.  The look and feel of this graph can be controlled by the following parameters:

| Parameter | Description | Example 
|-----------|-------------|------------------------
|w|width in pixels|600
|h|height in pixels|400
|c|color in hex|FFCC33
|t|title|"My Favorite Graph"
|l|legend|"Legend For My Graph"
|s|stroke size in pixels|4
|b|show axis labels|true / false
|g|show detailed grid|true / false
|scale|method used to determine the y-axis scale|auto / Datastream / manual
|min|y-axis minimum value if scale=manual|0
|max|y-axis maximum value if scale=manual|100
|timezone|time zone of the graph|time zone from [this list](/dev/docs/api/communicating/time_zones/)

As an example, a default graph might look like this:

`https://api.xively.com/v2/feeds/FEED_ID_HERE/
datastreams/DATASTREAM_ID.png`

![]({% asset_path docs_images/random900_pink.png %})

Whereas appending color, grid, title, and axis label parameters to the same Datastream will produce:

`https://api.xively.com/v2/feeds/61916/datastreams/
random900.png?c=2188c5&g=true&t="My Graph"&b=true`

![]({% asset_path docs_images/random900_blue.png %})


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
        <td>/v2/feeds/FEED_ID_HERE/datastreams/DATASTREAM_ID</td>
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
    <dd><a href="#request-png">PNG</a></dd>
  </dl>
  <ul class="apidoc-tabs-content tabs-content">
    <li class="active" id="request-jsonTab">
      <p>
        <strong style="margin-right:1em">GET</strong>/v2/feeds/FEED_ID_HERE/datastreams/DATASTREAM_ID.json
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
        <strong style="margin-right:1em">GET</strong>/v2/feeds/FEED_ID_HERE/datastreams/DATASTREAM_ID.xml
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
    <li id="request-pngTab">
      <p>
        <strong style="margin-right:1em">GET</strong>/v2/feeds/FEED_ID_HERE/datastreams/DATASTREAM_ID.png
      </p>
      <!-- PNG -->
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
    <dd><a href="#response-png">PNG</a></dd>
  </dl>
  <ul class="apidoc-tabs-content tabs-content">
    <li class="active" id="response-jsonTab">
      <!-- JSON -->

      <div class="language-markup">

{% capture section %}

~~~
{
    "id":"example",
    "current_value":"500",
    "at":"2013-05-06T00:30:45.694188Z",
    "max_value":"500.0",
    "min_value":"333.0",
    "version":"1.0.0"
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
    <environment updated="2013-05-05T19:40:08.859383Z" created="2013-03-29T15:50:43.398788Z" id="121601" creator="https://xively.com/users/calumbarnes">
        <data id="example">
            <current_value at="2013-05-06T00:30:45.694188Z">500</current_value>
            <max_value>500.0</max_value>
            <min_value>333.0</min_value>
        </data>
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
2013-05-06T00:30:45.694188Z,500
~~~

{% endcapture %}  
{{ section | unindent | markdownify }} 

      </div>
    </li>

        <li id="response-pngTab">
      <!-- PNG -->

{% capture section %}


![]({% asset_path docs_images/random900_pink.png %})


{% endcapture %}  
{{ section | unindent | markdownify }} 

    </li>
  </ul>
</div>
