---
layout: tutorial
section: dev
active: tutorials
name: Visualizing Data with JavaScript
description: Learn how to make a page that displays your data how you want it.
categories: ["dev", "tutorials"]
tags: ["service"]
image: tutorials/channel_viz/viz_thumb.png


sidebar:
  - link: introduction
    label: Introduction
  - link: fork
    label: Sharing code with Github
  - link: host
    label: Hosting a page with Github
  - link: JS
    label: Using Javascript
  - link: yours
    label: Make it Yours
  - link: customize
    label: Customize JavaScript Further
  - link: run
    label: Take this and run!   

---


<!-- Section beginning -->
<div id="introduction" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

## Introduction

This tutorial covers a quick and easy way to create your own page on the web, with a custom presentation of Xively Feeds and Channels.

At the end of this tutorial, you'll know how to:

1. Publish a webpage from Github
2. Modify and play with a bit of JavaScript
3. Use open-source tools to create customized graphs
4. Set up a page that displays just the Xively Feeds and Channels you want, how you want them

![]({% asset_path tutorials/channel_viz/viz_screen.png %})

The best part is that all of this is done with open-source tools, which means that you can modify and build on this base to create your own visualizations, whether you just prefer scatter plots or bar graphs to lines, or you want to strip this code down and totally rebuild it your own way.

<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->



<!-- Section beginning -->
<div id="fork" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

## Sharing code with Github

Github is an online storage house for code.  It doesn't matter whether it's the code of your latest Arduino project, or the code for your website - Github will hold a history of all of its changes, and keep a copy of the latest version available.  

We are going to use Github not only to hold the code for our JavaScript application, but also to host the webpage that the JavaScript creates.

This uses a feature of Github called Github Pages. Github Pages allows you to host a small external webpage for your Github repository. Any repository can have a Github Pages page, Pages simply displays any code in the 'gh-pages' branch. We have designed the Channel Visualization tool to be a standalone Github pages branch. This means that the only branch in the repository is a 'gh-pages' branch (there is no master branch).


<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->




<!-- Section beginning -->
<div id="host" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

