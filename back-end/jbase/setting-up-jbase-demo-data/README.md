# Getting Jbase docker running and create demo data
In this tutorial we're will use show you how to install the docker application, download the latest Jbase Container and get it up and running on your system. Lastly we will create a demo account and demo table and populate with data.

## Signup for free Docker account
You will need to do is go to Docker.com and register for a free account.  To register you click on the get started button at the top right. Scroll down to choose a plan. Then click on the Signup for Free. After you register you will get an email that you will use to verify your account.

## Download Docker Application
Now to download and install the docker application again go to docker.com and click on the get started button at the top right.  Scroll down to the docker desktop on left and download the version for you OS. Run the install once the download is completed. After the install is complated you will need to reboot your computer.

## Download the Jbase container and get it running
Once you have the docker application installed you will need to download the jbase container. You do this by opening a command prompt window and from the command prompt window type in "docker pull zumasys/jbase_base". This will download the latest jBase Docker container with jBase already set up. Again from the command widnow we will start the docker by typing in the following command from your command window "docker run -it -p 20002:20002 zumasys/jbase_base"
 
## Creat DEMO account in Jbase and create file to contain the basic program
Now that you are in your jbase docker you can create a account in jbase that will store the the demo file. Simply execute the command "CREATE-ACCOUNT DEMO". Now to logot the demo account simply type in "LOGTO DEMO". We will now create a basic program file to hold the program that will create the demo file.  The command is "CREATE-FILE BP TYPE=UD". The type of UD will create a directory type file which is the prefered type for basic programs in jBase.

## Get basic program source that will create and populate the demo file
 You are already at the correct page in github that contains the source code.  But the url us "https://github.com/pickmultivalue/full-stack-with-pick-tutorial". From their click on the back-end/Jbase folder. Then click on setting-up-Jbase-demo-data folder. Click on the link of "makedemofile" this will bring up the source code. You will need to higlight the code and copy as we will simply paste the code into the program in Jbase.

## Upload program source code and run program to create demo file
Now go back to Jbase and to edit the program type in "JED BP MAKE.DEMO". Simply paste the program from the prior step in. In jBase to create an executable program you need to compile and catalog the program. We will File the program, compile and catalog in one step by hitting the escape key and typing FIBC. Now we are ready to create the demo file by running the program with the command "RUN BP MAKE.DEMO". The program will ask two questions first the number of records you want to create and the file name please use DEMO.FILE for the filename as that is what will be used in future videos.  The program randomly generates the data for the a static list of each data element. Lastly we list the file to see that the file was created and populated the command is LIST DEMO.FILE FIRSTNAME LASTNAME ADDR1