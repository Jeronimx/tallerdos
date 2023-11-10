//String estado = "intro0";
String estado = "efectoEliza";

/* LOS ESTADOS LOS METEMOS EN FUNCIONES PARA QUE LAS IMAGENES NO SE CARGUEN UNA VEZ POR FRAME :d */

/* 
PRIMERO DECLARO LOS ESTADOS DE ELINA, QUE SON: BASE, MASOMENOS, ENOJADA, ENAMORADA. 
CADA ESTADO DE ELINA ESTÁ CON SUS RESPECTIVOS COMPONENTES, POR EJEMPLO: ELINA ENOJADA TIENE LA BARRA AL 0, ELINA MASOMENOS TIENE LA BARRA A LA MITAD.
*/

void fondo(){
  image( fondo, width/2, height/2 );
}

void HUD(){
  image( siguienteimg, width-siguienteimg.width-50, height-siguienteimg.height );
}

void base(){
  image( elina[0], width/2, height-elina[0].height/2-50 );
  image( mesa, width/2, height-mesa.height/2 );
  image( barrita[0], width-250, 100 );
}

void masomenos(){
  image( elina[5], width/2, height-elina[0].height/2-50 );
  image( mesa, width/2, height-mesa.height/2 );
  image( barrita[0], width-250, 100 );
}

void enojada(){
  image( elina[2], width/2, height-elina[0].height/2-50 );
  image( mesa, width/2, height-mesa.height/2 );
  image( barrita[0], width-250, 100 );
}

void enamorada(){
  image( elina[10], width/2, height-elina[0].height/2-50 );
  image( mesa, width/2, height-mesa.height/2 );
  image( barrita[0], width-250, 100 );
}
