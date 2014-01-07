---
layout: apidoc
section: dev
active: api
name: Security
order: 60
---

Xively takes security very seriously. 

The Xively platform and our Web tools - the Developer Workbench and the Management Console - run on LogMeIn's proprietary secure cloud infrastructure. This ensures our service and your data is protected, available and fault-tolerant. 

## Communications Security
Communications to and from Xively are protected with industry-standard HTTPS. HTTPS is created when Hypertext Transfer Protocol (HTTP) is layered on top of the SSL/TLS protocol to provide authentication of the endpoint with which one is communicating as well as bidirectional communications encryption. This protects HTTPS communications from man-in-the-middle attacks, eavesdropping and tampering.  Simply use 'HTTPS' in all API requests.

## Using API Keys
The Xively API uses API Keys to authenticate requests.  [Read more about API Keys.](/dev/docs/api/security/keys/)

Fine-grained access controls using let you tune access to the need, minimizing surface area and exposure.  You can grant resource access on an as-needed, when-needed basis, and take it away when it's not.

## Secure Provisioning
Secure and encrypted device [provisioning](/dev/docs/api/product_management/provisioning/) that builds on our flexible [activation](/dev/docs/api/product_management/devices/activate_device/) processing infrastructure lets you automate what happens when your devices wake up for the first time.  This allows calibration of secure connection is established, credentials are exchanged, and devices, applications and services into your circle of trust. The Xively provisioning infrastructure ensures that you are always in control of the provisioning process.

Device, application and service authentication is done with API Keys in Xively.

## OAuth
Xively supports OAuth for allowing third-party application access to your resources.  [Read more about OAuth](/dev/docs/api/security/oauth/).

## Public and Private Feeds
Public Feeds allow your data to be indexed by major search engines, and shared with the world under a [CC0 License](http://creativecommons.org/publicdomain/zero/1.0/).  Public Feeds are available for viewing at a public URL.  Private Feeds are not publicly indexed, and are not visible at a public URL. Both public and private Feeds use secure API keys to control who can change, delete, and add to their data - giving you control of how your data is shared.  [Read more about Public and Private Feeds](/dev/docs/api/security/public_and_private_feeds/)

**Notes**

- While it is possible to communicate with Xively using HTTP, this method is **not**  secure and it is **not** recommended. It remains a part of the service as an element of legacy support.  It is recomended to use 'HTTPS' in all API requests: **https**://api.xively.com.