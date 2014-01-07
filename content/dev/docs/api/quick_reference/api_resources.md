---
layout: apidoc
section: dev
active: api
name: API Resources
order: 10
---

The following table lists the complete set of operations you can perform with the Xively API. These operations are accomplished using 7 Xively resources: Products, Devices, Keys, Feeds, Triggers, Datastreams, and Datapoints. Each resource has specific [attributes](/dev/docs/api/quick_reference/api_resource_attributes/) associated with it.
Note: If you do not specify a format/media type – JSON, CSV or XML – when interacting with the Xively API, the default format accepted/returned is JSON.

# Feeds, Datastreams and Datapoints

| Resource | Operation | Format | Example URL | Method | Returns
|----------|-----------|--------|-------------|--------|---------
| Feeds | Read | json, xml, csv | https://api.xively.com/v2/feeds/<br><br>see [Searching Feeds](/dev/docs/api/quick_reference/search_feeds/) for details on refining the list of returned Feeds.| GET | Feed containing the current state of all Datastreams and metadata.  
| Feeds | Read (range) | json, xml, csv | https://api.xively.com/v2/feeds/<br>**_feed_id_**?**_range_**<br><br>see [Historical Data](/dev/docs/api/quick_reference/historical_data/) for details on how to format _feed_id_ and _range_|  GET | Feed containing the specified range of historical data in each Datastream.  
| Feeds | Update | json, xml, csv | https://api.xively.com/v2/feeds/**_feed_id_** | PUT | HTTP headers only  
| Feeds | List All | json, xml, csv | https://api.xively.com/v2/feeds | GET | All available Feeds  
| Datastreams | Create | json, xml, csv | https://api.xively.com/v2/feeds/**_feed_id_**/<br>datastreams | POST | n/a  
| Datastreams | Read | json, xml, csv, png | https://api.xively.com/v2/feeds/**_feed_id_**/<br>datastreams/**_datastream_id_** | GET | Feed containing the current state of the requested Datastream.  
| Datastreams | Read (range) | json, xml, csv, png | https://api.xively.com/v2/feeds/**_feed_id_**/<br>datastreams/**_datastream_id_**?**_range_**<br><br>see [Historical Data](/dev/docs/api/quick_reference/historical_data/) for details on how to format _feed_id_ and _range_ | GET | Feed containing the specified range of historical data in the requested Datastream.  
| Datastreams | Update | json, xml, csv | https://api.xively.com/v2/feeds/**_feed_id_**/<br>datastreams/**_datastream_id_** | PUT | HTTP Headers only  
| Datastreams | Delete | json, xml, csv | https://api.xively.com/v2/feeds/**_feed_id_**/<br>datastreams/**_datastream_id_** | DELETE | HTTP Headers only  
| Datastreams | List All  |   | To retrieve all the available Datastreams in a Feed, read the Feed:<br>https://api.xively.com/v2/feeds/**_feed_id_** |  GET | Feed with all Datastreams   
| Datapoints  | Delete (single) | n/a | https://api.xively.com/v2/feeds/**_feed_id_**/<br>datastreams/**_datastream_id_**/datapoints/<br>**_timestamp_** | DELETE | HTTP Headers only  
| Datapoints  | Delete (range) | n/a | https://api.xively.com/v2/feeds/**_feed_id_**/<br>datastreams/**_datastream_id_**/<br>datapoints?**_range_**<br><br>see [Historical Data](/dev/docs/api/quick_reference/historical_data/) for details on how to format _range_ | DELETE | HTTP Headers only  

# Products, Devices, Keys and Triggers

| Resource | Operation | Format | Example URL | Method | Returns
|----------|-----------|--------|-------------|--------|---------
| Products | Create | json | https://api.xively.com/v2/products | POST | Location header with created product location.  
| Products | Update | json | https://api.xively.com/v2/products/<br>**_product_id_** | PUT | HTTP headers only  
| Products | List All | json | https://api.xively.com/v2/products | GET | Multiple Products  
| Products | Read | json | https://api.xively.com/v2/products/<br>**_product_id_** | GET | Single product  
| Products | Delete | n/a | https://api.xively.com/v2/products/<br>**_product_id_** | DELETE | HTTP headers only  
| Devices | Create | json | https://api.xively.com/v2/products/<br>**_product_id_**/devices | POST | Location header with created device location
| Devices | Read | json | https://api.xively.com/v2/products/<br>**_product_id_**/devices/**_serial_number_** | GET | Single device  
| Devices | Update | json | https://api.xively.com/v2/products/<br>**_product_id_**/devices/**_serial_number_** | PUT | HTTP headers only  
| Devices | Delete | n/a | https://api.xively.com/v2/products/<br>**_product_id_**/devices/**_serial_number_** | DELETE | HTTP headers only  
| Devices | List All | json | https://api.xively.com/v2/products/<br>**_product_id_**/devices | GET | Multiple Devices  
| Devices | Activate | json, csv | https://api.xively.com/v2/devices/<br>**_activation_code_**/activate | GET | HTTP headers only  
| Keys | Create | json, xml | https://api.xively.com/v2/keys | POST | HTTP Headers only  
| Keys | Read | json, xml | https://api.xively.com/v2/keys/**_key_id_** | GET | json, xml
| Keys | Delete | n/a | https://api.xively.com/v2/keys/**_key_id_** | DELETE | HTTP Headers only  
| Keys | List All | json, xml | https://api.xively.com/v2/keys | GET | json, xml  
| Triggers | Create | json, xml | https://api.xively.com/v2/triggers/ | POST | HTTP Headers only  
| Triggers | Read | json, xml | https://api.xively.com/v2/triggers/**_trigger_id_** | GET | trigger  
| Triggers | Update | json, xml | https://api.xively.com/v2/triggers/**_trigger_id_** | PUT | HTTP Headers only  
| Triggers | Delete | n/a | https://api.xively.com/v2/triggers/**_trigger_id_** | DELETE | HTTP Headers only  
| Triggers | List All | json, xml | https://api.xively.com/v2/triggers/ | GET | Triggers  
