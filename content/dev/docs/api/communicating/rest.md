---
layout: apidoc 
section: dev 
active: api 
name: REST 
order: 5 
---

The Xively API conforms to the design principles of [Representational State Transfer (REST)](http://en.wikipedia.org/wiki/Representational_State_Transfer), extended with the subscribe and unsubscribe methods in our sockets service.

RESTful access uses the HTTP verbs to determine which action to take on a particular data object:

- **GET** : Retrieves the current state of the object
- **PUT** : Sets the current state of the object
- **POST** : Creates a new object
- **DELETE** : Deletes the object

The Xively API presents 7 [RESTful resources](/dev/docs/api/quick_reference/api_resources/): Products, Devices, Keys, Feeds, Triggers, Datastreams, and Datapoints.
