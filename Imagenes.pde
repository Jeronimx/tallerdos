/* 
EN ESTA PESTAÑA SE HACE LA CARGA DE LAS IMAGENES, LOS ARREGLOS DE IMAGENES Y LOS .GIF 
LAS IMAGENES Y LOS .GIF ESTAN EN DIFERENTES CARPETAS DENTRO DE LA DATA FOLDER
PARA CARGAR UNA IMAGEN QUE ESTÁ DENTRO DE UNA CARPETA APARTE SE USAN LAS BARRAS ("/")
EJEMPLO: loadImage( "carpetaDentroDeData/carpeta2/carpeta3/"imagen.jpg" );
*/

/* Librería de GIF */
import gifAnimation.*;

/* Carga de GIF */
PImage[] aurisFrames;
Gif auris;
PImage[] celuFrames;
Gif celu;
PImage[] corazonFrames;
Gif corazon;

/* Carga de arreglos de IMG */
int cantidadBarrita = 3;
PImage[] barrita = new PImage[cantidadBarrita];
int elinaCant = 11;
PImage[] elina = new PImage[elinaCant];

/* Carga de IMG sueltas (HUD, FONDO, ETC.) */
PImage fondo,mesa,siguienteimg;

/* ACA SE EMPIEZAN A CARGAR LAS IMAGENES DE PANTALLAS ESPECÍFICAS */

/* INTRO */

//GLOBOS DE DIALOGO - INTRO
int globoIntroCant = 3;
PImage[] globoIntro = new PImage[globoIntroCant];
//GLOBOS DE DIALOGO - INTRO A
int globoIntroCantA = 3;
PImage[] globoIntroA = new PImage[globoIntroCantA];
//GLOBOS DE DIALOGO - INTRO B
int globoIntroCantB = 3;
PImage[] globoIntroB = new PImage[globoIntroCantB];
//INTRO Y EXPLICACIÓN
PImage in0, in1;

/* EFECTO ELIZA */
PImage preg;

/* Esta es la función que declaramos en el setup para que se cargen las imagenes una sola vez */
void cargarImagenes(){
  
  /* FONDO, HUD, ETC. */
  fondo = loadImage( "fondo.png" );
  mesa = loadImage( "mesa.png" );
  siguienteimg = loadImage( "siguiente.png" );
  
  /* .GIF */
  corazon = new Gif(this, "/gif/corazon1.gif");
  corazon.loop();
  auris = new Gif(this, "/gif/auris.gif");
  auris.loop();
  celu = new Gif(this, "/gif/celu.gif");
  celu.loop();
  
  /* ELINA */
  for ( int i = 0; i < elina.length; i++ ) {
    elina[i] = loadImage("/elina/Elina" + i + ".png");
    elina[i].resize( 665,636 );
  }
  /* BARRA HUD */
  for ( int i = 0; i < barrita.length; i++ ) {
    barrita[i] = loadImage("/barrita/barrita" + i + ".png");
  }
  
  /* ACA SE EMPIEZAN A CARGAR LAS IMAGENES DE PANTALLAS ESPECÍFICAS */
  
  /* INTRO */
  
  //GLOBOS DE DIALOGO - INTRO
  for ( int i = 0; i < globoIntro.length; i++ ) {
    globoIntro[i] = loadImage("/pantallas/intro/globo" + i + ".png");
  }
  //GLOBOS DE DIALOGO - INTRO A
  for ( int i = 0; i < globoIntroA.length; i++ ) {
    globoIntroA[i] = loadImage("/pantallas/intro/A/A" + i + ".png");
  }
  //GLOBOS DE DIALOGO - INTRO B
  for ( int i = 0; i < globoIntroB.length; i++ ) {
    globoIntroB[i] = loadImage("/pantallas/intro/B/B" + i + ".png");
  }
  //INTRO Y EXPLICACIÓN
  in0 = loadImage( "/pantallas/intro/p0.png" );
  in1 = loadImage( "/pantallas/intro/p1.png" );
  
  /* EFECTO ELIZA */
  preg = loadImage( "/pantallas/efectoEliza/e0.png" );
  
  
}
