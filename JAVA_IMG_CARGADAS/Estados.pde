String estado = "intro0";


void intro1(){
  image( intro1, width/2, height/2 );
  image( coraGif, width/2, height/2+50, 800,600 );
}

void intro2(){
  
  estado = "intro1";
  image( intro2, width/2, height/2 );
  
}

void intro3(){
  estado = "intro2";
  boton = false;
  image( resto, width/2, height/2 );
  image( elina[0], width/2, height/2 );
  image( mesa, width/2, height );
  image( barrita[6], width-230, 100 );
  println("estado2");
}

//Elina hablando sola, la variable timer seria por audio
void intro4(){
  //boton = false;
  
  
}
