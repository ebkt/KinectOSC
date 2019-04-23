# Max/Kinect OSC setup guide
Make sure you have downloaded the most recent version of Processing from [the website](https://processing.org/download/)
(this has been tested with version 3.5.3)

Open Processing and select the Sketch drop down menu, followed by 
Import Library and then Add Library

Search _kinect_ and install the _Open Kinect For Processing_ library by Daniel Schiffman and Thomas Sanchez

Then search _osc_ and install the _oscP5_ library by Andreas Schlegel

Restart Processing

Open the OSCreceiver.maxpat

Open PointTrackingOSC.pde

Run the Processing sketch

The Processing sketch finds the average location in a collection of pixels within a min and max threshold and then sends that location and its distance from the camera to Max. 

Use the up and down arrow keys while the Processing sketch is open to change the threshold.

The Max patch will receive the coordinates and separate them out into individual values for use in your patch. 
