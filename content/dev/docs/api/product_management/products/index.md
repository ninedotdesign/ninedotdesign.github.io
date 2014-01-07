---
layout: apidoc
section: dev
active: api
name: Products
order: 10
---

Product is the highest level of abstraction in the Xively data hierarchy. A product in Xively represents a specific type of actual device, for example the 'Acme Smart Thermostat'. The product definition includes a product name, a description and optionally a Feed template that is applied to every device created in the batch as a default. Upon product creation, a product ID and product secret are automatically generated. Individual devices are created within the context of a defined product. Together a product and its devices create a product batch.

**Notes**
- Details of product attributes are provided on the [Xively Resource Attributes page](/dev/docs/api/quick_reference/api_resource_attributes/)

- **Product Secret**: The product secret is a random string that is automatically generated when a product is created. It is used in the [activation process](/dev/docs/api/product_management/devices/activate_device/). When you are ready to mass produce your prototype product, the manufacturer programs the product secret into the firmware of each device. The manufacturer must safeguard the product secret and the product secret must not be transmitted anywhere in the normal operation of the device. The product secret is represented as a hex string, however it should be interpreted as binary bytes, not an ASCII string, to save space on resource constrained device. You establish the product secret when you  [create a product](/dev/docs/api/product_management/products/create_product/).