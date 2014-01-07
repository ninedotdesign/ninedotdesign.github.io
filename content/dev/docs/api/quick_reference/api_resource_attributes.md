---
layout: apidoc
section: dev
active: api
name: API Resource Attributes
order: 20
---

The tables below outline the attributes for each of the Xively API resources: 

- [Products](#product)
- [Devices](#device)
- [Feeds](#feed)
- [Datastreams](#datastream)

- [Locations](#location)
- [Waypoints](#waypoint)
- [Triggers](#trigger)
- [Keys](#key)


<span id="feed"></span>

##Feeds
A Feed contains one or more Datastreams and a Datastream contains one or more Datapoints. Because of this, you can use the Feed API to access the metadata of the Feed, the metadata of each Datastream in the Feed and the Datapoints in each Datastream.

The following table lists the **feed** resource attributes:


| Attribute | Description | Required in an update? | Can be directly set?
|-----------|-------------|------------------------|---------------------
| ID | The ID of the Feed. | No | No. Set automatically.
| Title | A descriptive name for the Feed. | Yes | Yes
| Private | Whether or not the Feed is private to the creator of the Feed. If "true", the Feed is private, if "false", the Feed is public (CC0 1.0). For more information, see [Public and Private Feeds](/dev/docs/api/security/public_and_private_feeds/). | No | Yes
| Tags | Tagged metadata about the Feed (characters ' " and commas will be stripped out). | No | Yes
| Description | A description of the Feed. | No | Yes
| Feed | The URL of the Feed. | No | No. Set automatically.
| Auto Feed URL
| Status | Value is "live" if the Feed has been updated in the last 15 minutes otherwise it is considered "frozen". | No | No. Set automatically
| Updated | The time at which this Feed was last updated. | No | No. Set automatically when any of the metadata changes.
| Created | The date the Feed was created. | No | No. Set automatically.
| Creator | A URL referencing the creator of the Feed. | No | Yes. Set automatically.
| Version | Version of the data format Feed returned. | No | No
| Datastreams | A collection of the Datastreams in this Feed. See the following table for specific attributes | No | Yes
| Location |  see table below for a list of the Feed resource’s location attributes |   |
| Website | The URL of a website which is relevant to this Feed e.g. home page. | No | Yes
| Icon | The URL of an icon which is relevant to this Feed. | No | Yes
| User Login | The user who owns the Feed. Visible if you specify show_user=true in the HTTP request. | No | No. Set automatically




<span id="datastream"></span>

##Datastreams
The following table lists the Feed resource’s **datastream** attributes:

| Attribute | Description | Required in an update? | Can be directly set?
|-----------|-------------|------------------------|---------------------
| Stream ID | The ID of the Datastream. | Yes | Yes
| Updated | The time at which this Datastream was last updated. | No | No. Set automatically.
| Tags | Tagged metadata about the Datastream (characters ' " and commas will be stripped out) will be stripped out). | No | Yes
| Units | The units of the Datastream, for example 'Celsius'. | No | Yes
| Unit type | The type of the unit, for example 'basicSI'. | No | Yes
| Unit symbol | The symbol of the unit, for example 'C'. | No | Yes
| Min Value | The minimum value since the last reset. | No | Yes
| Max Value | The maximum value since the last reset. | No | Yes
| Current Value | The current value of the Datastream. | Yes | No
| Datapoints | A collection of time-stamped values. | No | Yes


<span id="location"></span>

##Locations
The following table lists the Feed resource’s **location** attributes:

| Attribute | Description | Required in an update? | Can be directly set?
|-----------|-------------|------------------------|---------------------
| disposition | Whether the "location" is mobile or fixed. | No | No
| ele | The elevation of the device. | No | No
| name | The name of the device. | No | Yes
| lat | The latitude of the device. | No | Yes
| exposure | Whether the location is indoors or outdoors. | No | Yes
| lon | The longitude of the device. | No | Yes
| domain | The domain of the location, i.e. physical or virtual. | No | Yes
| waypoints | A list of locations for a mobile Feed. You cannot create, edit, or delete location waypoints. Xively creates a new location waypoint automatically in real time when the elevation, latitude, or longitude of a device changes. Location waypoints cannot be created using buffered historical data. | No | No


<span id="waypoint"></span>

##Waypoints
The following table lists the Feed resource’s **waypoint** attributes:

| Attribute | Description | Required in an update? | Can be directly set?
|-----------|-------------|------------------------|---------------------
| at | The time when the device changed location. The time is by default the current server time, unless you specify a value for the "Updated" attribute of the Feed. | Yes | No. Set automatically.
| lat | The latitude of the device. | N/A | No. Set automatically.
| long | The longitude of the device. | N/A | No. Set automatically.
| ele | The elevation of the device. | N/A | No. Set automatically.


<span id="trigger"></span>

##Triggers
The following table lists the **trigger** resource attributes:

| Attribute | Description | Required in an update? | Can be directly set?
|-----------|-------------|------------------------|---------------------
| Url | the URL to be POSTed to when the trigger threshold is met | Yes | Yes
| Trigger_type | the type of evaluation to be done by the trigger. See the trigger_type table below | Yes | Yes
| Threshold_value | the threshold value to be evaluated against for trigger_type for the current value of the target Datastream  | Not required for trigger_type =change, frozen and live. Required for all others. | Yes
| Environment_id | Feed ID for the Feed that contains the Datastream to be monitored | Yes, not modifiable once set| Yes
| Stream_id | string name of the Datastream to be monitored | Yes, not modifiable once set | Yes

**“trigger_type” values**

Property | Description
---|---|
gt | Greater than
gte | Greater than or equal to
lt | Less than
lte | Less than or equal to
eq | Equal to
change | Any change
frozen | No updates for 15 minutes
live | Updated again after being frozen

<span id="product"></span>

##Products

The following table lists the **product** resource attributes:

| Attribute | Description | Required? | Settable
|-----------|-------------|-----------|----------
| name | The name of the product | Yes | Yes
| description | The description of the product | No | Yes
| product_id | The user-visible id of the product (i.e. the id used in the URL for API requests) | Yes | No
| secret | The product secret that all devices belonging to this product will use to generate activation codes. The product secret is a hex string, however it should be interpreted as binary bytes, not an ASCII string, to save space on resource constrained device. When you are ready to mass produce your prototype product, the manufacturer programs the product secret into the firmware of each device. The manufacturer must safeguard the product secret and the product secret must not be transmitted anywhere in the normal operation of the device. | Yes | No

<span id="device"></span>

##Devices
The following table lists the **device** resource attributes:

A device has the following attributes, of which, only the serial number is settable:

| Attribute | Description | Required? | Settable
|-----------|-------------|-----------|----------
| serial | The serial number of the device. A serial number is a unique ID and can be any arbitrary string composed of alphanumeric characters and the addition symbol (+), subtraction symbol (-), underscore (_), colon (:), and comma (,). This serial number can be programmed into the device during the manufacturing process, or it can be the MAC address if the device has an Ethernet or WiFi connection. If possible, the manufacturer should use non-consecutive serial numbers so that if your product secret is discovered, it is difficult to guess the serial number of other users. The serial number must be accessible to the activation code running in firmware. | Yes | Yes
| activated_at | The date at which the device was activated in ISO8601 format. This attribute is set by Xively when the activation code is received from the device. | Yes | No
| created_at | The date at which the device was created in ISO8601 format. This attribute is set by Xively when it creates the device in the database. | Yes | No
| Feed_id | The id for the Feed that was created for this device. | Yes | No
| api_key | The API key for the Feed that was created for this device. | Yes | No
| activation_code | When a device with Internet connectivity powers on ("wakes up"), the device submits an activation code to Xively. When Xively receives the activation code, it sets the activated_at attribute and returns the Feed_id and api_key attributes to the device, completing the provisioning process so that the device can send data to Xively. | Yes | No

<span id="key"></span>

## Keys
The following table lists the **key** resource attributes:

The key is the top level data structure. A key contains the following attributes, some of which are required:

| Attribute | Description | Required? | User-settable
|-----------|-------------|-----------|---------------
| api_key | The actual api key token to be used by the client application | Yes | No
| label | A label by which the key can be referenced | Yes | Yes
| expires_at | Expiration date for the key after which it won't work | No | Yes
| private_access | Flag that indicates whether this key can access private resources belonging to the user | No | Yes
| permissions | Collection of Permission objects controlling the access level | Yes | Yes

The following table lists the **key permission** attributes:

At least one Permission object is required when creating a key, but more than one are permitted for more complex keys. A Permission object contains the following attributes:

| Attribute | Description | Required? | User-settable
|-----------|-------------|-----------|---------------
| access_methods | An array indicating what type of access the key has. Contains one or more of the following: get, put, post, delete. | Yes | Yes
| source_ip | Restricts access to requests that originate from this IP address. | No | Yes
| referer | The referer[sic](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html) domain. If you specify the referer domain, the key can only be embedded in a web page with the matching URL. Subdomains are treated as different domains | No | Yes
| minimum_interval | Creates a key that can only request data with a certain resolution. For example, a key could be created that, when embedded in a web page, allows access only to values collected over an interval of one day. The same key could not be used to access full resolution data. | No | Yes
| label | Optional label for identifying the permission set. | No | Yes
| resources | Optional collection of Resource objects. Resource objects restrict access to specific Feeds or Datastreams. | No | Yes

The following table lists the **key resource** attributes:

Resources can optionally be added to Permission object to restrict access to just the specified Feed or Datastream. A Resource object contains the following attributes:

| Attribute | Description | Required? | User-settable
|-----------|-------------|-----------|---------------
| Feed_id | Reference to a specific Feed id. | Yes if a Datastream is also specified, No otherwise | Yes
| Datastream_id | Reference to a specific Datastream id within a Feed. If specified then the Feed id must also be specified. | No | Yes


