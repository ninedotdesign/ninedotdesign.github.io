---
layout: apidoc
section: dev
active: api
name: Triggers
order: 10
---

Triggers, also referred to as notifications, provide ‘push’ capabilities by sending HTTP POST requests to a URL of your choice when one or more conditions for a **datastream** are satisfied. For example, a notification can be sent when a value in a Datastream changes or exceeds a threshold. The HTTP POST supplies a JSON formatted trigger body (see example below).

You can use the Developer Workbench to create triggers for testing purposes. NOTE: These triggers are not transferred to production during the Deploy process. For production devices, triggers on a specific device’s Datastreams should be created via the API by the device, the application, or the service. 

Once set, triggers are processed automatically by Xively Cloud Services. The minimum interval between sending out two of the same notifications is 5 seconds. Triggers fire once when the condition is met and do not repeat while the condition remains in this threshold. If you need to know when the condition is no longer met you can create another trigger with the opposite conditions. For example, if you create a trigger for value > 5 and for value <= 5, you will be alerted when the value passes above and below 5.


###Trigger Parameter Body

When a trigger makes an HTTP POST request to the URL provided at the time of trigger creation, it includes a JSON document as a parameter body. For example:

~~~
{
  "environment": {
    "description": "",
    "feed": "https://api.xively.com/v2/feeds/343",
    "id": 343,
    "location": {
      "lat": 55.74479,
      "lng": -3.18157,
      "name": "location description"
    },
    "title": "test Feed yes"
  },
  "id": 1,
  "threshold_value": 9.0,
  "timestamp": "2009-09-07T12:16:02.001403Z",
  "triggering_datastream": {
    "id": "0",
    "url": "https://api.xively.com/v2/feeds/343/datastreams/0",
    "at": "2009-09-07T12:16:02.000063Z",
    "value": {
      "current_value": "9.07624035140473",
      "max_value": 9.99650150341,
      "min_value": 0.00471012639984
    }
  },
  "type": "gte",
  "url": "https://api.xively.com/v2/triggers/1"
}
~~~
{: .language-javascript}