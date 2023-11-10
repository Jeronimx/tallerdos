/* IMPORTAMOS LA LIBRERÍA DE OSC PARA HACER EL VÍNCULO CON ANDROID */
import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress myRemoteLocation;

void setup(){
  
  /* Tamaños y modos */
  //size(1920,1080 );
  fullScreen();
  ellipseMode( CENTER );
  rectMode( CENTER );
  imageMode( CENTER );
  textAlign( CENTER );
  
  /* LOS FRAMES QUE USAMOS EN LUGAR DE MILLIS, CADA SEGUNDO TIENE 50 FRAMES */
  frameRate( 50 );
  
  /* Cargamos OSC, llamamos al API y al puerto del dispositivo que se esté usando (El puerto es a elección) */
  oscP5 = new OscP5(this,8000);
  /* Variable a la que le enviamos mensajes a través de OSC, se pone el IP y el puerto del dispositivo al que se le envía el mensaje */
  myRemoteLocation = new NetAddress("192.168.1.106",12000);
  
  
  /* Función de carga de IMG y .GIF */
  cargarImagenes();
  
}

void draw(){
  
  pantallas();
  triggers();
  println( estado );

}

void keyPressed(){
  if( key == 'g' ){
    siguiente = true;
  }
  if( key == 'h' ){
    b1 = true;
  }
  if( key == 'j' ){
    b2 = true;
  }
}
