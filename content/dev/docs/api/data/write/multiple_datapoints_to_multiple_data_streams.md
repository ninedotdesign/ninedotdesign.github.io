---
layout: apidoc
section: dev
active: api
name: Write Multiple Datapoints to Each Datastream
---

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
        <strong style="margin-right:1em">PUT</strong>/v2/feeds/FEED_ID_HERE.json
      </p>
      <!-- JSON -->

      <div class="language-javascript">

{% capture section %}

~~~
{
  "version":"1.0.0",
   "datastreams" : [ {
    "id" : "example",
        "datapoints":[
      {"at":"2013-04-22T00:35:43Z","value":"41"},
        {"at":"2013-04-22T00:55:43Z","value":"84"},
        {"at":"2013-04-22T01:15:43Z","value":"41"},
        {"at":"2013-04-22T01:35:43Z","value":"83"}
        ],
      "current_value" : "333"
    },
    { 
    "id" : "key",
        "datapoints":[
      {"at":"2013-04-22T00:35:43Z","value":"revalue"},
        {"at":"2013-04-22T00:55:43Z","value":"string value"},
        {"at":"2013-04-22T01:15:43Z","value":"any string"},
        {"at":"2013-04-22T01:35:43Z","value":"structured data"}
        ],
    "current_value" : "value"      
    },
    { 
      "id" : "datastream",
        "datapoints":[
      {"at":"2013-04-22T00:35:43Z","value":"51"},
        {"at":"2013-04-22T00:55:43Z","value":"102"},
        {"at":"2013-04-22T01:15:43Z","value":"32"},
        {"at":"2013-04-22T01:35:43Z","value":"16"}
        ],
    "current_value" : "1337"
    }
  ]
}
~~~

{% endcapture %}  
{{ section | unindent | markdownify }} 

      </div>

    </li>
    <li id="request-xmlTab">
      <p>
        <strong style="margin-right:1em">PUT</strong>/v2/feeds/FEED_ID_HERE.xml
      </p>  
      <!-- XML -->
      <div class="language-markup">

{% capture section %}

~~~  
<?xml version="1.0" encoding="UTF-8"?>
<eeml>
  <environment>
      <data id="example">
      <datapoints>
         <value at="2013-04-22T00:35:43Z">42</value>
         <value at="2013-04-22T00:55:43Z">84</value>
         <value at="2013-04-22T01:15:43Z">41</value>
         <value at="2013-04-22T01:35:43Z">83</value>
     </datapoints>
      <current_value>333</current_value>
    </data>
      <data id="key">
      <datapoints>
         <value at="2013-04-22T00:35:43Z">revalue</value>
         <value at="2013-04-22T00:55:43Z">string value</value>
         <value at="2013-04-22T01:15:43Z">any string</value>
         <value at="2013-04-22T01:35:43Z">{structured data}</value>
     </datapoints>
      <current_value>val</current_value>
    </data>
      <data id="datastream">
      <datapoints>
         <value at="2013-04-22T00:35:43Z">51</value>
         <value at="2013-04-22T00:55:43Z">102</value>
         <value at="2013-04-22T01:15:43Z">32</value>
         <value at="2013-04-22T01:35:43Z">16</value>
     </datapoints>
      <current_value>1337</current_value>
    </data>
  </environment>
</eeml>
~~~

{% endcapture %}  
{{ section | unindent | markdownify }} 

    </div>
    </li>

    <li id="request-csvTab">
      <p>
        <strong style="margin-right:1em">PUT</strong>/v2/feeds/FEED_ID_HERE.csv
      </p>
      <!-- CSV -->

{% capture section %}

~~~  
example,2013-04-22T00:35:43Z,42
example,2013-04-22T00:55:43Z,84
example,2013-04-22T01:15:43Z,41
example,2013-04-22T01:35:43Z,83
key,2013-04-22T00:35:43Z,revalue
key,2013-04-22T00:55:43Z,any string
key,2013-04-22T01:15:43Z,string value
key,2013-04-22T01:35:43Z,structured data
datastream,2013-04-22T00:35:43Z,51
datastream,2013-04-22T00:55:43Z,102
datastream,2013-04-22T01:15:43Z,32
datastream,2013-04-22T01:35:43Z,16
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
This response does not return body data
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
This response does not return body data
~~~

{% endcapture %}  
{{ section | unindent | markdownify }} 

    </div>
    </li>

    <li id="response-csvTab">
      <!-- CSV -->

{% capture section %}

~~~  
This response does not return body data
~~~
{: .language-markup}

{% endcapture %}  
{{ section | unindent | markdownify }} 

    </li>
  </ul>
</div>
