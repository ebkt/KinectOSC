// Daniel Shiffman and Thomas Sanchez Lengeling
// Tracking the average location beyond a given depth threshold
// Thanks to Dan O'Sullivan
// https://github.com/shiffman/OpenKinect-for-Processing
// http://shiffman.net/p5/kinect/

// osc and depth functionality added by Elias Berkhout
// with help from the oscP5 documentation/examples

import org.openkinect.processing.*;
import oscP5.*;
import netP5.*;

// The kinect stuff is happening in another class
KinectTracker tracker;

// address for OSC message output
NetAddress myRemoteLocation;

void setup() {
  size(640, 520);

  // create tracker
  tracker = new KinectTracker(this);
  
  // set address and port for OSC message
  myRemoteLocation = new NetAddress("127.0.0.1", 12345);
}

void draw() {
  background(255);

  // Run the tracking analysis
  tracker.track();
  // Show tracker
  tracker.display();
  
  // Let's draw the raw xy location
  PVector v1 = tracker.getPos();
  fill(50, 100, 250, 200);
  noStroke();
  ellipse(v1.x, v1.y, 30, 30);

  // Let's draw the "lerped" xy location
  PVector v2 = tracker.getLerpedPos();
  fill(100, 250, 50, 200);
  noStroke();
  ellipse(v2.x, v2.y, 20, 20);

  // create variables for each coordinate
  float locX = v2.x; // locX range is 0-512
  float locY = v2.y; // locY range is 0-424
  float locZ = v2.z; // locZ is in mm – range is 0-4500
  
  // send the x, y and z locations out via osc
  OSCsend(locX, locY, locZ);
    
  // Display some other info
  int t = tracker.getThreshold();
  fill(0);
  text("threshold: " + t + "    " +  "framerate: " + int(frameRate) + "    " +
    "UP increase threshold, DOWN decrease threshold", 10, 500);
}

// Adjust the threshold with up & down arrows
void keyPressed() {
  int t = tracker.getThreshold();
  if (key == CODED) {
    if (keyCode == UP) {
      t +=5;
      tracker.setThreshold(t);
    } else if (keyCode == DOWN) {
      t -=5;
      tracker.setThreshold(t);
    }
  }
}

void OSCsend(float x, float y, float z){
  // create new osc message /xyz
  OscMessage myOscMessage = new OscMessage("/xyz");
  
  /* add a value (an integer) to the OscMessage */
  myOscMessage.add(x);
  myOscMessage.add(y);
  myOscMessage.add(z);
  
  // send the OscMessage to the remote location. 
  OscP5.flush(myOscMessage, myRemoteLocation);
}
