---
layout: apidoc
section: dev
active: api
name: Regenerate a Key
order: 60
---



This method allows you to regenerate the specified API key. This means that all attributes and permissions of the API key will remain the same, but the previous actual API key value will change. This can be useful if the value of a previous API key becomes exposed and you want to ensure that the key isn't used by anyone in the future.

You should note that only a non-resource limited ('master' style) key with **POST** access will be able to call the regenerate endpoint. This means that a key will not in general be able to regenerate itself. However it is possible for a key with the correct permissions to regenerate itself, which of course means that the key will invalidate itself in the process of making the request. If you do this, you need to ensure that your client captures the regenerated API key from the returned Location header, else it will not be able to authenticate itself for any subsequent requests.

**WARNING: The regenerating process is one way, so there's no way of returning to any previous key. This means you should be careful not to regenerate any key that you still intend to use in any of your devices.**

## Response

If the regeneration request was successful this method will return an HTTP 200 OK status code, and return the new API key within the Location header of the response, e.g.:

~~~  
HTTP/1.1 200 OK  
Date: Thu, 10 Sep 2012 11:10:49 GMT  
Content-Type: application/json; charset=utf-8  
Location: https://api.xively.com/v2/keys/1nAYR5W8jUqiZJXIMwu3923Qfuq_lnFCDOKtf3kyw4g  
Content-Length: 0  
~~~

So for the response above, the regenerated API key would be the 1nAYR5W8jUqiZJXIMwu3923Qfuq_lnFCDOKtf3kyw4g value which you could extract from the header.

 

    
    
| Example | https://api.xively.com/v2/keys//regenerate  
| Formats | n/a  
| Methods | POST  
| Returns | HTTP headers only  

