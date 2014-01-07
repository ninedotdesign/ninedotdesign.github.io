---
layout: apidoc
section: dev
active: api
name: Reading & Writing Metadata
order: 30
---

**Writing Metadata:** 
You can write or update Feed and Datastream metadata independently or as part of a write to a Feed or Datastream. Any changes in Feed or Datastream metadata overwrite previous values. Therefore, if you want to append new metadata to existing metadata on a Feed or Datastream, you must write the full list of metadata – old and new. If you want to overwrite the existing metadata, you just write the new metadata. If you want to delete metadata, you write empty metadata to the Feed or Datastream. 

**Reading Metadata:** 
Feed and Datastream metadata are returned with reads if the format specified is json or XML. Feed metadata is not returned with CSV read requests. 

Feed and Datastream metadata are enumerated on the [API Resource Attributes](/dev/docs/api/quick_reference/api_resource_attributes/) page.
