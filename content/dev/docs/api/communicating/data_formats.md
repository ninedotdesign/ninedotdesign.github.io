---
layout: apidoc
section: dev
active: api
name: Data Formats
order: 60
---


The Xively API supports 3 data formats; **JSON, XML and CSV**. The JSON and XML representations of an environment are interchangeable: i.e. they both represent the same data and metadata. The CSV representation is unique and represents a subset of the overall data representation. 

There are two ways to specify which format you are using:

- Append the format identifier to the URL, e.g. /v2/feeds**.json**
- Pass an “Accept” header in the HTTP request, e.g. "Accept: application/json" or "Accept: text/csv”

**Within the v2 API, If no format is specified, the JSON format is used.** This means that if you don’t specify a format the API will try and parse all incoming data as JSON, and the API will send all outgoing data as JSON. For the v1 API, the default is XML.
If both methods are used to specify the format, the format identifier in the URL takes precedence over the method specified in the HTTP header.




## JSON

The  [JSON data format](http://www.json.org/) is particularly suited to web based applications as it can be easily parsed using JavaScript in the browser. However it also makes an excellent generic data serialization format since it has much lower processing overheads than XML and uses less bandwidth to transmit. A full JSON representation looks like the following:

#### Request

**request-json**

~~~
{
  "version":"1.0.0",
   "datastreams" : [ {
 "id" : "example",
      "current_value" : "333"
    },
    { 
 "id" : "key",
 "current_value" : "value"      
    },
    { 
      "id" : "datastream",
 "current_value" : "1337"
    }
  ]
}
~~~
{: .language-javascript}

#### Response

**response-json**

~~~
{
    "id": 121601,
    "title": "Demo",
    "private": "false",
    "feed": "https://api.xively.com/v2/feeds/121601.json",
    "status": "frozen",
    "updated": "2013-05-05T07:37:54.582681Z",
    "created": "2013-03-29T15:50:43.398788Z",
    "creator": "https://xively.com/users/calumbarnes",
    "version": "1.0.0",
    "datastreams": [
        {
            "id": "example",
            "current_value": "333",
            "at": "2013-05-05T07:37:54.465267Z",
            "max_value": "333.0",
            "min_value": "41.0"
        },
        {
            "id": "key",
            "current_value": "value",
            "at": "2013-04-23T00:40:34.032979Z"
        },
        {
            "id": "temp"
        }
    ],
    "location": {
        "domain": "physical"
    }
}
~~~
{: .language-javascript}

<br>**JSON callback**: this is used only when requesting JSON formatted responses. Including this parameter will enable the response to be wrapped in the callback method of your choice (particularly useful with JavaScript and for creating AJAX applications).

For example,  

~~~
https://api.xively.com/v2/feeds/504.json?callback=myCallbackFunction
~~~
{: .language-markup}

<br>will result in a response body of: myCallbackFunction({...}) rather than just {...}. Callbacks may only contain alphanumeric characters and underscores; any invalid characters will be stripped. This conforms to the implementation discussed here:  [http://developer.yahoo.com/common/json.html#callbackparam](http://developer.yahoo.com/common/json.html%23callbackparam).


## XML

The Xively API uses a specific format of XML called EEML (See  [http://www.eeml.org](http://www.eeml.org/) for more details). It is well suited to integrating with existing systems such as building management systems although it contains the same information as JSON. An example of a full XML representation looks like the following:

#### Request

**request-xml**

~~~
<?xml version="1.0" encoding="UTF-8"?>
<eeml>
  <environment>
      <data id="example">
      <current_value>333</current_value>
    </data>
      <data id="key">
      <current_value>value</current_value>
    </data>
      <data id="datastream">
      <current_value>-1337</current_value>
    </data>
  </environment>
</eeml>
~~~
{: .language-markup}

#### Response

**response-xml**

~~~
<?xml version="1.0" encoding="UTF-8"?>
<eeml 
    xmlns="http://www.eeml.org/xsd/0.5.1" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="0.5.1" xsi:schemaLocation="http://www.eeml.org/xsd/0.5.1 http://www.eeml.org/xsd/0.5.1/0.5.1.xsd">
    <environment updated="2013-05-05T07:37:54.582681Z" created="2013-03-29T15:50:43.398788Z" id="121601" creator="https://xively.com/users/calumbarnes">
        <title>Demo</title>
        <feed>https://api.xively.com/v2/feeds/121601.xml</feed>
        <status>frozen</status>
        <private>false</private>
        <location domain="physical" exposure="" disposition=""/>
        <data id="example">
            <current_value at="2013-05-05T07:37:54.465267Z">333</current_value>
            <max_value>333.0</max_value>
            <min_value>41.0</min_value>
        </data>
        <data id="key">
            <current_value at="2013-04-23T00:40:34.032979Z">value</current_value>
        </data>
        <data id="temp"/>
    </environment>
</eeml>
~~~
{: .language-markup}














##CSV
CSV is designed for use by very simple embedded devices. CSV requests and responses differ significantly from their JSON/XML peers. See each API method for details.
A representation of a request and response for a Feed in CSV format is as follows:

#### Request

**request-csv**

~~~
example, 333
key, value
datastream, 1337 
~~~
{: .language-markup}

#### Response

**response-csv**

~~~
example,2013-05-05T07:37:54.465267Z,333
key,2013-04-23T00:40:34.032979Z,value
temp,,""
~~~
{: .language-markup}
 





