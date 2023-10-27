import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

float boton;


void setup(){
  size( 400, 400 );
  background( 0 );
  textAlign( CENTER );
  textSize( 20 );
  
  oscP5 = new OscP5(this,9000);
  
  myRemoteLocation = new NetAddress("192.168.0.209",12000);
  
}

void draw() {
  background(0);  
  text( boton, width/2, height/2 );
}

void oscEvent(OscMessage m) {

  print("### received an osc message.");
  print(" addrpattern: "+m.addrPattern());
  println(" typetag: "+m.typetag());
  
  //if( m.addrPattern().equals("presionado") ){
  //  boton1 = m.get(0).floatValue();
  //  println("boton1 presionado");
  //}
  
  if( m.addrPattern().equals( "/mensaje1" ) ){
    boton = m.get(0).floatValue();
    println( "mensaje 1 sirve" );
  }
  
}
