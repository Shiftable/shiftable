import processing.serial.*;
char a;
Serial serial;
int state=0,com=2;
boolean arduino=true;
String arduinoName="";
void arduinoModeSetup(){
  try{serial = new Serial(this,Serial.list()[com],115200);}
  catch(Exception e){
    println("NO Serial is connet!");
    arduino=false;
  }
  if(arduino){
    println("connet to "+Serial.list()[com]);
    arduinoName=Serial.list()[com];
  }
}
void checkArduino(){
}
int playIndex=0;
int time=0;
void runArduino(){
 
  //checkArduino();
  ////if(serial.available() > 0) { 
  ////  a=char(serial.read());
  ////  println(a);
  ////}
  //time++;
  //if(arduino)serial.write(key);
  //}
  //else{
  //  playIndex=0;
  //}
}