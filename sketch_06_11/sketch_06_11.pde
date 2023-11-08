import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress myRemoteLocation;

/* BOTON 1 */
int x = 350;
int y = 650;
int radius = 200;
int x1 = 350;
int y1 = 650;
int radius2 = 100;

String estados = "inicio";


void setup() {
  
  fullScreen();
  background(140);
  
  oscP5 = new OscP5(this,12000);
  
  myRemoteLocation = new NetAddress("192.168.206.79",8000);
  
  ellipseMode(RADIUS);
  imageMode(CENTER);
  textAlign(CENTER);
  
}

void draw(){
  
   println( estados );
   background( 150 );
  if( estados.equals("inicio") ){
    fill( 255 );
    ellipse( x,y,radius,radius );
  } else if( estados.equals("estamosEnEstado3") ){
    fill( 255,0,0 );
    ellipse( x1,y1-200,radius2,radius2 );
    fill( 0,0,255 );
    ellipse( x1,y1+200,radius2,radius2 );
  }
  
}



void touchStarted(){
  
  //reinicio
  if( mouseX > 0 && mouseX < 100 && mouseY > 0 && mouseY < 100 ){
    fill( 0,255,0 );
    rect( 0,0,100,100 );
    estados = "inicio";
    OscMessage myMessage0 = new OscMessage("/mensaje1/reinicio" );
    myMessage0.add( "intro0" );
    oscP5.send(myMessage0, myRemoteLocation); 
  }
  
  if( estados.equals("inicio") ){
    
    float d = dist(mouseX, mouseY, x,y);
    if(d< radius){
       /* send the message */
       OscMessage myMessage1 = new OscMessage("/mensaje1/boton1/0" );
       myMessage1.add( 2.0 );
       oscP5.send(myMessage1, myRemoteLocation); 
       }
    
  }
  
  if( estados.equals("estamosEnEstado3") ){
    //boton1
      float r = dist(mouseX, mouseY, x1,y1-200);
         if(r< radius2){
         /* send the message */
         OscMessage myMessage3 = new OscMessage("/mensaje1/boton2/1" );
         myMessage3.add( 2.0 );
         oscP5.send(myMessage3, myRemoteLocation); 
         }
         
      float f = dist(mouseX, mouseY, x1,y1+200);
         if(f< radius2){
         /* send the message */
         OscMessage myMessage4 = new OscMessage("/mensaje1/boton2/2" );
         myMessage4.add( 2.0 );
         oscP5.send(myMessage4, myRemoteLocation); 
         }
  }
}


void touchEnded(){
  
  if( estados.equals("inicio") ){
    
    float d = dist(mouseX, mouseY, x,y);
    if(d< radius){
       /* send the message */
       OscMessage myMessage1 = new OscMessage("/mensaje1/boton1/1" );
       myMessage1.add( 2.0 );
       oscP5.send(myMessage1, myRemoteLocation); 
       }
       
    }
       
    if( estados.equals("estamosEnEstado3") ){
    //boton1
      float d = dist(mouseX, mouseY, x,y-80);
         if(d< radius2){
         /* send the message */
         OscMessage myMessage1 = new OscMessage("/mensaje1/boton2/1A" );
         myMessage1.add( 2.0 );
         oscP5.send(myMessage1, myRemoteLocation); 
         }
         
      float f = dist(mouseX, mouseY, x,y+80);
         if(f< radius2){
         /* send the message */
         OscMessage myMessage1 = new OscMessage("/mensaje1/boton2/2B" );
         myMessage1.add( 2.0 );
         oscP5.send(myMessage1, myRemoteLocation); 
         }
  }
  
}
  
void oscEvent(OscMessage m) {

  print("### received an osc message.");
  print(" addrpattern: "+m.addrPattern());
  println(" typetag: "+m.typetag());
  
  if( m.addrPattern().equals("/mensaje1/estado/intro3") ){
    estados = m.get(0).stringValue();
  }

  
}
