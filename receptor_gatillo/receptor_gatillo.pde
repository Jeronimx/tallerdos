import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

float boton;
String estado;
boolean gatillo = false;

void setup(){
  size( 400, 400 );
  background( 0 );
  textAlign( CENTER );
  textSize( 20 );
  
  estado = "inicio";
  
  oscP5 = new OscP5(this,9000);
  
  //myRemoteLocation = new NetAddress("192.168.0.209",12000);
  
}

void draw() {
  background(0);  
  text( estado, width/2, height/2 );
  
  if( estado.equals("inicio") && gatillo ){
    estado = "pantalla uno";
    gatillo = false;
  }
  if( estado.equals("pantalla uno") && gatillo ){
    estado = "pantalla dos";
    gatillo = false;
  }
  if( estado.equals("pantalla dos") && gatillo ){
    estado = "pantalla tres";
    gatillo = false;
  }
  
  println( estado );
  
  //if( boton == 1.0 ){
  //  gatillo = true;
  //} else if( boton == 2.0 ){
  //  gatillo = false;
  //} else gatillo = false;
  
  
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
  
  //if( m.addrPattern().equals("/mensaje1/boton1/ 0") ){
  //  boton = m.get(0).floatValue();
  //  print("boton1 presionado"); }
  //} else if( m.addrPattern().equals("/mensaje1/boton1/ 1") ){
  //  boton = m.get(0).floatValue();
  //  print("boton1 suelto");
  //}

  
}
