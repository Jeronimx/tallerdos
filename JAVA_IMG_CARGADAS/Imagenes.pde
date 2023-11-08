//Cargar IMG y GIFS

import gifAnimation.*;


PImage[] auris;
Gif aurisGif;
PImage[] celu;
Gif celuGif;
PImage[] corazon;
Gif coraGif;

int cantidadBarrita = 7;
PImage[] barrita = new PImage[cantidadBarrita];
int globoIntroCant = 3;
PImage[] globoIntro = new PImage[globoIntroCant];
int elinaCant = 10;
PImage[] elina = new PImage[elinaCant];

PImage resto,mesa,intro1,intro2;


void cargar(){
  //Gif
  coraGif = new Gif(this, "corazon.gif");
  coraGif.loop();
  aurisGif = new Gif(this, "auris.gif");
  aurisGif.loop();
  celuGif = new Gif(this, "celu.gif");
  celuGif.loop();
  
  //Elina
  for ( int i = 0; i < elina.length; i++ ) {
    elina[i] = loadImage("Elina" + i + ".png");
    elina[i].resize( 837,800 );
  }
  //barrita
  for ( int i = 0; i < barrita.length; i++ ) {
    barrita[i] = loadImage("barrita" + i + ".png");
    barrita[i].resize( 425,75 );
  }
  //Globos de dialogo intro
  for ( int i = 0; i < globoIntro.length; i++ ) {
    globoIntro[i] = loadImage("globoIntro" + i + ".png");
  }
  
  
  
  resto = loadImage( "fondoResto.png" );
  mesa = loadImage( "mesa.png" );
  intro1 = loadImage( "intro1.png" );
  intro2 = loadImage( "intro2.png" );
  
}
