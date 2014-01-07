---
layout: apidoc
section: dev
active: api
name: Communicating with Xively
order: 50
---

You communicate with Xively using [REST](/dev/docs/api/communicating/rest/).

##Xively API Base URL

The base URL for the Xively API is: [https://api.xively.com](https://api.xively.com/)

You can communicate with Xively using a variety of protocols via IPv4 or IPv6:

- [HTTPS (recommended) and HTTP](/dev/docs/api/communicating/http/)
- [Sockets/Websocket](/dev/docs/api/communicating/sockets/)
- [MQTT](/dev/docs/api/communicating/mqtts/)

##DNS versus IP
Because the IP address to which xively.com resolves can and may change, we strongly recommend that you resolve the base URL of the Xively API [https://api.xively.com](https://api.xively.com/) via DNS. 

In cases where it is not possible to use DNS, you can use the following bare-IP address alternative:
- **IPv4**: 173.203.98.29
- **IPv6**: 2001:470:1f10:333::2

**Caution:** Although we try to avoid changing these IP addresses, a change may be unavoidable. If this is the case, the new IPs will be published on this page with a note indicating the date of change.
