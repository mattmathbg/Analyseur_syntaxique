%{
#include "langage.tab.h" /* Fichier généré par YACC */
#include <stdlib.h>
#include <string.h>
%}

%%
"ESKE"              { return SI; }          /* si */
"OUBIEN"            { return SINON; }       /* sinon */
"PENDANTQUE"        { return TANT_QUE; }    /* tant_que */
"MONTRER"           { return AFFICHER; }    /* afficher */

[a-zA-Z_]+          { 
                        yylval.chaine = strdup(yytext); 
                        return IDENT; 
                    }       /* Pour les noms de variables */
[0-9]+              { 
                        yylval.entier = atoi(yytext);
                        return NOMBRE; 
                    }      /* Pour les nombres entiers */
                    
"=="                { return EGAL_EGAL; }
"!="                { return DIFF; }    
"<="                { return INF_EGAL; }  
">="                { return SUP_EGAL; }  
"="                 { return EGAL; }
"+"                 { return PLUS; }
"-"                 { return MOINS; }
"*"                 { return MULT; }
"/"                 { return DIV; }
"("                 { return PAR_G; }
")"                 { return PAR_D; }
"{"                 { return ACC_G; }
"}"                 { return ACC_D; }
";"                 { return POINT_VIRGULE; }
">"                 { return SUP; }
"<"                 { return INF; }

[ \t\n\r]+          { /* On ignore les espaces, sauts de ligne, tabulations et retours chariot */ }
.                   { printf("Erreur lexicale : caractère non reconnu '%s'\n", yytext); }
%%

int yywrap() { return 1; }