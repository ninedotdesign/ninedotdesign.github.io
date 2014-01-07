---
layout: apidoc
section: dev
active: api
name: Using MQTT
order: 30
---



The Xively MQTT Bridge is a simple way to interact with Xively directly from any MQTT enabled platform. It provides full API interaction, as well as push notifications and subscriptions.

More information about the protocol is at [mqtt.org](http://mqtt.org/). Currently, the Xively MQTT Bridge supports QOS level 0 only.

Each device connected to the Xively MQTT Bridge is completely isolated from other connected devices, and any communication must happen through Feeds and Datastreams.

## Connecting

The Xively MQTT Bridge accepts the following incoming connections:

    
    
| Server | Port | SSL
| api.xively.com | 1883 |
| api.xively.com | 8883 | Yes

If you provide the API Key as the username, the password will be ignored; alternatively, you can prefix the API Key to the topic of each request.

MQTT's "Last Will and Testament" feature is supported. It is useful if you wish to send an API Request when your device is accidentally disconnected (for example, to update a device status Datastream).

When using port 8883 SSL is required. The certificate used is the same as the rest of Xively.

## Authentication

If you provide an API Key when connecting, the API Key is checked for validity. If the API Key is not valid, the connection is rejected.

If you do not provide an API Key when connecting, you will have to provide one with each request. To do so, begin the message topic with your API Key. For example, to subscribe to Feed 504 with a specific API Key, you would subscribe to 'API_KEY/v2/feeds/504.json'.

The permission to perform any given action is not checked at the time of connection. MQTT protocol has no way to inform the client when a PUBLISH or SUBSCRIBE has been denied, therefore you will _not_ be informed if your key lacks permissions to complete the given request.

## Retrieving Data

Topic strings are of the format identical to Xively API URLs. For example, to subscribe to the Feed 504 in the v2 API using JSON, you send SUBSCRIBE for the topic /v2/feeds/504.json.

If you are working on a platform with constrained resources, such that JSON or XML formatted strings are too large to handle, you can request the CSV version of a Feed or Datastream by subscribing to:

- '/v2/feeds/504.csv'
- '/v2/feeds/504/datastreams/0.csv'

The v2 CSV data is a single or multi-line comma-separated list of timestamps and values. To eliminate the need to parse the return result, the simplest way to get data from the API is to subscribe to '/v1/feeds/504/datastreams/0.csv', which will return only the current value of Feed 504, Datastream 0, and continue to return it every time it updates.

When subscribing to a Feed or Datastream you will receive the current state of the device immediately upon subscription, and thereafter whenever the Feed or Datastream is updated.

Currently, the only resources which support continuous updates are Feeds and Datastreams. Other resources (users, triggers, etc...) will return a single message containing their current state in the format requested.

## Publishing Data

For Publishing data, topics are organized the same as for retrieving data (i.e. as '/API URL'). To update Xively Feed 504, send a PUBLISH request on the topic '/v2/feeds/504.json', with a payload matching that which you would send to the API. For more information on the payload format see [Write](/dev/docs/api/data/write/).

Either CSV, JSON or XML formats are supported for publishing.

Any resource accessible via the Xively API can be updated via MQTT.

