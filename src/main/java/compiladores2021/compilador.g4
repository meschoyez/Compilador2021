grammar compilador;

@header{ 
package compiladores2021;
}

// DIGITO : '0' | '1' | '2' | ... ;
fragment DIGITO : [0-9] ;

fragment HOLA : 'hola' ;
fragment CHAU : 'chau' ;
SALUDO : HOLA | CHAU ;

NATURAL : DIGITO+ ;

ENTERO : '-'? NATURAL ;

WS : [ \t\n\r] -> skip;

OTRO : . ;

s : NATURAL { System.out.println("Natural -> " + $NATURAL.getText()); } s
  | OTRO { System.out.println("No reconocido -> |" + $OTRO.getText() + "|"); } s
  | SALUDO { System.out.println("Saludo -> |" + $SALUDO.getText() + "|"); } s
  | EOF
  ;
