---
layout: apidoc
section: dev
active: api
name: Historical Data
order: 30
---

Returns a list of historical datapoints within the specified range for one or more datastreams. 


| Example URL | https://api.xively.com/v2/feeds/**_feed_id_**?**_range_**
| Formats | json, xml, csv  
| Methods | GET  


**_range_** is one of the following:

- start=**_timestamp_**
- end=**_timestamp_**
- start=**_timestamp_**&end=**_timestamp_**
- start=**_timestamp_**&duration=**_time_unit_**

**_timestamp_**
is an [ISO 8601](http://en.wikipedia.org/wiki/ISO_8601) formatted date (e.g. 2010-05-20T11:01:46Z).

**_time_unit_** is one of the following:

- seconds
- minute(s)
- hour(s)
- day(s)
- week(s)
- month(s)
- year(s)


## Notes

- The window of requested data can be no larger than 6 hours. For example, you can request data for a 6 hour period from last week, or a 6 hour period from 2 months ago, but if you want to retrieve all datapoints from the last week you will have to make multiple individual API requests with a 6 hour window on each.

- The method for determining which datapoints are returned for a specific interval uses a simple sampling technique. The interval cycle starts at midnight and for each interval we return the value of the datastream at that point, which is the datapoint that was stored _just before that interval_. This means that for every interval, you get back the value of the datastream at that point in time. This technique does not work as well for datastreams which have a cycle close to that of the interval or with lots of noise.

## Parameters

Historical queries are triggered by including the relevant parameters in the request URL, for either feeds or datastreams:

- **start**: Defines the starting point of the query as a timestamp, e.g. 2010-05-20T11:01:46Z. The default value is blank.
- **end**: Defines the end point of the data returned as a timestamp, e.g. 2010-05-21T11:01:46Z. The default value is set to the current timestamp
- **find_previous**: Will also return the previous value to the date range being requested. Note that this is useful for any graphing because if you want to draw a graph of the date range you specified you would end up with a small gap until the first value.
- **limit**: Limits the number of results to the number specified here. Defaults to 100 and has a maximum of 1000. In order to paginate through the data use the last timestamp returned as the start of the next query.
- **interval_type**: If set to "discrete" the data will be returned in fixed time interval format according to the interval value supplied. If this is not set, the raw datapoints will be returned.
- **interval**: Determines what interval of data is requested and is defined in seconds between the datapoints. If a value is passed in that does not match one of these values, it is rounded up to the next value. The acceptable values are currently:

| Interval Value | Description | Maximum range in One Query  
|----------------|-------------|----------------------------  
| 0 | Every datapoint stored | 6 hours  
| 30 | One datapoint every 30 seconds | 12 hours  
| 60 | One datapoint every minute | 24 hours  
| 300 | One datapoint every 5 minutes | 5 days  
| 900 | One datapoint every 15 minutes | 14 days  
| 1800 | One datapoint per 30 minutes | 31 days  
| 3600 | One datapoint per hour | 31 days  
| 10800 | One datapoint per three hours | 90 days  
| 21600 | One datapoint per six hours | 180 days  
| 43200 | One datapoint per twelve hours | 1 year  
| 86400 | One datapoint per day | 1 year  

The maximum number of datapoints able to be returned from the API in one query is 1000. If you need more than 1000 datapoints for a specific period you should use the start and end times to split them up into smaller chunks.


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
        <td>/v2/feeds/FEED_ID_HERE?</td>
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
        <strong style="margin-right:1em">GET</strong>/v2/feeds/FEED_ID_HERE.json?duration=6hours&interval=0
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
        <strong style="margin-right:1em">GET</strong>/v2/feeds/FEED_ID_HERE.xml?duration=6hours&interval=0
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
        <strong style="margin-right:1em">GET</strong>/v2/feeds/FEED_ID_HERE.csv?duration=6hours&interval=0
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
        <td>X-ApiKey</td>
        <td>API_KEY_HERE</td>
      </tr>
      <tr>
        <td>Second_Field</td>
        <td>EXAMPLE_TEXT</td>
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
    "id": 121601,
    "title": "Demo",
    "private": "false",
    "feed": "https://api.xively.com/v2/feeds/121601.json",
    "status": "live",
    "updated": "2013-05-10T00:18:07.703576Z",
    "created": "2013-03-29T15:50:43.398788Z",
    "creator": "https://xively.com/users/calumbarnes",
    "version": "1.0.0",
    "datastreams": [
        {
            "id": "datastream",
            "current_value": "1015",
            "at": "2013-05-21T20:12:38.633984Z",
            "max_value": "1338.0",
            "min_value": "16.0",
            "datapoints": [
                {
                    "value": "1338",
                    "at": "2013-05-21T20:12:09.995317Z"
                },
                {
                    "value": "1015",
                    "at": "2013-05-21T20:12:38.633984Z"
                }
            ]
        },
        {
            "id": "example",
            "current_value": "332",
            "at": "2013-05-21T20:12:28.838561Z",
            "max_value": "666.0",
            "min_value": "5.0",
            "datapoints": [
                {
                    "value": "666",
                    "at": "2013-05-21T20:12:01.902763Z"
                },
                {
                    "value": "332",
                    "at": "2013-05-21T20:12:28.838561Z"
                }
            ]
        },
        {
            "id": "key",
            "current_value": "val",
            "at": "2013-05-21T20:12:21.946859Z",
            "max_value": "0.0",
            "min_value": "0.0",
            "datapoints": [
                {
                    "value": "value",
                    "at": "2013-05-21T20:12:16.900568Z"
                },
                {
                    "value": "val",
                    "at": "2013-05-21T20:12:21.946859Z"
                }
            ]
        },
        {
            "id": "temp"
        }
    ],
    "location": {
        "disposition": "mobile",
        "domain": "physical",
        "lat": 17.0567846099426,
        "lon": -88.59375
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
    <environment updated="2013-05-10T00:18:07.703576Z" created="2013-03-29T15:50:43.398788Z" id="121601" creator="https://xively.com/users/calumbarnes">
        <title>Demo</title>
        <feed>https://api.xively.com/v2/feeds/121601.xml</feed>
        <status>live</status>
        <private>false</private>
        <location domain="physical" exposure="" disposition="mobile">
            <lat>17.0567846099426</lat>
            <lon>-88.59375</lon>
            <waypoints/>
        </location>
        <data id="datastream">
            <current_value at="2013-05-21T20:12:38.633984Z">1015</current_value>
            <max_value>1338.0</max_value>
            <min_value>16.0</min_value>
            <datapoints>
                <value at="2013-05-21T20:12:09.995317Z">1338</value>
                <value at="2013-05-21T20:12:38.633984Z">1015</value>
            </datapoints>
        </data>
        <data id="example">
            <current_value at="2013-05-21T20:12:28.838561Z">332</current_value>
            <max_value>666.0</max_value>
            <min_value>5.0</min_value>
            <datapoints>
                <value at="2013-05-21T20:12:01.902763Z">666</value>
                <value at="2013-05-21T20:12:28.838561Z">332</value>
            </datapoints>
        </data>
        <data id="key">
            <current_value at="2013-05-21T20:12:21.946859Z">val</current_value>
            <max_value>0.0</max_value>
            <min_value>0.0</min_value>
            <datapoints>
                <value at="2013-05-21T20:12:16.900568Z">value</value>
                <value at="2013-05-21T20:12:21.946859Z">val</value>
            </datapoints>
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
example,2013-05-21T20:12:01.902763Z,666
datastream,2013-05-21T20:12:09.995317Z,1338
key,2013-05-21T20:12:16.900568Z,value
key,2013-05-21T20:12:21.946859Z,val
example,2013-05-21T20:12:28.838561Z,332
datastream,2013-05-21T20:12:38.633984Z,1015
~~~

{% endcapture %}  
{{ section | unindent | markdownify }} 

      </div>
    </li>
  </ul>
</div>
