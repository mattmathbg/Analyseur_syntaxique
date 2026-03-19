%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%union {
    char* chaine;
    int entier;
}

%token <entier> NOMBRE
%type <entier> expression

/* On dit que le jeton IDENT transporte une 'chaine' */
%token <chaine> IDENT

/* Déclaration de tous les jetons (tokens) venant de LEX (avec les nouveaux opérateurs) */
%token SI SINON TANT_QUE AFFICHER
%token EGAL_EGAL DIFF INF_EGAL SUP_EGAL EGAL PLUS MOINS MULT DIV SUP INF
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
    IDENT EGAL expression POINT_VIRGULE { 
        printf("Affectation : %s = %d\n", $1, $3); 
        free($1); /* On libère la mémoire allouée par strdup dans Lex ! */
    }
    ;

affichage:
    AFFICHER PAR_G expression PAR_D POINT_VIRGULE { 
        printf("Affichage : %d\n", $3); 
    }
    ;

structure_si:
    SI PAR_G condition PAR_D ACC_G instructions ACC_D { 
        printf("Structure si : ...\n"); 
    }
    | SI PAR_G condition PAR_D ACC_G instructions ACC_D SINON ACC_G instructions ACC_D { 
        printf("Structure si/sinon : ...\n"); 
    }
    ;

structure_tant_que:
    TANT_QUE PAR_G condition PAR_D ACC_G instructions ACC_D { 
        printf("Structure tant que : ...\n"); 
    }
    ;

condition:
    expression EGAL_EGAL expression
    | expression DIFF expression
    | expression INF expression
    | expression SUP expression
    | expression INF_EGAL expression
    | expression SUP_EGAL expression
    ;

expression:
    NOMBRE                        { $$ = $1; }
    | IDENT                       { $$ = 0; }  /* On met 0 par défaut pour l'instant */
    | expression PLUS expression  { $$ = $1 + $3; }
    | expression MOINS expression { $$ = $1 - $3; }
    | expression MULT expression  { $$ = $1 * $3; }
    | expression DIV expression   { $$ = $1 / $3; }
    | PAR_G expression PAR_D      { $$ = $2; } /* Le résultat est le 2ème élément (l'expression) */
    ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Erreur de syntaxe : %s\n", s); /* Affiche la ligne de l'erreur ! */
}

int main() {
    printf("--- Analyseur Syntaxique ---\n");
    printf("Entrez votre code (Faites Ctrl+C sur Windows pour terminer) :\n");
    if (yyparse() == 0) {
        printf("=> BRAVO ! Analyse terminee avec succes. Syntaxe correcte.\n");
    }
    return 0;
}