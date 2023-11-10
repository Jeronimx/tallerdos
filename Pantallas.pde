/* 
PANTALLAS SE EJECUTA UNA VEZ POR FRAME, ESTO REEMPLAZA EL -VOID DRAW(){}- PARA QUE ESTÉ TODO MAS ORGANIZADO.
SE CARGA EL ESTADO DE ELIZA Y LAS VARIABLES DE CADA PANTALLA, COMO PUEDEN SER LOS DIALOGOS Y LAS IMG/.GIF.

LAS CONDICIONALES VAN A SER IGUALES A LA PANTALLA A LA QUE REFIEREN, POR EJEMPLO:
    IF( ESTADO.EQUALS( "PANTALLA 40" ) ){
      ACA SE VA A EJECUTAR EL ESTADO DE ELINA EN PANTALLA 40, LOS DIALOGOS DE PANTALLA 40, ETC.
      EL DETONADOR QUE HACE QUE ENTRES A ESTA PANTALLA ESTARÁ EN LA PESTAÑA DE TRIGGERS.
    }
*/

/* Variables de tiempo e indice de arreglo :) */

int tiempo = 0;
int indice = 0;

void pantallas(){
  
  if( estado.equals( "intro0" ) ){
    image( fondo, width/2, height/2 );
    image( in0, width/2, height/2 );
    image( corazon, width/2, height/2+50, 400, 365 );
  }
  if( estado.equals( "intro1" ) ){
    fondo();
    HUD();
    image( in1, width/2, height/2 );
    image( celu, 493, height/2+10, 80,80 );
    image( auris, 500, height-290, 80,80 );
  }
  if( estado.equals( "intro2" ) ){
    fondo();
    base();
    HUD();
  }
  
/* 
   A TENER EN CUENTA: 
     - LA IMAGEN QUE SE CAMBIA EN EL TIEMPO SE PONE UNA SOLA VEZ, LO QUE CAMBIA ES EL ÍNDICE.
     - EL TIEMPO SUMA ( "TIEMPO ++;" ), SON 50 FRAMES POR SEGUNDO.
     - EL TIEMPO SE REINICIA EN TRIGGERS, ACA SOLO "DISEÑAMOS" LAS PANTALLAS.
     - PONER MAYOR O IGUAL PARA EVITAR BUGS ( ">=" ).
     - EL ELSE IF NO FUNCIONA EN ESTE TIPO DE ACTUALIZACIÓN. :d
*/
  
  if( estado.equals( "intro3" ) ){
    tiempo ++;
    fondo();
    base();
    HUD();
    image( globoIntro[indice], 490, height/2 );
      if( tiempo >= 0 ){
        indice = 0;
      } 
      if( tiempo >= 200 ){
        indice = 1;
      } 
      if( tiempo >= 400 ){
        indice = 2;
      }
    
  }
  
  /* ACA SE DIFURCA */
  
  if( estado.equals( "intro4A" ) ){
    tiempo ++;
    fondo();
    base();
    HUD();
    image( globoIntroA[indice], 490, height/2 );
      if( tiempo >= 0 ){
        indice = 0;
      } 
      if( tiempo >= 200 ){
        indice = 1;
      } 
      if( tiempo >= 400 ){
        indice = 2;
      }
  }
  
  if( estado.equals( "intro4B" ) ){
    tiempo ++;
    fondo();
    base();
    HUD();
    image( globoIntroB[indice], 490, height/2 );
      if( tiempo >= 0 ){
        indice = 0;
      } 
      if( tiempo >= 200 ){
        indice = 1;
      } 
      if( tiempo >= 400 ){
        indice = 2;
      }
  }
  
  if( estado.equals( "efectoEliza" ) ){
    fondo();
    base();
    HUD();
    image( preg, 510, height/2-100 );
  }
  
  /* DIFURCA - EFECTO ELIZA A Y B */
  
  if( estado.equals( "efectoElizaA" ) ){
    fondo();
    base();
    HUD();
    image( preg, 510, height/2-100 );
  }
  
  if( estado.equals( "efectoElizaB" ) ){
    fondo();
    base();
    HUD();
    image( preg, 510, height/2-100 );
  }
  
  
}
