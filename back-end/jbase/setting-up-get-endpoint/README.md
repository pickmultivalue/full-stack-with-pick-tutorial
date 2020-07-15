# Setting up a get endpoint
We need to startup jAgent in the background and verify it's running.
```
nohup jbase_agent --config= & 
```
You may have to hit enter for the command prompt to come back.
```
Browse to:  http://localhost:20002/api/wresttest
```

This will prove that jAgent is up and running if you see a page full of JSON. It will also setup the WDB.RESOURCE file when it’s accessed for the first time.
The next step is to write a program that outputs JSON for the web. I have a minimal program already prepared. It is available at https://github.com/pickmultivalue/full-stack-with-pick-tutorial/tree/master/back-end/jbase/setting-up-get-endpoint/GET-API-DEMO.b

```
EDIT BP GET-API-DEMO
<Control-V>
BASIC BP API-DEMO
CATALOG BP API-DEMO
```

Next, we need to tell wire up jAgent to our new program
```
EDIT WDB.RESOURCE API*DEMO
P
API FOR GETTING A SINGLE RECORD FROM DEMO-FILE
GET-API-DEMO
  
1
1
```
To verify we that it is working:
```
Browse to: http://localhost:20002/api/demo/001
```
This will get us the data in JSON format that is accessible on the web.

# Postman
I like to use a product called postman.
It can get downloaded for free from https://www.postman.com.

```
Launch Postman
Click the orange NEW button in the upper left-hand corner
Select REQUEST, Name the REQUEST: DEMO GET SINGLE RECORD
Select DEMO (last item on the lower left-hand side) for the collection
Click SAVE TO DEMO button in lower right-hand corner
In the center upper third of the next screen of the URL field type: http://localhost:20002/api/demo/001
click SEND
```
You should now see the same output that we received using the browser
This proves it worked and that this data is available to the UI layer to be built in our next video.

  
## License
[MIT](https://opensource.org/licenses/MIT)  
  
Copyright (c) 2020-present, Zumasys
