import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress myRemoteLocation;

boolean boton = false;
boolean boton1 = false;
boolean boton2 = false;
int tiempo = 5000;
int indice = 0;

void setup(){
  
  size( 1920, 1080 );
  //fullScreen();
  textAlign( CENTER );
  imageMode( CENTER );
  
  oscP5 = new OscP5(this,8000);
  myRemoteLocation = new NetAddress("192.168.206.203",12000);
  
  //Cargar img
  cargar();
  
}

void draw(){
  
  pantallas();
  println( estado );

}

//void keyPressed(){
//  if( key == 's' ){
//    boton = true;
//  }
//  if( key == 'd' ){
//    boton1 = true;
//  }
//  if( key == 'f' ){
//    boton2 = true;
//  }
  
  
//}

void oscEvent(OscMessage m) {

  print("### received an osc message.");
  print(" addrpattern: "+m.addrPattern());
  println(" typetag: "+m.typetag());
  
  if( m.addrPattern().equals("/mensaje1/boton1/0") ){
    boton = true;
    //boton = m.get(0).floatValue();
  }
  
  if( m.addrPattern().equals("/mensaje1/boton2/1") ){
    boton1 = true;
  }
  if( m.addrPattern().equals("/mensaje1/boton2/2") ){
    boton2 = true;
  }
  
  
  //reinicio
  if( m.addrPattern().equals("/mensaje1/reinicio") ){
    boton = false;
    boton1 = false;
    boton2 = false;
    estado = m.get(0).stringValue();
  }
  
  //if( m.addrPattern().equals("/mensaje1/boton1/1") ){
  //  boton = false;    
  //}
  
}
