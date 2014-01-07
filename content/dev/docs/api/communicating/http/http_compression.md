---
layout: apidoc
section: dev
active: api
name: HTTP Compression
order: 30
---

Xively supports <a href="http://en.wikipedia.org/wiki/HTTP_compression/">HTTP compression</a> on both incoming and outgoing requests. While optional, this is particularly useful if, for example, you have a GPRS based device that periodically uploads a batch of data because compression will typically compress the data being transmitted by 75% or more.

We use the standard HTTP method of specifying compression encoding and support the <a href="http://tools.ietf.org/html/rfc1952">gzip</a> compression schema.

##Incoming compression
In order to send compressed data to Xively it is necessary to send it as gzip encoding. First compress your data using gzip and then add the “Content-Encoding: gzip” header to your request. You should still specify the “Content-Type” header to match the uncompressed content, as this will be passed on beyond the decompression stage.

##Outgoing compression
To receive data from Xively in gzip compressed format simply add the “Accept-Encoding: gzip” header to your request.


