---
layout: apidoc
section: dev
active: api
name: Search Feeds
order: 40

---


## HTTP Request

    
| Example URL | https://api.xively.com/v2/feeds/
| Formats | json, xml, csv  
| Methods | GET  

The default page size returned contains 50 Feeds. Each Feed snapshot contains the current value of each Datastream and of the Feed's metadata.

The search can be refined by applying the parameters detailed below.


## Query Parameters

### Refining the Search

The following parameters can be applied to limit or refine the list of Feeds that are returned:

| Parameter | Description | Example  
|-----------|-------------|---------  
| page | Integer indicating which page of results you are requesting. Starts from 1. | https://api.xively.com/v2/feeds?page=2  
| per_page | Integer defining how many results to return per page (1 to 1000). | https://api.xively.com/v2/feeds?per_page=5  
| content | String parameter ('full' or 'summary') describing whether we want full or summary results. Full results means all Datastream values are returned, summary just returns the environment meta data for each Feed. | https://api.xively.com/v2/feeds?content=summary  
| q | Full text search parameter. Should return any Feeds matching this string. | https://api.xively.com/v2/feeds?q=arduino  
| tag | Returns Feeds containing Datastreams tagged with the search query. | https://api.xively.com/v2/feeds?tag=temperature  
| user | Returns Feeds created by the user specified. | https://api.xively.com/v2/feeds.xml?user=xively  
| units | Returns Feeds containing Datastreams with units specified by the search query. | https://api.xively.com/v2/feeds.xml?units=celsius  
| status | Possible values ('live', 'frozen', or 'all'). Whether to search for only live Feeds, only frozen Feeds, or all Feeds. Defaults to all. | https://api.xively.com/v2/feeds.xml?status=frozen  
| order | Order of returned Feeds. Possible values ('created_at', 'retrieved_at', or 'relevance'). | https://api.xively.com/v2/feeds.xml?order=created_at  
| show_user | Include user login and user level for each Feed. Possible values: true, false (default) | https://api.xively.com/v2/feeds.xml?show_user=true  

### Location-based Search

The following additional parameters are available which allow location-based searching of Feeds:

| Parameter | Description | Example  
|-----------|-------------|---------  
| lat | Used to find Feeds located around this latitude. Used if ids/_datastreams_ are not specified. | lat=51.5235375648154  
| lon | Used to find Feeds located around this longitude. Used if ids/_datastreams_ are not specified. | lon=-0.0807666778564453  
| distance | search radius | distance=5.0  
| distance_units | miles or kms (default) | distance_units=miles  






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
        <td>/v2/feeds</td>
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
        <strong style="margin-right:1em">PUT</strong>/v2/feeds.json
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
        <strong style="margin-right:1em">PUT</strong>/v2/feeds.xml
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
        <strong style="margin-right:1em">PUT</strong>/v2/feeds.csv
      </p>
      <!-- CSV -->

{% capture section %}

~~~  
This request does not require body data
~~~

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
{
    "totalResults":4299,
    "results":[
      {
        "feed":"https://api.xively.com/v2/feeds/5853.json",
        "title":"bridge19",
        "status":"live",
        "version":"1.0.0",
        "creator":"https://xively.com/users/hdr",
        "updated":"2010-06-08T09:30:21.472927Z",
        "created":"2010-05-03T23:43:01.238734Z",
        "location":{"domain":"physical"},
        "tags":[
            "Tag1",
            "Tag2"
        ],
        "datastreams":[
          {
            "max_value":"10000.0",
            "tags":["humidity"],
            "current_value":"435",
            "min_value":"-10.0",
            "at":"2010-07-02T10:21:57.101496Z",
            "id":"0"
          },
          {
            "max_value":"10000.0",
            "tags":["humidity"],
            "current_value":"herz",
            "min_value":"-10.0",
            "at":"2010-07-02T10:21:57.176209Z",
            "id":"1"
          }
        ]
      }
      {"feed": ...
      
      ...}
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
<eeml xmlns="http://www.eeml.org/xsd/0.5.1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:opensearch="http://a9.com/-/spec/opensearch/1.1/" version="0.5.1" xsi:schemaLocation="http://www.eeml.org/xsd/0.5.1 http://www.eeml.org/xsd/0.5.1/0.5.1.xsd">
  <opensearch:totalResults>4299</opensearch:totalResults>
  <opensearch:startIndex>0</opensearch:startIndex>
  <opensearch:itemsPerPage>50</opensearch:itemsPerPage>
  <environment updated="2010-06-08T09:30:21.472927Z" created="2010-05-03T23:43:01.238734Z" id="5853" creator="https://cosm.com/users/hdr">
    <title>bridge19</title>
    <feed>http://api.cosm.com/v2/feeds/5853.xml</feed>
    <status>live</status>
    <tag>Tag1</tag>
    <tag>Tag2</tag>
    <location domain="physical">
      <lat/>
      <lon/>
    </location>
    <data id="0">
      <tag>watts</tag>
      <min_value>0.0</min_value>
      <max_value>4355.0</max_value>
      <current_value at="2010-06-30T13:36:34.830647Z">126</current_value>
    </data>
  </environment>
  <environment 
  ...
</eeml>
~~~

{% endcapture %}  
{{ section | unindent | markdownify }} 

    </div>
    </li>

    <li id="response-csvTab">
      <!-- CSV -->

{% capture section %}

~~~  
7441,1,2010-06-01T12:01:32.1Z,123
7441,2,2010-06-01T12:01:32.1Z,456
<feed_id>,<stream_id>,<retrieved_at>,<value>
...
~~~
{: .language-markup}

{% endcapture %}  
{{ section | unindent | markdownify }} 

    </li>
  </ul>
</div>



