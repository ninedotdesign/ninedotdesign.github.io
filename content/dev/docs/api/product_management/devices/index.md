---
layout: apidoc
section: dev
active: api
name: Devices
order: 20
---

A device represents an individual physical device of some defined product with a unique serial number. When devices are created, they are in a pre-registered state. They do not yet have a Feed or API key associated with them. When a device is activated, the device becomes registered, a Feed is generated for it based on the default template defined in the product if one exists and an API key is generated. The collection of devices created in the context of a specific product defines a product batch.

**Notes**
- Details of device attributes are provided on the [Xively Resource Attributes page](/dev/docs/api/quick_reference/api_resource_attributes/)
