%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

/* Déclaration de tous les jetons (tokens) venant de LEX */
%token SI SINON TANT_QUE AFFICHER IDENT NOMBRE
%token EGAL_EGAL EGAL PLUS MOINS MULT DIV SUP INF
%token PAR_G PAR_D ACC_G ACC_D POINT_VIRGULE

/* Gestion de la priorité des opérateurs mathématiques */
%left PLUS MOINS
%left MULT DIV

%%

programme:
    instructions
    ;

instructions:
    instruction
    | instructions instruction
    ;

instruction:
    affectation
    | structure_si
    | structure_tant_que
    | affichage
    ;

affectation:
    IDENT EGAL expression POINT_VIRGULE
    ;

affichage:
    AFFICHER PAR_G expression PAR_D POINT_VIRGULE
    ;

structure_si:
    SI PAR_G condition PAR_D ACC_G instructions ACC_D
    | SI PAR_G condition PAR_D ACC_G instructions ACC_D SINON ACC_G instructions ACC_D
    ;

structure_tant_que:
    TANT_QUE PAR_G condition PAR_D ACC_G instructions ACC_D
    ;

condition:
    expression EGAL_EGAL expression
    | expression INF expression
    | expression SUP expression
    ;

expression:
    NOMBRE
    | IDENT
    | expression PLUS expression
    | expression MOINS expression
    | expression MULT expression
    | expression DIV expression
    | PAR_G expression PAR_D
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Erreur de syntaxe : %s\n", s);
}

int main() {
    printf("--- Analyseur Syntaxique 'Chinois' ---\n");
    printf("Entrez votre code (Faites Ctrl+C sur Windows pour terminer) :\n");
    if (yyparse() == 0) {
        printf("=> BRAVO ! Analyse terminée avec succès. Syntaxe correcte. 忆茹把你\n");
    }
    return 0;
}