---
layout: apidoc
section: dev
active: api
name: Time Zones
order: 40
---

Xively supports user specified time zones.

There are two places where you can specify the time zone: in the settings of your user profile on the website and via a parameter in an API request.
By default the time zone is UTC.

##Setting your xively.com time zone
You can set the default Web site display time zone for the Xively Developer Workbench and Xively Management Console by changing the ‘Time Zone’ in settings in your user profile when you are logged on at Xively.com. Once you have set your default Web site display time zone in your profile, all times on the Xively website will be displayed in that time zone.

##Displaying times in different zones via the API
By default all api GET requests will return timestamps in UTC. In order to override this, send “timezone” as a request parameter.
The “timezone” parameter can be specified as either a number of hours offset from UTC or as a place name (see table below).

For example, to see timestamps in the time zone for Newfoundland:

~~~
https://api.xively.com/v2/feeds?timezone=-3.5   
~~~
{: .language-markup}

<br>OR:

~~~
https://api.xively.com/v2/feeds?timezone=Newfoundland   
~~~
{: .language-markup}

##Inserting Datapoints using a custom time zone
If you want to use a non-UTC time zone to send data to Xively, all you have to do is specify the time offset in the iso8601 formatted time string when sending the data.
For example, to submit a Datapoint from the time zone of Rangoon (MST, UTC+6:30) you would enter the time value of the Datapoint as:

~~~
2012-11-10T10:30:00+06:30   
~~~
{: .language-markup}
<br>This would produce a Datapoint with an “at” value of 2012-11-10T04:00:00 UTC because you told Xively that the Datapoint was submitted from a time zone 6:30 hours ahead of the default (i.e. UTC) time zone of the Datastream. In this way, you can easily correct for time differences by appending times instead of directly modifying the ISO 8601 formatted dates prior to submission.





##Time Zones and Place Names

The list of supported place names is as follows (Please note that these are case-sensitive):

| Zone | Place names
|======|=============
| UTC -11:00 | International Date Line West, Midway Island, Samoa
| UTC -10:00 | Hawaii
| UTC -09:00 | Alaska
| UTC -08:00 | Pacific Time (US & Canada), Tijuana
| UTC -07:00 | Arizona, Chihuahua, Mazatlan, Mountain Time (US & Canada)
| UTC -06:00 | Central America, Central Time (US & Canada, Guadalajara, Mexico City, Monterrey, Saskatchewan
| UTC -05:00 | Bogota, Eastern Time (US & Canada, Indiana (East), Lima, Quito
| UTC -04:30 | Caracas
| UTC -04:00 | Atlantic Time (Canada), La Paz, Santiago
| UTC -03:30 | Newfoundland
| UTC -03:00 | Brasilia, Buenos Aires, Georgetown, Greenland
| UTC -02:00 | Mid-Atlantic
| UTC -01:00 | Azores, Cape Verde Is.
| UTC +00:00 | Casablanca, Dublin, Edinburgh, Lisbon, London, Monrovia
| UTC +01:00 | Amsterdam, Belgrade, Berlin, Bern, Bratislava, Brussels, Budapest, Copenhagen, Ljubljana, Madrid, Paris, Prague, Rome, Sarajevo, Skopje, Stockholm, Vienna, Warsaw, West Central Africa, Zagreb
| UTC +02:00 | Athens, Bucharest, Cairo, Harare, Helsinki, Istanbul, Jerusalem, Kyev, Minsk, Pretoria, Riga, Sofia, Tallinn, Vilnius
| UTC +03:00 | Baghdad, Kuwait, Moscow, Nairobi, Riyadh, St. Petersburg, Volgograd
| UTC +03:30 | Tehran
| UTC +04:00 | Abu Dhabi, Baku, Muscat, Tbilisi, Yerevan
| UTC +04:30 | Kabul
| UTC +05:00 | Ekaterinburg, Islamabad, Karachi, Tashkent
| UTC +05:30 | Chennai, Kolkata, Mumbai, New Delhi, Sri Jayawardenepura
| UTC +05:45 | Kathmandu
| UTC +06:00 | Almaty, Astana, Dhaka, Novosibirsk
| UTC +06:30 | Rangoon
| UTC +07:00 | Bangkok, Hanoi, Jakarta, Krasnoyarsk
| UTC +08:00 | Beijing, Chongqing, Hong Kong, Irkutsk, Kuala Lumpur, Perth, Singapore, Taipei, Ulaan Bataar, Urumqi
| UTC +09:00 | Osaka, Sapporo, Seoul, Tokyo, Yakutsk
| UTC +09:30 | Adelaide, Darwin
| UTC +10:00 | Brisbane, Canberra, Guam, Hobart, Melbourne, Port Moresby, Sydney, Vladivostok
| UTC +11:00 | Magadan, New Caledonia, Solomon Is.
| UTC +12:00 | Auckland, Fiji, Kamchatka, Marshall Is., Wellington
| UTC +13:00 | Nuku'alofa