---
layout: apidoc
section: dev
active: api
name: List All Keys
order: 50
---

This method returns all of the user's keys. This list is not paginated: all keys are returned in a single document.
    
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
        <td>/v2/keys</td>
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
        <strong style="margin-right:1em">GET</strong>/v2/keys.json
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
        <strong style="margin-right:1em">GET</strong>/v2/keys.xml
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

      <div class="language-markup">

{% capture section %}

~~~
{
    "keys": [
        {
            "api_key": "API_KEY",
            "label": "Electric Key",
            "private_access": true,
            "permissions": [
                {
                    "access_methods": [
                        "get",
                        "put",
                        "post",
                        "delete"
                    ]
                }
            ]
        },
        {
            "api_key": "API_KEY",
            "expires_at": "2013-03-27T01:23:45Z",
            "label": "sharing key",
            "private_access": true,
            "permissions": [
                {
                    "access_methods": [
                        "get"
                    ]
                },
                {
                    "access_methods": [
                        "put"
                    ],
                    "referer": "my-domain.com",
                    "source_ip": "128.44.98.129",
                    "resources": [
                        {
                            "feed_id": 123199
                        }
                    ]
                }
            ]
        },
        {
            "api_key": "API_KEY",
            "label": "Another Key",
            "private_access": true,
            "permissions": [
                {
                    "access_methods": [
                        "get",
                        "put",
                        "post",
                        "delete"
                    ]
                }
            ]
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
<?xml version="1.0" encoding="UTF-8"?>
<keys type="array">
    <key>
        <api-key>API_KEY</api-key>
        <label>Electric Key</label>
        <private-access>true</private-access>
        <permissions>
            <permission>
                <access-methods>
                    <access-method>get</access-method>
                    <access-method>put</access-method>
                    <access-method>post</access-method>
                    <access-method>delete</access-method>
                </access-methods>
            </permission>
        </permissions>
    </key>
    <key>
        <api-key>API_KEY</api-key>
        <label>sharing key</label>
        <expires-at>2013-03-27 01:23:45 UTC</expires-at>
        <private-access>true</private-access>
        <permissions>
            <permission>
                <access-methods>
                    <access-method>get</access-method>
                </access-methods>
            </permission>
            <permission>
                <referer>my-domain.com</referer>
                <source-ip>128.44.98.129</source-ip>
                <access-methods>
                    <access-method>put</access-method>
                </access-methods>
                <resources>
                    <resource>
                        <feed-id>123199</feed-id>
                    </resource>
                </resources>
            </permission>
        </permissions>
    </key>
    <key>
        <api-key>API_KEY</api-key>
        <label>Another Key</label>
        <private-access>true</private-access>
        <permissions>
            <permission>
                <access-methods>
                    <access-method>get</access-method>
                    <access-method>put</access-method>
                    <access-method>post</access-method>
                    <access-method>delete</access-method>
                </access-methods>
            </permission>
        </permissions>
    </key>
</keys>
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
