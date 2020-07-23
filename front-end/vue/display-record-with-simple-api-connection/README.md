# Display a Database Record via a Simple API Connection
In this tutorial we’re going to show you how to set up a simple API connection using Vue. In our previous tutorial, *[Setting Up Get Endpoint](https://github.com/pickmultivalue/full-stack-with-pick-tutorial/tree/master/back-end/jbase/setting-up-get-endpoint)*, we set up the end point. This API connection will allow us to retrieve a database record.    
  
**Prerequisites**: minimal HTML, JavaScript and minmal Vue  
  
* [Web Editor](#web-editor) 
* [Include Axios](#include-axios) 
* [Test End Point](#test-end-point)
* [Retrieve Database Record via API](#retrieve-database-record-via-api)
* [Display Record Data](#display-record-data)
* [In Closing](#in-closing)

  
Be sure you have the [index.html](https://github.com/pickmultivalue/full-stack-with-pick-tutorial/blob/master/front-end/vue/setting-up-a-simple-vue-envorinment/index.html) from our *[Setting Up a Simple Vue Environment](https://github.com/pickmultivalue/full-stack-with-pick-tutorial/tree/master/front-end/vue/setting-up-a-simple-vue-envorinment)*, as that's what we'll be working from.

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
Open up [postman](https://www.postman.com/) and create a new request. As discussed in our *[Setting Up Get Endpoint](https://github.com/pickmultivalue/full-stack-with-pick-tutorial/tree/master/back-end/jbase/setting-up-get-endpoint)* tutorial we have an end point `http://localhost:20002/api/DEMO/001`. You can replace *001* with any number up to *100*. The number tells the API to retrieve a database record with that id. Add the url as a new GET request and you'll see record data pulled in as JSON. 

## Retrieve Database Record via API
First we're going to create three new data properties:  
* `record` - will store our record data
* `loading` - will tell us if our content is loading
* `error` - will store an error if there is one
  
We're also going to convert our data property into a function and have it return our data object. This will future proof our app by distinguishing this components data (or state) from every other component in the app. [Read more here](https://vuejs.org/v2/guide/components.html#data-Must-Be-a-Function).
  
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
    {{ record }}
</div>

<script>
    var app = new Vue({
        el: '#app',
        data() {
            return {
                record: '',
                loading: true,
                error: false
            }
        }
    });
</script>

</body>
</html>
```
  
Next We're going to utilize another method in the Vue instance called [mounted](https://vuejs.org/v2/api/#mounted). Check it out in the Vue instance [life cycle](https://vuejs.org/v2/guide/instance.html#Lifecycle-Diagram).

```
<script>
    var app = new Vue({
        el: '#app',
        data: {
            return {
                record: '',
                loading: true,
                error: false
            }
        },
        mounted() {

        }
    });
</script>
```
  
Within [mounted](https://vuejs.org/v2/api/#mounted) is where we'll utilize Axios to make our API call. First we'll use the Axios [get request method alias](https://www.npmjs.com/package/axios#axiosgeturl-config) get our API data. This method accepts a url parameter

```
<script>
    var app = new Vue({
        el: '#app',
        data: {
            return {
                record: '',
                loading: true,
                error: false
            }
        },
        mounted() {
            axios.get('http://localhost:20002/api/DEMO/001')
        }
    });
</script>
```
  
To work with the recently aquired data we'll utilize other Axios methods using a neat feature of JavaScript called [method chaining](https://javascriptissexy.com/beautiful-javascript-easily-create-chainable-cascading-methods-for-expressiveness/). It's common practice to separate chained methods by line breaks, as it's way easier to read. The methods we'll be using are `then`, `catch`, and `finally`. The naming convention makes these methods uses pretty obvious.

```
<script>
    var app = new Vue({
        el: '#app',
        data: {
            return {
                record: '',
                loading: true,
                error: false
            }
        },
        mounted() {
            axios.get('http://localhost:20002/api/DEMO/001')
            .then()
            .catch()
            .finally()
        }
    });
</script>
```
The `then` method will return our API response via an anonymous callback function. `catch` and `finally` work in a similar manner. To see it more clearly I'll write it out in older javascript and convert in the next step.

```
<script>
    var app = new Vue({
        el: '#app',
        data: {
            return {
                record: '',
                loading: true,
                error: false
            }
        },
        mounted() {
            axios.get('http://localhost:20002/api/DEMO/001')
            .then(
                function(response) {
                    // do something with response
                }
            )
            .catch(
                function(error) {
                    // do something with error
                }
            )
            .finally(
                function() {
                    // do something once it's done
                }
            )
        }
    });
</script>
```  

Next we're going to make those methods do something useful! In the `then` method we'll change our component's data property `record` to be the recently aquired response. In the `catch` method we'll console.log the error and set our `error` data property to true. After everything `finally` loaded we'll set the `loading` property to false.

```
<script>
    var app = new Vue({
        el: '#app',
        data: {
            return {
                record: '',
                loading: true,
                error: false
            }
        },
        mounted() {
            axios.get('http://localhost:20002/api/DEMO/001')
            .then(response => {
                this.record = response.data.data[0]
            })
            .catch(error => {
                console.log(error)
                this.error = true
            })
            .finally(() => {
                this.loading = false
            })
        }
    });
</script>
```  

Go ahead and console.log the reponse to see what we get back. Woah! You'll notice there's an object with all sorts of details API request information. We're only interested in the `data` property, which is an object containing our data array.

## Display Record Data
Finally we're going to display the record's data!
  
We're going to utilize Vue's handy if else directive to display the data appropriately. Vue's directives are really just html tag attributes that interact with Vue. So our `v-if` directive allows us to show something conditionally. We'll check if to make sure there's no error. If there's not an error we'll utilize `v-else` to display our record content.
  
First we'll check if all the conent has loaded using a nested if directive. If it has then we'll say hello  

```    
    <div id="app">
        <div v-if="error">
            <p>We're sorry, we're not able to retrieve this information at the moment, please try back later</p>
        </div>

        <div v-else>
            <div v-if="loading">Loading...</div>
        
            <div v-else>
              Hey {{ record.firstName }} {{ record.lastName }}!
            </div>
        
        </div>
    </div>

```

## In Closing
You now have a simple API call set up. Check out the next video in our series to interact with the API in different ways
