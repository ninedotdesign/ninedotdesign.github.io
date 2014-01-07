---
layout: apidoc
section: dev
active: api
name: HTTP Status Codes
order: 10
---

The Xively API will return appropriate [HTTP status codes](http://en.wikipedia.org/wiki/List_of_HTTP_status_codes/) for every request.

##Common status codes##

| Code | Meaning | Action Required
|------|---------|----------------
| 200 | OK | Request processed successfully.
| 400 | Bad Request | Something is wrong with your headers or body formatting. Check your request against examples.
| 401 | Not Authorized | Either you need to provide authentication credentials, or the credentials provided aren't valid. Check your API key.
| 403 | Forbidden | Xively understands your request, but refuses to fulfil it. An accompanying error message should explain why.(NOTE: in the V2 API, this is the error returned when the API rate limit is exceeded.)
| 404 | Not Found | Either you're requesting an invalid URI or the resource in question doesn't exist (e.g. no such Feed). Check your HTTP method. See below.
| 406 | Not Acceptable | You have most likely specified the wrong document type. Try JSON by using .json at the end of your URL.
| 422 | Unprocessable Entity | Xively was unable to create a Feed because the EEML/JSON was not complete/valid (e.g. it didn't include a "title" element). Check your body against examples.
| 500 | Internal Server Error | Something went wrong... Please post to the forum about it and we will investigate.
| 503 | No server error | Usually occurs when there are too many requests coming into Xively - if you get this from an API request then the error message will be returned in XML in the response.(NOTE: in the V1 API, this is the error returned when the API rate limit is exceeded.)

##Common Reasons for Specific Errors##

| Code | Error | Solution
|------|-------|----------
| 404 | {    "title": "Not found",    "errors": "No route matches [POST] \"/api/v2/feeds/121601.csv\""} | You are most likely using the incorrect HTTP method if you get a "No route matches". This particular error is caused by trying to POST to update a Feed when you should be doing a PUT.
| 400 | {    "title": "JSON Parser Error",    "errors": "parse error: after key and value, inside map, I expect ',' or '}' current_value\":\"333\"]}"} | There is most likely an error in your JSON. The errors usually provide some insight into what you are missing. The other cause of this error is you have specified the wrong body type in the URL.
| 400 | invalid format, element start and end names do not match at 6:17 | Same as above but for XML documents.


