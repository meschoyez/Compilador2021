grammar compilador;

@header{ 
package compiladores2021;
}

fragment DIGITO : [0-9] ;

fragment HOLA : 'hola' ;
fragment CHAU : 'chau' ;

PA : '(';
PC : ')';

SALUDO : HOLA | CHAU ;

NATURAL : DIGITO+ ;

ENTERO : '-'? NATURAL ;

WS : [ \t\n\r] -> skip;

OTRO : . ;

bp : PA bp PC bp
   |
   ;


s : NATURAL { System.out.println("Natural -> " + $NATURAL.getText()); } s
  | OTRO { System.out.println("No reconocido -> |" + $OTRO.getText() + "|"); } s
  | SALUDO { System.out.println("Saludo -> |" + $SALUDO.getText() + "|"); } s
  | EOF
  ;
