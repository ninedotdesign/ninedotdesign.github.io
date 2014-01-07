---
layout: apidoc
section: dev
active: api
name: Tags
order: 20
---

A tag is a descriptive keyword or term assigned to Feed or a Datastream that helps it to be found, grouped, sorted and/or identified. There can be zero or more tags associated with any Feed or Datastream. 

A tag can be a single word/term, for example “humidity”, or group of words/terms, for example “Control Unit type A7”. A comma ( **,** ) is used to separate tags.

The following characters will be stripped out of tag text:

- apostrophe **’**
- double quote **”**

Tags are read and written through the Feeds and Datastreams API resources.