/**
 * oscP5sendreceive by andreas schlegel
 * example shows how to send and receive osc messages.
 * oscP5 website at http://www.sojamo.de/oscP5
 */

 
import oscP5.*;
import netP5.*;

boolean[] p = new boolean[30];
  
OscP5 oscP5;
NetAddress myRemoteLocation;

//String dosValores = "0";
PImage foto, foto1;
  int x = 350;
  int y = 650;
  int radius = 200;

//botones 2y3
int x1 = 350;
int y1 = 640;
int x2 = 350;
int y2 = 1080;
  

void setup() {
  fullScreen();
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,12000);
  
  foto = loadImage("celu0.png");
  foto1 = loadImage("celu1.png");
  
  /* myRemoteLocation is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device, 
   * application. usage see below. for testing purposes the listening port
   * and the port of the remote location address are the same, hence you will
   * send messages back to this sketch.
   */
  myRemoteLocation = new NetAddress("192.168.1.110",9000);
  
  ellipseMode(RADIUS);
  imageMode(CENTER);
  textAlign(CENTER);
}


void draw() {
  
  background(0);

  fill(200);
  ellipse(x,y,radius,radius);  

  if( p[1] ){
    background( #FFB4CC );
  }
  if( p[2] ){
    image( foto, width/2, height/2, width, height );
  }
  if( p[3] ){
    image( foto1, width/2, height/2, width, height );
  }
  if( p[4] ){
    background( 255,0,0);
    text("eleccion 1", width/2, height/2);
  }
  if( p[5] ){
    background( 0,0,255 );
    text("eleccion 2", width/2, height/2);
  }
  
  
  float mx = mouseX;
  float my = mouseY;
  fill(0);
  rect( mx-20, my-20, 100, 50 );
  fill( 255 );
  text( "X: "+mx, mouseX+20, mouseY );
  text( "Y: "+my, mouseX-20, mouseY+20 );
  
}


void touchStarted(){

  
  
  if( p[1] || p[2] ){
    float d = dist(mouseX, mouseY, x,y);
    if(d< radius){
       /* send the message */
       OscMessage myMessage1 = new OscMessage("/mensaje1/boton1/0" );
       myMessage1.add( 2.0 );
       oscP5.send(myMessage1, myRemoteLocation); 
    }
  }
  
  if( p[3] ){ //boton 2 y 3
  
    float r = dist(mouseX, mouseY, x1,y1);
    float r1 = dist(mouseX, mouseY, x2,y2);
      if(r < radius){ //boton2
         /* send the message */
         OscMessage myMessage1 = new OscMessage("/mensaje1/boton2/0" );
         myMessage1.add( 2.0 );
         oscP5.send(myMessage1, myRemoteLocation);      image (foto1,0,0,width,height);
      }
      if(r1 < radius){ //boton3
         /* send the message */
         OscMessage myMessage1 = new OscMessage("/mensaje1/boton3/0" );
         myMessage1.add( 2.0 );
         oscP5.send(myMessage1, myRemoteLocation);      image (foto1,0,0,width,height);
      }
  }
  
}


void touchEnded(){

  
  if( p[1] || p[2] ){
    float d = dist(mouseX, mouseY, x,y);
    if(d< radius){
      
    OscMessage myMessage1 = new OscMessage("/mensaje1/boton1/1" );
    myMessage1.add( 1.0 );
    oscP5.send(myMessage1, myRemoteLocation);
    }
  }
  
  if( p[3] ){ //boton 2 y 3
  
    float r = dist(mouseX, mouseY, x1,y1);
    float r1 = dist(mouseX, mouseY, x2,y2);
      if(r < radius){ //boton2
         /* send the message */
         OscMessage myMessage1 = new OscMessage("/mensaje1/boton2/1" );
         myMessage1.add( 2.0 );
         oscP5.send(myMessage1, myRemoteLocation);      image (foto1,0,0,width,height);
      }
      if(r1 < radius){ //boton3
         /* send the message */
         OscMessage myMessage1 = new OscMessage("/mensaje1/boton3/1" );
         myMessage1.add( 2.0 );
         oscP5.send(myMessage1, myRemoteLocation);      image (foto1,0,0,width,height);
      }
  }
  
}

void oscEvent(OscMessage m) {

  print("### received an osc message.");
  print(" addrpattern: "+m.addrPattern());
  println(" typetag: "+m.typetag());
  
  if( m.addrPattern().equals("/1") ){
    p[1] = true;
  }
  if( m.addrPattern().equals("/2") ){
    p[2] = true;
  }
  if( m.addrPattern().equals("/3") ){
    p[3] = true;
  }
  if( m.addrPattern().equals("/4.1") ){
    p[4] = true;
  }
  if( m.addrPattern().equals("/4.2") ){
    p[5] = true;
  }
  
}
