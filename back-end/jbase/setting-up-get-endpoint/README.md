# How to Set Up REST API Get End Points

[![Setting up a GET endpoint](video-thumb.jpg)](https://youtu.be/aKCau-EJA7c)

We need to startup jAgent and verify it's running. We can do that using the command `jbase_agent`. You should see the following messages appear:

```jbase
(25|25) NOTICE starting up jAgent, Process Per Connection mode, listening on port 20002
(25|25) NOTICE Configured using config file located in [/jbasedata/global/config/jagent_config]
```

Fire up your favortie browser and navigate to: [http://localhost:20002/api/wresttest](http://localhost:20002/api/wresttest). This will prove that jAgent is up and running if you see a page full of JSON. It will also setup the WDB.RESOURCE file when it’s accessed for the first time.  

Return to your command line window and you should see the following message:

```jbase
(27|27) NOTICE RequestHandlerService::open: connected with 172.17.0.1
(27|27) NOTICE Shutting down Connection
```

 Hit <kbd>control</kbd>+<kbd>c</kbd> to exit jAgent
  
## Output JSON with a Program

The next step is to write a program that outputs JSON for the web. I have prepared a [minimal program available here](https://github.com/pickmultivalue/full-stack-with-pick-tutorial/tree/master/back-end/jbase/setting-up-get-endpoint/GET-API-DEMO.b).

1. `EDIT BP GET-API-DEMO` + <kbd>enter</kbd>
2. `I` + <kbd>enter</kbd>
3. Paste in the [prepared program](https://github.com/pickmultivalue/full-stack-with-pick-tutorial/tree/master/back-end/jbase/setting-up-get-endpoint/GET-API-DEMO.b)
4. <kbd>enter</kbd> + <kbd>enter</kbd>
5. `FI` + <kbd>enter</kbd>
6. `BASIC BP GET-API-DEMO` + <kbd>enter</kbd>
7. `CATALOG BP GET-API-DEMO` + <kbd>enter</kbd>
  
## Connect jAgent to Program

Next, we need to wire up jAgent to our new program

1. `EDIT WDB.RESOURCE API*DEMO` + <kbd>enter</kbd>
2. `I` + <kbd>enter</kbd>
3. `P` + <kbd>enter</kbd>
4. `API FOR GETTING A SINGLE RECORD FROM DEMO-FILE` + <kbd>enter</kbd>
5. `GET-API-DEMO` + <kbd>enter</kbd>
6. <kbd>space</kbd> + <kbd>enter</kbd>
7. `1` + <kbd>enter</kbd>
8. `1` + <kbd>enter</kbd>
9. <kbd>enter</kbd> + <kbd>enter</kbd>
10. `FI` + <kbd>enter</kbd>
  
To verify that it is working, first start up jAgent again with the command `jbase_agent`. Then go back to your browser and navigate to: [http://localhost:20002/api/demo/001](http://localhost:20002/api/demo/001)  
  
This will get us the data in JSON format that is accessible on the web.

## Test with Postman

I like to use a product called postman. Download it for free here: [https://www.postman.com](https://www.postman.com).

1. Launch Postman
2. Click the orange NEW button in the upper left-hand corner
3. Select REQUEST, Name the REQUEST: DEMO GET SINGLE RECORD
4. Select DEMO (last item on the lower left-hand side) for the collection
5. Click SAVE TO DEMO button in lower right-hand corner
6. In the center upper third of the next screen of the URL field type: [http://localhost:20002/api/demo/001](http://localhost:20002/api/demo/001)
7. click SEND
  
You should now see the same output that we received using the browser
This proves it worked and that this data is available to the UI layer to be built in our next video.

## License

[MIT](https://opensource.org/licenses/MIT)  
  
Copyright (c) 2020-present, Zumasys
