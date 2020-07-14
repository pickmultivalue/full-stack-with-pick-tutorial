# Setting Up a Simple Vue Environment
In this tutorial we’re going to show you how to set up a simple Vue environment. Vue is a JavaScript front end framework that will allow us to easily interact with the DOM (or html document) After we set up the environment, we’ll run through a simple hello world app example.  
  
**Prerequisites**: minimal HTML and javascript  
  
## Web Editor
Open up your favorite web editor. We use [VS Code](https://code.visualstudio.com/download) for editing, as it has some very handy extensions for modern web development and legacy extensions for Pick as well.  
  
## Create HTML Document
To get started we’re going to create new html document. To do that just click new file (ctrl + n) and paste in a blank document from your favorite source. ([I like w3schools](https://www.w3schools.com/html/)) Be sure it’s saved as .html file type.  
  
## Include Vue with script tags via cdn
Next we’re going to head over to [vuejs.org](https://vuejs.org/) and directly include the Vue scripts via their cdn (content delivery network). [Click on “Get Started”](https://vuejs.org/v2/guide/) There you’ll see development and production script cdn addresses. We’re going to grab both and add them to our document's header. For now we’re going to comment out the production version. Open the doc in your favorite browser. Inspect the document and you’ll see Vue consoled *You are running Vue in development mode*. Vue is installed and ready use!

## Set up a simple app by running through the “hello world” example

We’re going to run through the [“Hello world” example](https://codesandbox.io/s/github/vuejs/vuejs.org/tree/master/src/v2/examples/vue-20-hello-world). You can check out the final code on our [github repo here](https://github.com/pickmultivalue/full-stack-with-pick-tutorial/blob/master/front-end/vue/setting-up-a-simple-vue-envorinment/index.html).  
  
First create a div element and give it an identifier attribute. You can name it whatever you’d like, but common practice is to name it *app*. Time to write some Vue! Add a couple of script tags to the footer. Now create a new variable. Again you can name it whatever you’d like, but we’ll stick with the convention and call it *app*. That variable is going to house a [Vue instance](https://vuejs.org/v2/guide/instance.html) by calling the Vue object constructor. The constructor accepts an object and that object defines what you’d like Vue to do. For this example we’re going to utilize two properties that instruct Vue. (heads up: Vue calls them options) The first is the ‘el’ property and the second is the ‘data’ property.  
  
The ‘el’ property defines what html element we’re going to inject our Vue. So we’ll chose the *app* element we just created a moment ago. The ‘data’ property is an object where you’ll store variables that our app (or [Vue instance](https://vuejs.org/v2/guide/instance.html)) can use. These variables/data are also reactive! So things can be manipulated on the fly. Side note: this is also the magic of Vue (and many of the front end frameworks like react and angular) If you're familiar with the idea of state, just think of this as a mini state for our app (or [Vue instance](https://vuejs.org/v2/guide/instance.html)). We’re going to create a variable (or data property) called message. It’s just a simple string. We’ll go with the more Californian version of Hello World and use Hey World.  

A note about terminology: we're using app, [Vue instance](https://vuejs.org/v2/guide/instance.html) and component interchangeably. At this point distinguishing them is not that big of a deal, but to understand the concepts it would be good to look into them. Our app is what houses our entire applicaiton. Currently our app is just one component intiated by `new Vue` as a [Vue instance](https://vuejs.org/v2/guide/instance.html). But our main app could have many child components. Vue applications are typically built from all sorts of compontents used together. The Vue instance is just the technical term for our what our Vue object constructor creates. So apps can contain a lot components and it takes a [Vue instance](https://vuejs.org/v2/guide/instance.html) to create a component.

Going back up to our html we’re going to display this data variable in the dom. Vue calls this “[Declarative Rendering](https://vuejs.org/v2/guide/#Declarative-Rendering).” To do that we’re going to utilize the double curly braces. Vue hinges on this syntax to interact with the dom. Add `{{ message }}` nested in your app div. (so Vue can render it appropriately) Actually add it outside and notice it doesn’t work.  
  
What’s so cool about this notation is how it interweaves with plain html. Now that the reactive message is in our app we can add some p tags around it and style it using CSS.  
  
Go ahead and console.log the new Vue instance. You’ll see al sorts properties that will help us in the future. But for now scroll down to the message property and you’ll see our value.  That means you can interact with the Vue instance like any object. Let’s try it by changing the message (in the console) Since Vue is reactive you’ll see it update right on the page.  

## In Closing
You now have a simple Vue environment up and running. Check out the next video in our series to integrate API data
