%{
#include "langage.tab.h" /* Fichier généré par YACC */
#include <stdlib.h>
%}

%%
"si"            { return SI; }
"sinon"         { return SINON; }
"tant_que"      { return TANT_QUE; }
"afficher"      { return AFFICHER; }
[a-zA-Z_]+      { return IDENT; }       /* Pour les noms de variables */
[0-9]+          { return NOMBRE; }      /* Pour les nombres entiers */
"=="            { return EGAL_EGAL; }
"="             { return EGAL; }
"+"             { return PLUS; }
"-"             { return MOINS; }
"*"             { return MULT; }
"/"             { return DIV; }
"("             { return PAR_G; }
")"             { return PAR_D; }
"{"             { return ACC_G; }
"}"             { return ACC_D; }
";"             { return POINT_VIRGULE; }
">"             { return SUP; }
"<"             { return INF; }
[ \t\n\r]+      { /* On ignore les espaces et sauts de ligne */ }
.               { printf("Erreur lexicale : caractère non reconnu '%s'\n", yytext); }
%%

int yywrap() { return 1; }