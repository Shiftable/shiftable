#include <Servo.h>

Servo myservo[8];

float time1=0;
int mainTime=0;


float degree=10;
float x=0,dx=0;

boolean sinWave=false;
boolean save=true;
boolean point=false;
String inByte;
String inString = "";    

void setup() {
  
  Serial.begin(115200);
  for(int i=0;i<8;i++)
  myservo[i].attach(31+i*2);
  
}


void loop() {
  
  while (Serial.available() > 0) {
    int inChar = Serial.read();
    if (isDigit(inChar)) {
     inString += (char)inChar;
     point=true;
    }
    else{
      point=false;
    }
    if (inChar == '\n') {
      
      dx=inString.toInt(); 
      
      inString = "";
    }
  }
  x+=(dx-x)*0.6;
  if(x!=0)
  for(int i=0;i<7;i++){
          myservo[i].write(min(23+abs((300+i*1300/6)-x)*0.24,160));
  }


  
  
//  if(point){
//    
//  }
//  else{
//    
//      if(save){
//        
//        for(int i=0;i<8;i++){
//          myservo[i].write(90);
//        }
//      
//      }
//      else{
//        
//        if(sinWave){
//          
//          mainTime++;
//          
//          if(mainTime%1200==0){
//            
//            time1+=0.1;
//           
//           
//          }
//          if(mainTime%1200==0){
//          for(int i=0;i<8;i++)
//              myservo[i].write(int(sin(time1+i*0.8)*75+85));
//          }
//          
//        }
//        else{
//          for(int i=0;i<8;i++){
//            myservo[i].write(165);
//          }
//        }
//      }
//  
//    
//  }
    
}

