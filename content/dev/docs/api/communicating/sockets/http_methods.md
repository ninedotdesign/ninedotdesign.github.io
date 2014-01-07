---
layout: apidoc
section: dev
active: api
name: HTTP Request Methods
order: 10
---

##GET, PUT, POST, DELETE##

All four of the standard HTTP request methods are transparently passed through the Socket Server to Xively’s v2 API. Responses to these requests from Xively are wrapped in JSON and passed back to the client. 

For example:

~~~
// A request to get Feed 504, Datastream 0: 
{  
  "method" : "get",  
  "resource" : "/feeds/504/datastreams/0",  
  "headers" :  
    {  
      "X-ApiKey" : "API_KEY"  
    },  
  "token" : "0xabcdef"  
}  
~~~
{: .language-javascript}

<br>Would return something similar to: 

~~~ 
{
  "token" : "0xabcdef",  
  "status" : 200,  
  "headers" :  
    {  
      "CACHE_CONTROL" : "max-age=86400",  
      "CONTENT_LENGTH" : "103",  
      "DATE" : "Wed, 02 Feb 2011 13:36:12 GMT",  
      "ETAG" : "\"839ab3fef1d1c922b3d4c373f9a911cd\"",  
      "CONTENT_TYPE" : "application/json; charset=utf-8"  
    },  
  "body" :  
    {  
      "at" : "2011-02-02T13:36:12.343158Z",  
      "tags" : [  
        "humidity"  
      ],  
      "current_value" : "15",  
      "max_value" : "658.0",  
      "min_value" : "0.0",  
      "id" : "0"  
    },  
  "resource" : "/feeds/504/datastreams/0"  
}  
~~~
{: .language-javascript}
