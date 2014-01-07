---
layout: apidoc
section: dev
active: api
name: List All Devices
order: 60
---

Returns a paged list of devices belonging to a specific product.



## Parameters

The following parameters can be applied to limit or refine the returned devices:

| Parameter | Description | Example  
|-----------|-------------|---------  
| page | Integer indicating which page of results you are requesting. Starts from 1. | https://api.xively.com/v2/products/<br>PRODUCT_ID/devices?page=2  
| per_page | Integer defining how many results to return per page (1 to 1000). | https://api.xively.com/v2/products/<br>PRODUCT_ID/devices?per_page=5  
| serial | Filter returned devices by serial, by passing either an exact or partial serial string | https://api.xively.com/v2/products/<br>PRODUCT_ID/devices?serial=1827b  
| activated | Possible values ('true', 'false', 'all'). Whether to return serials that have been activated, not yet activated, or all of them. Omitting this parameter returns 'all'. | https://api.xively.com/v2/products/<br>PRODUCT_ID/devices?activated=false  


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
        <td>/v2/products/PRODUCT_ID/devices</td>
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
        <strong style="margin-right:1em">GET</strong>/v2/products/PRODUCT_ID/devices
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
      <!-- CSV -->
      <div class="language-markup">

{% capture section %}

~~~  
CSV format not available for this call
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
{
    "totalResults": 6,
    "itemsPerPage": 30,
    "startIndex": 1,
    "devices": [
        {
            "serial": "abc321",
            "activation_code": "ACTIVATION_CODE",
            "created_at": "2013-05-05T18:11:42Z",
            "activated_at": null,
            "feed_id": DEVICE_FEED_ID
        },
        {
            "serial": "123abc",
            "activation_code": "ACTIVATION_CODE",
            "created_at": "2013-05-05T20:54:31Z",
            "activated_at": null,
            "feed_id": DEVICE_FEED_ID
        },
        {
            "serial": "cba123",
            "activation_code": "761854de348c8c201e87ff9d75be58d4d84cebbf",
            "created_at": "2013-05-05T20:55:28Z",
            "activated_at": null,
            "feed_id": 129696
        },
        {
            "serial": "789",
            "activation_code": "ad30b1629498084295c3a27f514129476bfa2e6b",
            "created_at": "2013-05-05T20:56:02Z",
            "activated_at": null,
            "feed_id": 129697
        }
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
CSV format not available for this call
~~~

{% endcapture %}  
{{ section | unindent | markdownify }} 

      </div>
    </li>
  </ul>
</div>



