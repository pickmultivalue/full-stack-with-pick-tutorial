*=========================================================================
* PROGRAM:    GET-API-DEMO
* PURPOSE:    PROCESS GET A SINGLE RECORD FROM DEMO-FILE VIA REST
*=========================================================================
    * Set the type of data to be returned
    CALL WSETCONTENTTYPE("application/json")
    * Set Access Control for CORS
    CALL WSETHEADER("Access-Control-Allow-Origin","*")
    * Get our request_method
    CALL WGETHEADER(REQUEST.METHOD,"REQUEST_METHOD")
    *
    * Build a blank response object to send back
    CALL WOBJ(RESPONSE.OBJ,"FROMSTRING","","{}","",RERR)
    *
    * Set our default response status and status message
    JSON.STATUS="ok"
    JSON.STATUS.MESSAGE=""
    *
    OPEN 'DEMO.FILE' TO DEMO.FILE ELSE
        JSON.STATUS        = "error"
        JSON.STATUS.MESSAGE= "Could not open DEMO.FILE file"
        GOTO end.of.call
    END
    *
    * Create an empty array to add data
    CALL WOBJ(RESPONSE.OBJ,"SET.ARRAY","data","[]","",RERR)
    *
    * Get param from url bar in case user is requesting a get or delete
    CALL WGETPARAM(ID,1)
    *
    * This is our router.  We look at the request_method and ID to determine action
    IF REQUEST.METHOD = "" THEN REQUEST.METHOD="GET"
    *
    BEGIN CASE
        CASE REQUEST.METHOD="GET"
            * Get one record.
            GOSUB get.one.record
            IF NO.RECORD=1 THEN
                JSON.STATUS="error"
                JSON.STATUS.MESSAGE="No DEMO-FILE records found for ":ID:"."
            END
        CASE 1
            * Invalid action
            JSON.STATUS="error"
            JSON.STATUS.MESSAGE="Invalid action REQUEST.METHOD=":REQUEST.METHOD
    END CASE
*
end.of.call: *
    *
    * Builds our response status items and builds response json
    CALL WOBJ(RESPONSE.OBJ,"SET.STRING","status",JSON.STATUS,"",RERR)
    CALL WOBJ(RESPONSE.OBJ,"SET.STRING","statusmsg",JSON.STATUS.MESSAGE,"",RERR)
    * Make the JSON easier to read
    CALL WOBJ(RESPONSE.OBJ,"TOSTRING","",RESPONSE.JSON,"PRETTIFY",RERR)
    * Send the JSON to the web
    CALL WSEND(RESPONSE.JSON)
    *
    STOP; * end of main program
    *
    **********************************
get.one.record: *
    **********************************
    NO.RECORD=0
    READ DEMO.DATA FROM DEMO.FILE,ID ELSE
        NO.RECORD=1
        RETURN
    END
    *
    * Build our object inside the results array.
    *
    CALL WOBJ(DEMO.OBJ,"FROMSTRING",""              ,"{}"           ,"",RERR)
    CALL WOBJ(DEMO.OBJ,"SET.STRING","id"            ,ID             ,"",RERR)
    CALL WOBJ(DEMO.OBJ,"SET.STRING","firstName"     ,DEMO.DATA<1>   ,"",RERR)
    CALL WOBJ(DEMO.OBJ,"SET.STRING","lastName"      ,DEMO.DATA<2>   ,"",RERR)
    *
    CALL WOBJ(ADDR.OBJ,"FROMSTRING",""              ,"{}"           ,"",RERR)
    CALL WOBJ(ADDR.OBJ,"SET.STRING","address1"      ,DEMO.DATA<3>   ,"",RERR)
    CALL WOBJ(ADDR.OBJ,"SET.STRING","address2"      ,DEMO.DATA<4>   ,"",RERR)
    CALL WOBJ(ADDR.OBJ,"SET.STRING","city"          ,DEMO.DATA<5>   ,"",RERR)
    CALL WOBJ(ADDR.OBJ,"SET.STRING","state"         ,DEMO.DATA<6>   ,"",RERR)
    CALL WOBJ(ADDR.OBJ,"SET.STRING","zip"           ,DEMO.DATA<7>   ,"",RERR)
    CALL WOBJ(ADDR.OBJ,"TOSTRING"  ,""              ,ADDR.JSON      ,"",RERR)
    CALL WOBJ(DEMO.OBJ,"SET.OBJECT","address"       ,ADDR.JSON      ,"",RERR)
    CALL WOBJ(DEMO.OBJ,"SET.STRING","homePhone"     ,DEMO.DATA<8>   ,"",RERR)
    CALL WOBJ(DEMO.OBJ,"SET.STRING","workPhone"     ,DEMO.DATA<9>   ,"",RERR)
    CALL WOBJ(DEMO.OBJ,"SET.STRING","emailAddress"  ,DEMO.DATA<10>  ,"",RERR)
    *
    CALL WOBJ(DEMO.OBJ,"SET.ARRAY" ,"systems"       ,"[]"           ,"",RERR)
    SYS.COUNT= DCOUNT(DEMO.DATA<11>,@VM)
    FOR CURR.SYS=1 TO SYS.COUNT
        CALL WOBJ(SYS.OBJ ,"FROMSTRING",""               ,"{}"                       ,"",RERR)
        CALL WOBJ(SYS.OBJ ,"SET.STRING","hardware"       ,DEMO.DATA<11><1,CURR.SYS>  ,"",RERR)
        CALL WOBJ(SYS.OBJ ,"SET.STRING","operatingSystem",DEMO.DATA<12><1,CURR.SYS>        ,"",RERR)
        CALL WOBJ(SYS.OBJ ,"SET.STRING","systemType"     ,DEMO.DATA<13><1,CURR.SYS>,"",RERR)
        CALL WOBJ(SYS.OBJ ,"SET.STRING","numberOfUsers"  ,DEMO.DATA<14><1,CURR.SYS>  ,"",RERR)
        CALL WOBJ(SYS.OBJ ,"TOSTRING"  ,""               ,SYS.JSON                   ,"",RERR)
        CALL WOBJ(DEMO.OBJ,"SET.OBJECT","systems[-1]"    ,SYS.JSON                   ,"",RERR)
    NEXT CURR.SYS
    *
    CALL WOBJ(DEMO.OBJ,"TOSTRING"  ,""              ,DEMO.JSON      ,"",RERR)
    *    
    CALL WOBJ(RESPONSE.OBJ,"SET.OBJECT","data[-1]"  ,DEMO.JSON      ,"",RERR)
    *
    RETURN
