/* ACA RECIBIS LOS MENSAJES DE OSC */

void oscEvent(OscMessage m) {
  
  /* ESTO HACE UN PRINT DE LOS MENSAJES QUE RECIBÍS, CON SU ADRESS Y VALOR */
  print("### received an osc message.");
  print(" addrpattern: "+m.addrPattern());
  println(" typetag: "+m.typetag());
  /* Para agarrar el valor de un mensaje: variable = m.get(0).floatValue(); // Puede ser floatValue, StringValue */
  
  /* SI EL BOTON DE SIGUIENTE ES PRESIONADO EN EL CELU TE ENVÍA ESTE MENSAJE, SI ESE MENSAJE LLEGA = SIGUIENTE ES TRUE. */  
  if( m.addrPattern().equals("/mensaje1/boton1/0") ){
    siguiente = true;
  }
  
  /* Boton1 */
  if( m.addrPattern().equals("/mensaje1/boton2/1") ){
    b1 = true;
  }
  
  /* Boton2 */
  if( m.addrPattern().equals("/mensaje1/boton2/2") ){
    b2 = true;
  }
  
  
  //reinicio
  if( m.addrPattern().equals("/mensaje1/reinicio") ){
    siguiente = false;
    b1 = false;
    b2 = false;
    //estado = m.get(0).stringValue();
  }

  
}
