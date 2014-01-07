---
layout: apidoc
section: dev
active: api
name: API Keys
order: 10
---

API Keys are used to control access to all API resources. An API key is a hierarchy of three objects:

1. **A key object**: You can create as many keys as required.  For example, a user's device and the application that monitor it could receive separate API Keys.
2. **Inside a key object are one or more permissions objects.** A Key must have at least one Permissions object. Each Permissions object represents a different set of permissions. For example, a key could be created that allows read-only access to all public resources (suitable for embedding in JavaScript within a web page), but that also allows write access to one specific Feed from one specific IP address. Permissions for a key cascade, which means that if a key doesn't include any specific Feed restrictions, then it will be able to access all resources that the creating user can. Similarly, if you restrict a key's access to just a particular Feed, this key will still have the same level of access to all Datastreams contained by that Feed.
3. **Inside a permission object are (optionally) one or more resource objects.** Resource objects are optional.

## Specifying a Key in the Request
A key can be sent using one of two methods: as a request header or as a parameter in the request URL. For security reasons, sending API keys as a request header is the preferred method: while still not secure if sent over an unencrypted connection, it is less likely to be logged as part of the URL.

Note: If HTTP MUST be used (**the use of HTTP instead of HTTPS is strongly discouraged**), for security reasons, sending API keys in the request header, and not the URL, is the preferred method. While still not secure if sent over an unencrypted connection, headers are less likely to be logged as part of the URL and thus are just slightly less insecure.

Details of keys attributes are provided on the [Xively Resource Attributes page](/dev/docs/api/quick_reference/api_resource_attributes/)


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
        <td>/v2/feeds?key=YOUR_API_KEY_HERE</td>
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
        <strong style="margin-right:1em">GET</strong>/v2/feeds?key=YOUR_API_KEY_HERE
      </p>
      <!-- JSON -->

      <div class="language-javascript">

{% capture section %}

~~~
{
  "key":{
    "label":"sharing key",
    "private_access":"true"
    "permissions":[
      {
        "access_methods":["get","put","post","delete"],
        "source_ip":"192.168.0.1",
        "resources":[
          {
            "feed_id":"424",
            "datastream_id":"fan1"
          }
        ]
      },
      {
        "access_methods":["get"],
        "referer":"www.example.com"
      }
    ]
  }
}
~~~

{% endcapture %}  
{{ section | unindent | markdownify }} 

      </div>

    </li>
    <li id="request-xmlTab">
      <p>
        <strong style="margin-right:1em">GET</strong>/v2/feeds?key=YOUR_API_KEY_HERE
      </p>  
      <!-- XML -->
      <div class="language-markup">

{% capture section %}

~~~  
<key>
  <label>sharing key</label>
  <private-access>true</private-access>
  <permissions>
    <permission>
      <source-ip>192.168.0.1</source-ip>
      <access-methods>
        <access-method>get</access-method>
        <access-method>put</access-method>
        <access-method>post</access-method>
        <access-method>delete</access-method>
      </access-methods>
      <resources>
        <resource>
          <feed-id>424</feed-id>
          <datastream-id>fan1</datastream-id>
        </resource>
      </resources>
    </permission>
    <permission>
      <referer>www.example.com</referer>
      <access-methods>
        <access-method>get</access-method>
      </access-methods>
    </permission>
  <permissions>
</key>
~~~

{% endcapture %}  
{{ section | unindent | markdownify }} 

    </div>
    </li>

    <li id="request-csvTab">
      <!-- CSV -->

{% capture section %}

~~~  
CSV format not supported for this call
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
{
{
  "key":{
    "api_key":"zR9eEw3WfrSY1-NxO2jUBBoD21wRqVwgBLs3z5WVsu6fivNGjHT4861awP41Rl764q9ChqjaLL10OIvOFPwErQ",
    "label": "sharing key",
    "permissions":[
      {
        "access_methods":["get","put","post","delete"],
        "source_ip":"192.168.0.1",
        "resources":[
          {
            "feed_id":"424",
            "datastream_id":"fan1"
          }
        ]
      },
      {
        "access_methods":["get"],
        "referer":"www.example.com"
      }
    ]
  }
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
<key>
  <api-key>zR9eEw3WfrSY1-NxO2jUBBoD21wRqVwgBLs3z5WVsu6fivNGjHT4861awP41Rl764q9ChqjaLL10OIvOFPwErQ</api-key>
  <label>sharing key</label>
  <private-access>true</private-access>
  <permissions>
    <permission>
      <source-ip>192.168.0.1</source-ip>
      <access-methods>
        <access-method>get</access-method>
        <access-method>put</access-method>
        <access-method>post</access-method>
        <access-method>delete</access-method>
      </access-methods>
      <resources>
        <resource>
          <feed-id>424</feed-id>
          <datastream-id>fan1</datastream-id>
        </resource>
      </resources>
    </permission>
    <permission>
      <referer>www.example.com</referer>
      <access-methods>
        <access-method>get</access-method>
      </access-methods>
    </permission>
  <permissions>
</key>
~~~

{% endcapture %}  
{{ section | unindent | markdownify }} 

    </div>
    </li>

    <li id="response-csvTab">
      <!-- CSV -->

{% capture section %}

~~~  
CSV format not supported for this call
~~~
{: .language-markup}

{% endcapture %}  
{{ section | unindent | markdownify }} 

    </li>
  </ul>
</div>

