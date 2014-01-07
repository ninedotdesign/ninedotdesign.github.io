---
layout: apidoc
section: dev
active: api
name: Unsubscribe
order: 30
---

The unsubscribe method is used to stop receiving updates about a resource. 

The subscribe method is fully idempotent; if you are not subscribed to a resource unsubscribing to it will do nothing and return success. 

If you used a token when [subscribing to the resource](/dev/docs/api/communicating/sockets/subscribe/), you will need to include that token when unsubscribing.

For example:

~~~  
// Unsubscribing to Feed 504, Datastream 0: 
{
  "method" : "unsubscribe",  
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
// Unsubscribing to Feed 504, Datastream 0: 
{
  "token" : "0xabcdef",  
  "resource" : "/feeds/504/datastreams/0",  
  "status" : 200  
}
~~~
{: .language-javascript}

<br>In both cases, when Feed 504, Datastream 0 receives an update, you would no longer receive anything.
