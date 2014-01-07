---
layout: apidoc
section: dev
active: api
name: Write
order: 30
---

Devices, applications, and services can write data (and/or [metadata](/dev/docs/api/metadata/)) to a Feed and/or its Datastreams.

**Writing Data:** To write Datapoints to Datastreams, the recommended best practice is to use the Feeds API. With a single HTTP request, you can write data in the following ways:

- Write a [single Datapoint to a single Datastream](/dev/docs/api/data/write/single_datapoint_to_a_single_datastream/) (for example, the current value from a single sensor on a device).

- Write [single Datapoints to multiple Datastreams](/dev/docs/api/data/write/single_datapoint_to_each_datastream/) (for example, the current value from multiple sensors on one or more devices).

- Write [multiple Datapoints to a single Datastream](/dev/docs/api/data/write/multiple_datapoints_to_single_datastream/) (for example, buffered historical values from a single sensor on a device).

- Write [multiple Datapoints to multiple Datastreams](/dev/docs/api/data/write/multiple_datapoints_to_multiple_data_streams/) (for example, multiple sets of buffered historical values, each from a different sensor on one or more devices).

**Writing Metadata:** You can optionally write or update Feed and Datastream metadata along with a data write or independently of it. See the [metadata](/dev/docs/api/metadata/) section for more details. 
