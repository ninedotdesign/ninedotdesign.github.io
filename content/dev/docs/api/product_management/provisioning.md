---
layout: apidoc
section: dev
active: api
name: Provisioning
order: 5
---

Provisioning is the process of Device activation.

The term "Provisioning" comes from the fact that a Device is 'provisioned' with a Feed ID and API Key upon its first Activation call to the Xively API.  

The Xively provisioning API makes scaled manufacturing easy, eliminating cost and difficulty by allowing devices to be simply pre-configured in a way that ensures that devices will wake, activate and associate with users safely and securely.

The provisioning process is simple and straightforward and is adaptable to meet various scenarios. The most common provisioning scenario is the direct device activation scenario:

1. A device is defined in a production batch in Xively and assigned a serial number. This device is said to be 'pre-registered'.
2. A physical device sharing a serial number with a device defined in a product batch in Xively comes online.
3. The device submits a secure activation request to Xively using the  [Activate Device](/dev/docs/api/product_management/devices/activate_device/) API.
4. The request is validated by Xively to ensure that it is cryptographically correct and that the devices has not yet been activated.
5. Xively sends the activating configuration information (feed ID and API key) back to the device.
6. The device stores these so that it can securely interact with and through Xively for all future transactions.
7. Xively stores the activation code and activation date-time stamp as attributes of the device in the database.
8. An application prompts the user for the serial number of the device they have just activated, the application uses a Master Key and the device serial number to request the device Feed ID and key from Xively.
9. The application stores the Feed id and key locally.
10. The device and the application can now both communicate with each other through and with Xively securely using the Feed ID.
