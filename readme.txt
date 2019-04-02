Make sure you have downloaded the most recent version of Processing at www.processing.org
(this has been tested with version 3.5.3)

Open Processing and select the Sketch drop down menu, followed by 
Import Library and then Add Library

Search "kinect" and install the Open Kinect For Processing library by Daniel Schiffman and Thomas Sanchez

Then search "osc" and install the oscP5 library by Andreas Schlegel

Restart Processing

Open the OSCreceiver.maxpat

Open PointTrackingOSC.pde

Run the Processing sketch

The Processing sketch finds the average location in a collection of pixels within a min and max threshold and then sends out that location and its distance from the camera.
Use the up and down arrow keys to change the threshold.

The Max patch will receive the coordinates and separate them out into individual values for use in your patch. 