## Hosting a page with Github
You are free to use our hosted page at [http://xively.github.io/channel-viz](http://xively.github.io/channel-viz) as much as you want. However, we recommend that you fork our repository to your own Github account, which will automatically create the GH Pages page for you. Once you've done this, you can also download the code, make some edits and then host your own personalized version on GH Pages. Here is how to get started:

1. If you don't have one, create a GitHub account [here](https://github.com/users).
2. Go to our [Channel-Viz](https://github.com/xively/channel-viz) GitHub repository.
3. Click the 'Fork' button in upper right hand corner. Then select the account you would like to fork it to.
4. GitHub will now take care of the rest. You will see a loading graphic of the repo being 'forked' and you will then be brought to your copy of the code on your own repo.
5. Forking the repo as opposed to just downloading the code will not only allow you have your own GH Pages page but also allows you receive and submit updates and changes to the code.
6. In order to make your GH Pages page live, you must make at least one edit to your code. For now we will make a small edit to the index.html file, to change the title that will appear in the browser as the page title. Later on will cover personalizing the tool with JavaScript.
7. Click on index.html, a text viewer with line numbers will appear. Click on edit in the upper left hand corner.
8. On line 15, change the text inside the `<title>`  `</title>` tags. You can make it anything, such as YOUR NAME'S Feeds.
9. Scroll down to the bottom and and click the green 'Commit Changes' button. If you make any other changes it is recommended you keep track of them by putting a short description of changes in the 'Commit sumarry' field. However, this is optional.
10. Your page should now be all set. However, it usually takes 10 - 15 minutes in order for new GitHub Pages to get pushed to the server. When your page is ready you will be able to see it at http://**GH_USERNAME**.github.io/channel-viz
11. You now have your own hosted Xively front-end application. Move on to the next section to customize it. 


<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}
</div>
<!-- /Section end -->



<!-- Section beginning -->
<div id="JS" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

## Using Javascript
This tool was created with [XivelyJS](http://xively.github.io/xively-js/), Xively's Javascript library. You can find the library and documentation on Github. XivelyJS provides a full JavaScript wrapper for almost the entire Xively API. This library allows Xively users to easily access and control their data with simple Javascript calls. This is very useful while creating web or mobile applications. This visualization tool is an example of a web app built on XivelyJS. Feel free to use pieces from this implementation to build your own applications. 



<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->




<!-- Section beginning -->
<div id="yours" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

## Make it Yours
This tool can be used as a standalone visualization engine. It contains all the necessary UI elements for people to enter information for any feed. However, you may want to use this tool to solely view only your specified feeds. For this reason we have given people the ability to fork the code on Github or download the code so you can run it on your own server or locally on your computer, all that's required is a browser.

If you choose to run your own version of the code, we have built in several options for you to customize the visualization page to make it your own. These customizations allow you to permanently set keys and feeds for viewing, as well as change the look and feel of the webpage.

If you completed the previous section of the tutorial and want to use GitHub Pages to host your page you can actually make these edits right in GitHub. Just open up follows.js and make the edits outlined below.

All of these options can bet set within the code in the follows.js javascript file. Here is overview of what you can change:

1. defaultKey - Put your * READ-ONLY * master API key here so you don't need it every time. Be sure to designate the API Key as read-only when you generate it, to maintain security.
2. defaultFeeds - This is where you can put in default feeds, same syntax as the box except if you are specifying a single datastream, the entire entry including feed ID and datastream ID must be surronding with single quotes. 
3. applicationName - This lets you make the page your own. You can set the title in page header to whatever string you want.
4. dataDuration - This allows you to set the default data duration when the page is opened. You can still change the duration with the buttons, this only sets the duration of the initial page load.
5. dataInterval - This allows you to change the frequency of points returned. CAUTION: This value is usually set automatically to work with your chosen duration. If set to an incompatible interval, the graphs will return no data.
6. dataColor - This changes the color of the trendline on the graph. Hex color codes only, omit leading #.
7. hideForm - If you have already set default keys and feeds you may no longer need the UI bar under the header. If so, set this value to 1 to hide the bar. 




<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->

<!-- Section beginning -->
<div id="customize" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

## Customize JavaScript Further
This tool is fully open source and was designed to be modified. You are free to use, change, and redistribute the code as you see fit. This section will cover making a few simple changes to the Javascript itself. However, these changes are just intended to get you thinking about other modifications you could make to the JavaScript to make this page your own. After this you should be ready to make your own fully customized page for visualizing Xively channels. 

### Add Custom Duration
Perhaps a 90 day graph is not enough for your specific sensor data. A one time duration can be set by following the instructions above for the dataDuration and dataInterval fields. This will allow you load the page with any duration you please. However, if you want to always have the option of that time range, you may want to change the preset options. This will show you how to customize the duration buttons to be whatever you want them to be. In this example we will show you how to switch the 90 day button to a 1 year button.

1. This will require editing both the JavaScript and HTML so open follows.js and index.html now.
2. Find the line that contains ' .duration-90' in follows.js, it should be around 314, this function is what we will be editing. We can leave it named ' .duration-90' to make things a little bit easier.
3. Change where is says '90days' to a value of your choice, for a year, we will be changing the value to '1year'.
4. IMPORTANT: You must also change the interval, which is the number directly after the duration value. Your interval must be compatible with your duration, such that it matches the [historical API](/dev/docs/api/quick_reference/historical_data/) limit. You must also ensure that the interval you select will return less than 1000 datapoints per datastream. For a 1 year duration I will choose an interval of 43200 (one datapoint every 12 hours).
5. Now we will change the button label in index.html. Find the "button-group" div, which should be around line 309. We will be editing the 90 day button, which is last. We want to leave all the reference information the same so only change the text, this is the plain text which is followed by `</a>`. Change where it says 90 Days to 1 Year.
6. Save both follows.js and index.html and reload your page. You should now have the option for a 1 year graph. 

You can use this same process to change any or all of the preset button time frames. 

### Change Graph Type
Maybe your data isn't best modeled on a line graph. Rickshaw, the graphing engine at the core of this tool, has a number of options for how to display your data. The ones that work well with Xively data are: line, scatter plot, and area. Line is the default, area fills in the area under the line, and scatter plot will show the individual points. In this example we will show you how to change your graphs from line graphs to scatter plots, where a single point will represent each datapoint returned. 
1. To change this you will have to edit live values in the JavaScript. Open follow.js and locate the ‘Build Graph’ section.

2. You want to look for the line starting with 'renderer:', this should be around line 126, depending on your modifications.
3. The rednerer line should currently have the value 'line', this means that the line graph is being drawn. 
4. We can now change where it says 'line' to one of the values that works well with Xively data. Try changing 'line' to 'area' or 'scatterplot'.
5. Refresh your page and see what happens to your graphs, the display should change.
  Note: Depending on the data in your graph, it may not change drastically. Try looking at a few types and durations of graph with your new renderer.


<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->




<!-- Section beginning -->
<div id="run" class="tutorial-section">  
{% capture section %}
<!-- /Section beginning -->

## Take this and run!  

The code that makes this happen is only the beginning.  Because the Xively Channel Visualizer is built on completely open-source tools, you can modify and build on it however you'd like.  Try some of the following:

* changing the colour of the graph
* try a bar graph
* visualize more than one Xively channel on the same graph
* build an interactive legend

All of these ideas can be found at [Rickshaw's site](http://code.shutterstock.com/rickshaw/).


<!-- Section end -->
{% endcapture %}  
{{ section | unindent | markdownify }}  
</div>
<!-- /Section end -->