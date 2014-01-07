---
layout: apidoc
section: dev
active: api
name: Subscribe
order: 20
---

The subscribe method is used to subscribe to notifications on a resource – either a Feed or Datastream. 

The subscribe method is fully idempotent; if you are already subscribed to a Feed, re-subscribing to it will do nothing and return success.

It is possible to subscribe to a given resource multiple times by sending a different token for each subscription. When a resource with multiple subscriptions is updated, you will receive a response for each token you have subscribed with.

If you subscribe to a Feed, you will receive a complete representation of that Feed whenever any of its Datastreams are updated. 

If you wish to receive updates on a per-datastream level (perhaps to conserve bandwidth), you will need to subscribe to any desired Datastreams individually. 

For example:

~~~  
// Subscribing to Feed 504, Datastream 0: 
{  
  "method" : "subscribe",  
  "resource" : "/feeds/504/datastreams/0",  
  "headers" :  
    {  
      "X-ApiKey" : "API_KEY"  
    },  
  "token" : "0xabcdef"  
}  
~~~
{: .language-javascript}

<br>Would immediately return something similar to: 

~~~
// Subscribing to Feed 504, Datastream 0: 
{  
  "token" : "0xabcdef",  
  "resource" : "/feeds/504/datastreams/0",  
  "status" : 200  
}  
~~~
{: .language-javascript} 

<br>Then, when Feed 504, Datastream 0 receives an update you would receive: 

~~~
{  
  "token" : "0xabcdef",  
  "resource" : "/feeds/504/datastreams/0",  
  "body" :  
    {  
      "at" : "2011-02-02T13:51:14.611565Z",  
      "tags" : [  
        "humidity"  
      ],  
      "current_value" : "15",  
      "max_value" : "658.0",  
      "min_value" : "0.0",  
      "id" : "0"  
    }  
}  
~~~
{: .language-javascript}
