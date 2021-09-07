grammar compilador;

@header{ 
package compiladores2021;
}

fragment DIGITO : [0-9] ;

fragment HOLA : 'hola' ;
fragment CHAU : 'chau' ;

PA : '(';
PC : ')';
LLA : '{' ;
LLC : '}' ;
PYC : ';';
COMA : ',' ;

SUMA : '+' ;
RESTA : '-' ;
MULT : '*' ;
DIV : '/' ;

INT : 'int' ;

SALUDO : HOLA | CHAU ;

ENTERO : DIGITO+ ;
// NATURAL : DIGITO+ ;
// ENTERO : '-'? NATURAL ;

ID : [a-zA-Z_] [a-zA-Z0-9_]* ;

WS : [ \t\n\r] -> skip;

OTRO : . ;

// Horas entre las 03:12 y 11:27
HORARIO : ('03:'('1'[2-9] | [2-5][0-9]))
        | (('0'[4-9] | '10') ':' [0-5][0-9])
        | ('11:'([01][0-9] | '2'[0-7] ));

horas : HORARIO { System.out.println("Ok -> " + $HORARIO.getText()); } horas
      | OTRO horas
      | EOF
      ;

bp : PA bp PC bp
   |
   ;

s : ENTERO { System.out.println("Natural -> " + $ENTERO.getText()); } s
  | OTRO { System.out.println("No reconocido -> |" + $OTRO.getText() + "|"); } s
  | SALUDO { System.out.println("Saludo -> |" + $SALUDO.getText() + "|"); } s
  | EOF
  ;

programa : instrucciones EOF ;

instrucciones : instruccion instrucciones
              |
              ;

instruccion : declaracion
            | iwhile
            | bloque
            ;

bloque : LLA instrucciones LLC ;

declaracion : INT secvar PYC { System.out.println("Ok -> |"); }
            ;

secvar : ID COMA secvar
       | ID
       ;

iwhile : PA ;

test : oal ;

oal : term t
    ;

term : factor f
     ;

t : SUMA term t
  | RESTA term t
  |
  ;

factor : ENTERO
       | ID
       | PA oal PC
       ;

f : MULT factor f
  | DIV  factor f
  |
  ;

