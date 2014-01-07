---
layout: apidoc
section: dev
active: api
name: Usage Limits
order: 70
---



**Read Limits**: The maximum number of Datapoints you can read in a single request across one or more data streams in a Feed is limited. If you exceed this limit, the response set will be truncated at the Datapoints read limit value. You can use sequential read requests to read a dataset larger than the Datapoints read limit. 

**Write Limits**: The maximum number of Datapoints you can write across one or more Datastreams in a Feed in a single request is limited. Attempting to write more than this number of Datapoints in a single request will result in an error response and the rejection of the write request (i.e. none of the Datapoints in the request will be written.)

**API usage** is rate limited by device. The per-device API rate limits for writes are expressed in 'requests per minute'. The calculation of usage is actually based on a moving average to allow for momentary bursting. The per-device rate limits for reads are expressed in ‘reads per day’. These are reset every day at UTC.

**Details of usage capabilities and rate limits are detailed on the [pricing page](/pricing/).**

If your combined API usage for a device (across all requests made to that device by objects, applications and services) exceeds rate limits, API access for this device will be temporarily shut down and you will receive a Rate Limit Error for every new request until the moving average/daily limit goes below the rate limit. At this point, API access will return to normal. This model of rate limits gives you the flexibility to make regular requests within the API limits or to make a burst of requests.

To optimize resources, the Xively API supports reading and writing one or more data points across one or more channels to a device (see [Reading & Writing Data](/dev/docs/api/data/) for more details). This multi-datapoint read/write capability gives you flexibility and allows you to optimize your communications with, and use of, the Xively API.

## Rate Limit Error Codes

| API Version | Status Code |
|---------|-------------|
| v1 | HTTP 503
| v2 | HTTP 403
