

void pantallas(){
  
  
  //Pantalla de intro, todavía no comienza la experiencia, solo se declaran las img
  if( estado.equals("intro0") ){
    intro1();
  }
  //Empieza la experiencia
  if( estado.equals("intro0") && boton == true ){
    
    intro2();
    image( aurisGif, 300, height/2-50);
    image( celuGif, 300, height/2+50 );
    boton = false;
    
  }
  if( estado.equals("intro1") && boton ){
    intro3();
  }
  if( estado.equals("intro2") && boton ){ 
        //intro4();
    /* Las funciones tipo intro4(); se ejecutan una sola vez, entonces no se actualiza
    en el tiempo, hay que traerlas todas acá, y que el boton no sea false hasta
    que se termine la animación/lo que sea que se mueva en el tiempo */
        tiempo --;
        image( resto, width/2, height/2 );
        image( elina[0], width/2, height/2 );
        image( mesa, width/2, height );
        image( barrita[6], width-230, 100 );
        image( globoIntro[indice], 350, height/2+250 );
        
            if( tiempo <= 5000 && tiempo > 4800 ){
              indice = 0;
            } else if( tiempo <= 4800 && tiempo > 4600 ){
              indice = 1;
            } else if( tiempo <= 4600 && tiempo > 4400 ){
              indice = 2;
            } else if( tiempo <= 4400 ){
              boton = false;
              estado = "intro3";
              OscMessage myMessage1 = new OscMessage("/mensaje1/estado/intro3" );
              myMessage1.add("estamosEnEstado3");
              oscP5.send(myMessage1, myRemoteLocation); 
              tiempo = 5000;
            }
      
  }
  
  //COMIENZA A DIFURCAR, esto va en la pestaña ESTADOS como función
  if( estado.equals("intro3") && boton1 ){ 
    background( 255,0,0 );
    fill( 0 );
    textSize(60);
    text("boton1", width/2, height/2 );
    boton1 = false;
    estado = "intro4A";
  }
  if( estado.equals("intro3") && boton2 ){ 
    background( 0,0,255 );
    fill( 0 );
    textSize(60);
    text("boton2", width/2, height/2 );
    boton2 = false;
    estado = "intro4B";
  }

}
