---
layout: apidoc
section: dev
active: api
name: OAuth
order: 40
---

OAuth is a method for allowing third-party application access to your resources without giving them access to your username and password. It is used by most major websites including Facebook and Twitter. See [http://oauth.net/](http://oauth.net/) for more details. The Xively implementation (OAuth 2.0) currently gives the third party site an API key which can access your whole account with configurable permissions.

OAuth support is provided for tools integration. For example, a developer could use OAuth support to integrate an existing CRM system with Xively to combine their device management and customer management into one closed-loop solution.

##An Implementation Warning: Not for End Users
If you are building OAuth into your system, you should be aware that the API Keys which Xively sends through OAuth Apps are account-wide API Keys.  

These API Keys are not specific to a particular Feed or Device.  For example, if you create an OAuth App which hands out an API Key with Read permissions, it will be able to read any Feed under your account.  

Because the API Key provides account-wide access, authentication by OAuth is excellent for tying in administrative applications and services, such as a billing service that needs to read every device you manage for the purpose of generating billing for each of your customers. However, OAuth is **not** recommended for applications and services with which end user will interact, such as a phone application for monitoring their device.  Applications and services that are specific to a user should be given API Keys that will only allow them to access their particular Feeds.

If you are creating a system in which each of your end users will own **their own personal** Xively account, in a collaborative project such as the [Air Quality Egg](http://airqualityegg.com/), OAuth might be a sensible way to distribute API Keys.  However, in a commercial application, it is strongly advised that you never require your end user to own a Xively account. Instead, their data should pass transparently through Xively to them, with you managing the devices and data from your single commercial Xively account.


## Create an OAuth App

When logged in to your account, go to **OAuth Apps** in the settings menu

Go to   **[+ Add OAuth App](/apps/new/)**   and fill in the app details.

* __Name__ - this is what the user will see when they install the app.
* __Contact Email__ - an email for use in case the developer needs to be contacted by Xively.
* __Website URI__ - this should be the location of the app so that users can be directed there to start using it.
* __Description__ - this will be displayed to the user when they authenticate.
* __OAuth Redirect URI__ - this is the URI that Xively will redirect the user to when they authorize the app.
* __Access Level__ - when the API is created, this defines what permissions it should have. An app developer should use the lowest permissions possible for their app to still work.

When you have created the app you should be able to see its Client ID and its Client Secret which are important for later parts of the process. You can view a list of your created apps in the 'OAuth Apps' dropdown of your account settings.

## Have the user authenticate your app

This is done simply by having the user click on a link which takes them to the following URL:

[https://xively.com/oauth/authenticate/?client_id=your_client_id](/oauth/authenticate/?client_id=your_client_id)

They will then be presented with a page that allows them to either authorize or disallow your app.

If they click "Authorizatione" then they will be redirected back to the URI specified when you created the app along with a "code" parameter. e.g.

[https://mydomain.com/oauth/success?code=abc123](https://mydomain.com/oauth/success?code=abc123)

If they click "Cancel" they will be redirected back to your callback URI with an error message. If the user has already authorized your app they will be immediately redirected back to your application with a new code that can, if necessary, be exchanged for the original access_token.

The code remains valid for 1 hour after the callback has been made. Please note that this page should not be embedded in an iFrame and that the URL should be visible in the location bar of the browser.

## Exchange the temporary code for the OAuth token

Once you have received the success callback you then need to make a server to server request to exchange this temporary code for the final access token. To do this, you need to make a POST request to the following URL:

[https://xively.com/oauth/token/](/oauth/token/)

along with the following URL encoded POST variables:

* code - the code you just received in the callback request
* client_id - the client id from the first step
* client_secret - the client secret from the first step
* grant_type - this should be set to 'authorization_code'
* redirect_uri - this must match the redirect URI you entered in the first step


If successful, this request will return a JSON string like this:

<div class="code-examples">
  <div class="language-javascript">

{% capture section %}

~~~
{
  "access_token": "NEW_ACCESS_TOKEN",
  "token_type": "Bearer",
  "permissions": [
    {
      "access_methods": ["get", "put", "post", "delete"]
    }
  ]
}
~~~

{% endcapture %}
{{ section | unindent | markdownify }}

  </div>
</div>

This contains the access token that can be used to make requests to Xively on behalf of the user. The permissions should reflect the permissions that were configured in the first step when you created the app. A temporary code can only be used once.

## Start using the token

The access_token is a normal Xively API key and, as such, can be sent via a number of methods:

* Via the X-ApiKey header
* as a GET parameter, key=
* as the OAuth standard header "Authorization: Bearer &lt;CODE&gt;" header
* as a GET parameter, oauth_token=

You can use it with any of the regular [Xively API endpoints](/dev/docs/api/)
