import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

int time1=0;

float wScale , hScale;

void setup() {
  fullScreen();
  //size(640, 480);
  video = new Capture(this,320, 240);
  opencv = new OpenCV(this,320, 240);
  wScale=width/320;
  hScale=height/240+1;
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  arduinoModeSetup();
  video.start();
  strokeWeight(20);
  stroke(255);
}

void draw() {
  
 
  opencv.loadImage(video);
  
  scale(-1,1);
  translate(-width,0);
  image(video, 0, 0,width,240*hScale);
  
  detectFaces();
  noFill();
  if(faces.length>=1){
    float tempX,tempY,tempW,tempH;
    
    tempX = faces[0].x*wScale ;
    tempY = faces[0].y*hScale ;
    tempW = faces[0].width*wScale;
    tempH = faces[0].height*hScale;
    
    rect(tempX,tempY,tempW,tempH,50);
    if(tempW > width/9 && tempH > width/9){
      time1++;
      
      stroke(#F77DC0);
      String a=str(int(tempX+tempW/2));
      text(a,30,30);
      println(a);
      if(time1%1==0){
        if(arduino)serial.write(a+"\n");
      }
    }
    else{
      stroke(255);
      
    }
  }
}

void detectFaces() {
 
  faces = opencv.detect();
  
}
void captureEvent(Capture c) {
  c.read();
}