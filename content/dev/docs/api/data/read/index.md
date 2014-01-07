---
layout: apidoc
section: dev
active: api
name: Read
order: 20
---

You can read data and metadata from Xively in the following ways:

- Read a **[Single Feed](/dev/docs/api/data/read/single_feed/)**: Returns a snapshot of a single Feed at the current time. Contains the current value of each Datastream and of the Feed's metadata.

- Read a **[Single Datastream](/dev/docs/api/data/read/single_datastream/)**: Returns a snapshot of the specified Datastream, _without any of the Feed metadata_.

- Read **[Range of Historical Datapoints](/dev/docs/api/quick_reference/historical_data/)**: Returns a list of historical Datapoints within the specified range for one or more Datastreams. The range is specified using ISO 8601 formatted dates. Requests can be made at the Datastream level as well as at the Feed level.

- Read **[All Feeds](/dev/docs/api/data/read/all_feeds/)**: Returns snapshots of each Xively Feed that is viewable by the authenticated account or a filtered subset of them. The default page size returned contains 50 Feeds. Each Feed contains the current value of each Datastream and of the Feed's metadata.
