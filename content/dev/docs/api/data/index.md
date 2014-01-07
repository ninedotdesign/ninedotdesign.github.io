---
layout: apidoc
section: dev
active: api
name: Reading & Writing Data
order: 20
---

Reading and writing data is the heart of the Xively API, managing that data is the primary function of the Xively Cloud Service.

The Xively API makes it easy for your devices, applications and services to read and write data to Xively and through Xively to each other. Xively supports reading and writing data via three resources: **Feeds**, **Datastreams** and **Datapoints**. We **strongly** recommend that you use the Feeds API for reading and writing data except in two cases: Deleting a Datastream can only be done via the Datastreams API. Reading one or more Datapoints from a single Datastream can only be done via the Datastream API. Deleting one or more Datapoints can only be done via the Datapoints API. 

A hierarchy of data types is used to represent data in the Xively platform: 

![]({% asset_path xively_data_hierarchy.png %})

**Feed**
A Feed is the collection of channels (datastreams). A Feed’s metadata can optionally specify location, tags, whether it is physical or virtual, fixed or mobile, indoor or outdoor, etc. Every device has exactly one Feed. 

**A few notes about creating Feeds:**

- When a development device is created in the Developer Workbench, the development device is created in the context of a unique generic development product batch. The development device is assigned a system-generated serial number to pre-register it and then it is activated. This activation creates an empty Feed and an API key for the development device. 

- When the Deployment Service is used to create a product batch, the batch may be associated with a development device. If this is the case, the device will inherit the development device’s Feed template which contains the development device Feed’s channel definitions and tags. Serial numbers are added to the product batch to create pre-registered devices. When these devices are activated in the provisioning process, a Feed will be created for the device based on the template associated with the product and an API key will be created for the device. 

- When a product batch is created via the API, the process is identical to the Deploy Service with one notable exception. The Feed template can be specific programmatically via the API when the product batch is defined. 

- While it is possible to create Feeds directly via the API, this is **highly discouraged**. In the Xively data model this creates an unassociated Feed which is only minimally supported in the development tools and this only for legacy compatibility.

**Datastream**
A Datastream is a bi-directional communications channel that allows for the exchange of data between the Xively platform and authorized devices, applications, and services. Each Datastream represents a specific attribute, unit or type of information (a variable). Some Datastreams may be defined automatically by the product template at the time of Feed creation. The Datastreams associated with a Feed can be added and deleted after a device is created. When data is written to an unspecified Datastream using the Feed API, the Datastream will be created dynamically.

**Datapoint**
A Datapoint represents a single value of a Datastream at a specific point in time. It is simply a key value pair consisting of a timestamp and the value at that time. 


The Feed API is the recommended API for interacting with Xively. Using the Feed API, you can:

- Create one or more Datastreams optionally specifying [metadata](/dev/docs/api/metadata/) for the Feed and its Datastreams.

- Write one or more Datapoints to one or more of a Feeds Datastreams simultaneously

- Create [location data and waypoints](/dev/docs/api/metadata/waypoints/).

- Read the current data and metadata values of a Feed

- Read historical data stored in a Feed’s Datastreams

- Read the current value for each of a set of Feeds.

##Notes
- The structure of the URLs for accessing data/metadata reflects the hierarchical structure of the three main data types: Feeds >> Datastreams >> Datapoints.

- When you read using the Feed API, you get the Datastreams plus the metadata associated with the Feed. When you use the Datastreams API to read, you get only the Datastreams (no Feed metadata).

- The value of the Feed status attribute is "live" if the Feed has been updated in the last 15 minutes; otherwise the status is "frozen".

- A full list of Feed attributes is available on the [API Resource Attributes](/dev/docs/api/quick_reference/api_resource_attributes/) page.

- For backward compatibility, the creation of Datastreams with the Datastreams API is still supported, though not recommended.

- For backward compatibility, the creation of Datapoints with the Datapoints API is still supported, though not recommended.

- If a Datastream with the specified ID does not already exist, Xively creates the Datastream. If a Datastream with the specified ID exists, Xively updates the Datastream.

- For backward compatibility, the creation of Datastreams can also be accomplished using the Datastreams API. This is not recommended.

- For backward compatibility, the update of Datapoints can also be accomplished using the Datastreams API. This is not recommended.

- If you write a Datapoint using the Datastreams API to a Datastream that does not exist, the Datastream is not created and you receive error 404 (invalid URL).

- Timestamps: By default, Xively uses the time on the server when it receives the request to assign a timestamp to each Datapoint, so you do not need to explicitly assign one. If you want to set the timestamps yourself, the recommended best practice is to set it on the Datastream using the “at” attribute. For example you might want to explicitly set the timestamp if your network latency is high or if the device has been asleep for a while. For backward compatibility, Xively still supports assigning a timestamp to an entire Feed using the “updated” attribute, but this value is always overridden by a timestamp assigned to a Datastream with the “at” attribute.

- When you use the Feeds API, you get the Datastreams _plus_ the metadata associated with the Feed. When you use the Datastreams API, you get only the Datastreams (no metadata).

- Modifying Existing Datapoints: To modify an existing Datapoint, specify the timestamp of a previously updated Datapoint with a new value. This is typically done to correct values, for example bad values generated by a device when a power source expired.
