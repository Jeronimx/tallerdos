import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
PImage foto1, foto2, foto3;
float boton;
String estado;
boolean gatillo = false;
boolean gatillo2 = false;
boolean gatillo3 = false;

void setup(){
  size(1366,768);
  textAlign( CENTER );
  textSize( 20 );
  
  estado = "inicio";
  
  oscP5 = new OscP5(this,9000);
    foto1 = loadImage("imagen0.png");
    foto2 = loadImage("imagen1.png");
    foto3 = loadImage("imagen2.png");
  
  myRemoteLocation = new NetAddress("192.168.1.106",12000);
  
}

void draw() {
  //text( estado, width/2, height/2 );
  if( estado.equals("inicio") ){
     image(foto1, 0, 0, 1366,768);
       OscMessage myMessage1 = new OscMessage("/1" );
       myMessage1.add( 1.0 );
       oscP5.send(myMessage1, myRemoteLocation);
  }
  
  if( estado.equals("inicio") && gatillo ){
    image(foto2, 0, 0, 1366,768);
    estado = "pantalla uno";
      OscMessage myMessage1 = new OscMessage("/2" );
      myMessage1.add( 1.0 );
      oscP5.send(myMessage1, myRemoteLocation);
    gatillo = false;
  }
  if( estado.equals("pantalla uno") && gatillo ){
    image(foto3, 0, 0, 1366,768);
    estado = "pantalla dos";
      OscMessage myMessage1 = new OscMessage("/3" );
      myMessage1.add( 1.0 );
      oscP5.send(myMessage1, myRemoteLocation);
    gatillo = false;
  }
  if( estado.equals("pantalla dos") && gatillo2 ){
    background( 255,0,0 );
    fill(255);
    textSize(50);
    text("AVATAR 1", width/2, height/2);
    estado = "pantalla tres";
      OscMessage myMessage1 = new OscMessage("/4.1" );
      myMessage1.add( 1.0 );
      oscP5.send(myMessage1, myRemoteLocation);
    gatillo = false;
    gatillo2 = false;
  }
  if( estado.equals("pantalla dos") && gatillo3 ){
    background( 0,0,255 );
    fill(255);
    textSize(50);
    text("AVATAR 1", width/2, height/2);
    estado = "pantalla tres punto dos";
      OscMessage myMessage1 = new OscMessage("/4.2" );
      myMessage1.add( 1.0 );
      oscP5.send(myMessage1, myRemoteLocation);
    gatillo = false;
    gatillo3 = false;
  }
  
  
  


}


void oscEvent(OscMessage m) {

  print("### received an osc message.");
  print(" addrpattern: "+m.addrPattern());
  println(" typetag: "+m.typetag());
  
  if( m.addrPattern().equals("/mensaje1/boton1/0") ){
    gatillo = true;
    boton = m.get(0).floatValue();
  }
  if( m.addrPattern().equals("/mensaje1/boton1/1") ){
    gatillo = false;
    boton = m.get(0).floatValue();
  }
  //boton 2 la etiqueta cambia
  if( m.addrPattern().equals("/mensaje1/boton2/0") ){
    gatillo2 = true;
  }
  if( m.addrPattern().equals("/mensaje1/boton2/1") ){
    gatillo2 = false;
  }
  //boton 3
  if( m.addrPattern().equals("/mensaje1/boton3/0") ){
    gatillo3 = true;
  }
  if( m.addrPattern().equals("/mensaje1/boton3/1") ){
    gatillo3 = false;
  }
  
}
