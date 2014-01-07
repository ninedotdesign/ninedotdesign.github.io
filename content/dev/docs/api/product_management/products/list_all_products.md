---
layout: apidoc
section: dev
active: api
name: List All Products
order: 50
---

Returns a paged list of products that are viewable by the authenticated account.

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
        <td>/v2/products</td>
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
        <strong style="margin-right:1em">GET</strong>/v2/products
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
    "products": [  
        {  
            "description": "",  
            "name": "AppImpTest",  
            "product_id": "_cDD-xSpd4Sga4qkfFn8",  
            "secret": "312f80a68b459f1c8ea02cde727de421ae58b828",  
            "state": "develop",  
            "devices_count": 1,  
            "activated_devices_count": 1,  
            "feed_defaults": {  
                "title": "AppImpTest",  
                "description": "testing devices",  
                "private": "false"  
            },  
            "user": "USERNAME"  
        },  
        {  
            "description": "this product is for testing",  
            "name": "AppImpTestProduct",  
            "product_id": "sUnhxcXc2umoOeXTRM7R",  
            "secret": "ee2ab38f9b85b6b2c1b150b1d416b3fa2683dc72",  
            "state": "deploy",  
            "devices_count": 4,  
            "activated_devices_count": 1,  
            "feed_defaults": {  
                "title": "AppImpTest",  
                "description": "testing devices",  
                "tags": [  
                    "device:type=AppImpTest"  
                ],  
                "private": "false",  
                "datastreams": [  
                    {  
                        "id": "cycles"  
                    },  
                    {  
                        "id": "lastRun"  
                    },  
                    {  
                        "id": "onHand"  
                    }  
                ]  
            },  
            "user": "USERNAME"  
        },  
        {  
            "description": "this is a device on xively",  
            "name": "HowCosmWorks",  
            "product_id": "d4Oz0Bqn8qBvEH5ZwUUj",  
            "secret": "6f904d4fa3d0e99aa129ca68b5662b2344c804a7",  
            "state": "deploy",  
            "devices_count": 1,  
            "activated_devices_count": 0,  
            "feed_defaults": {  
                "title": "HowCosmWorks",  
                "tags": [  
                    "device:type=HowCosmWorks"  
                ],  
                "private": "true",  
                "datastreams": [  
                    {  
                        "id": "channel1"  
                    },  
                    {  
                        "id": "demo"  
                    }  
                ]  
            },  
            "user": "USERNAME"  
        },  
        {  
            "description": "this is a device on cosm",  
            "name": "HowCosmWorks",  
            "product_id": "VcAKMzq7JKIGw4K_IrAB",  
            "secret": "3e4caa330d52faf5df81ee36d9db673a137522af",  
            "state": "develop",  
            "devices_count": 1,  
            "activated_devices_count": 1,  
            "feed_defaults": {  
                "title": "HowCosmWorks",  
                "tags": [  
                    "device:type=HowCosmWorks"  
                ],  
                "private": "true",  
                "datastreams": [  
                    {  
                        "id": "channel1"  
                    },  
                    {  
                        "id": "demo"  
                    }  
                ]  
            },  
            "user": "USERNAME"  
        },  
        {  
            "description": "weather node using jeenode. sensors: temp, humidity, wind, pressure, light.",  
            "name": "Weather Node",  
            "product_id": "0SWwQ2dVYvbD9V-chnPO",  
            "secret": "7463601bb582f1702e2845269a5bb72e194f8979",  
            "state": "develop",  
            "devices_count": 1,  
            "activated_devices_count": 1,  
            "feed_defaults": {  
                "title": "Weather Node",  
                "private": "true"  
            },  
            "user": "USERNAME"  
        },  
        {  
            "description": "this is a device on cosm",  
            "name": "API Example",  
            "product_id": "h5wT2IlOMrd09r_qd1jm",  
            "secret": "836842cd3b57dce99afef7805c078a0821a88725",  
            "state": "deploy",  
            "devices_count": 1,  
            "activated_devices_count": 0,  
            "feed_defaults": {  
                "title": "Demo Unit",  
                "tags": [  
                    "device:type=API Example"  
                ],  
                "private": "true",  
                "datastreams": [  
                    {  
                        "id": "channel1"  
                    },  
                    {  
                        "id": "demo"  
                    }  
                ]  
            },  
            "user": "USERNAME"  
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
