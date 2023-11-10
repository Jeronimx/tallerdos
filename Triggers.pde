/* 
ACA SE PONEN LOS DETONADORES DE CADA PANTALLA PARA QUE ESTÉ TODO MÁS ORGANIZADO.
EL MODO DE USO DE ESTA PESTAÑA ES EL SIGUIENTE:

CONDICIONAL, ESTADO PREVIO Y ESTADO SIGUIENTE.
  EJEMPLO:
      IF( ESTADO.EQUALS( "PANTALLA A" ) && BOTON DE SIGUIENTE = TRUE ){
        ESTADO = "PANTALLA B"
        ACA ESTADO SE CONVIERTE EN PANTALLA B, POR ENDE; PONEMOS LA PANTALLA PREVIA, DONDE APRETANDO EL BOTON SE CAMBIA.
      }    
*/ 

/* VARIABLES DE BOTONES */
boolean siguiente = false;
boolean b1 = false;
boolean b2 = false;

/* if( estado.equals( " " ) ) && ){} */
void triggers(){
  
  /* De intro0 a intro1 */
  if( estado.equals( "intro0" ) && siguiente == true ){
    siguiente = false;
    estado = "intro1";
  }
  /* De intro1 a intro2 */
  if( estado.equals( "intro1" ) && siguiente == true ){
    siguiente = false;
    estado = "intro2";
  }
  /* De intro2 a intro3 */
  if( estado.equals( "intro2" ) && siguiente == true ){
    siguiente = false;
    estado = "intro3";
  }
  
  /* ACA DIFURCA, SE EMPIEZAN A VER DOS BOTONES. */
  
  /* De intro3 a intro4 A */
  if( estado.equals( "intro3" ) && b1 == true ){
    tiempo = 0;
    b1 = false;
    estado = "intro4A";
  }
  /* De intro3 a intro4 B */
  if( estado.equals( "intro3" ) && b2 == true ){
    tiempo = 0;
    b2 = false;
    estado = "intro4B";
  }
  
  if( estado.equals( "intro4A" ) || estado.equals( "intro4B" ) && siguiente == true ){
    estado = "efectoEliza";
    siguiente = false;
  }
  
  /* DIFURCA, EFECTO ELZA A Y B */
  
  if( estado.equals( "efectoEliza" ) && siguiente == true ){
    estado = "efectoElizaA";
    siguiente = false;
  }
  if( estado.equals( "efectoEliza" ) && siguiente == true ){
    estado = "efectoElizaB";
    siguiente = false;
  }
  
  
  
  
}
