# Display a Database Record via a Simple API Connection
In this tutorial we’re going to show you how to set up a simple API connection using Vue. In our previous tutorial, *[Setting Up Get Endpoint](https://github.com/pickmultivalue/full-stack-with-pick-tutorial/tree/master/back-end/jbase/setting-up-get-endpoint)*, we set up the end point. This API connection will allow us to retrieve a database record.  
  
**Prerequisites**: minimal HTML, JavaScript and minmal Vue  
  
Be sure you have the [index.html](https://github.com/pickmultivalue/full-stack-with-pick-tutorial/blob/master/front-end/vue/setting-up-a-simple-vue-envorinment/index.html) from our *[Setting Up a Simple Vue Environment](https://github.com/pickmultivalue/full-stack-with-pick-tutorial/tree/master/front-end/vue/setting-up-a-simple-vue-envorinment)*

## Web Editor
Open up our [index.html](https://github.com/pickmultivalue/full-stack-with-pick-tutorial/blob/master/front-end/vue/setting-up-a-simple-vue-envorinment/index.html) document in your favorite web editor. Need one? Try [VS Code](https://code.visualstudio.com/download).
  
## Include Axios
First we're going to add a JavaScript library (or package) called Axios. This library will easily allow us to make API calls. You could also use alternates like [fecth](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch). But for this tutorial we'll use Axios, as it's commonly used for Vue projects.

Navigate to [Axios on npmjs.org](https://www.npmjs.com/package/axios). Copy the cdn url and add it to the header of our document.

```
<!DOCTYPE html>
<html>
<head>
    <title>Simple Vue Environment</title>

    <!-- development version, includes helpful console warnings -->
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

    <!-- production version, optimized for size and speed 
    <script src="https://cdn.jsdelivr.net/npm/vue"></script>-->
    
    <!-- Axios (easy API integartion library/package) -->
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

</head>
<body>

<div id="app">
    {{ message }}
</div>

<script>
    var app = new Vue({
        el: '#app',
        data: {
            message: 'Hey World'
        }
    });
</script>

</body>
</html>
```
  
Now we have the Axios library installed and ready to use!
  
## Test End Point


## Retrieve Database Record via API

## Display Record Data

## In Closing
You now have a simple Vue environment up and running. Check out the next video in our series to integrate API data
