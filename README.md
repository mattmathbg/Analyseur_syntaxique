Projet: Création d'un analyseur syntaxique avec FLEX / LEX + BISON / YACC 

L3 - Département Informatique  | UFR MIM, Université de Lorraine 

## Description

Ce projet implémente un analyseur syntaxique utilisant FLEX (analyse lexicale) et BISON/YACC (analyse syntaxique) pour un langage de programmation personnalisé  en "pseudo-code français".

Auteurs (Groupe de 3 étudiants maximum )

* [Prénom Nom 1]
* [Prénom Nom 2]
* [Prénom Nom 3]

## Fonctionnalités du Langage

Notre langage analyse la syntaxe des éléments suivants :

* **Variables et affectations** : `ma_variable = 10;`
* **Opérations mathématiques** : `+`, `-`, `*`, `/` avec gestion des priorités et parenthèses.
* **Opérateurs de comparaison** : `==`, `>`, `<`
* **Structures conditionnelles** : `si (...) { ... }` et `si (...) { ... } sinon { ... }`
* **Boucles** : `tant_que (...) { ... }`
* **Affichage** : `afficher(...);`

## Prérequis

Pour compiler ce projet, vous devez avoir installé dans votre environnement :

* `flex`
* `bison`
* `gcc`

## Compilation

Ouvrez votre terminal dans le dossier du projet et exécutez ces commandes dans l'ordre :

1. Générer le code C de l'analyseur syntaxique (Bison) :
```bash
bison -d langage.y

```


2. Générer le code C de l'analyseur lexical (Flex) :
```bash
flex langage.l

```


3. Compiler le programme final :
```bash
gcc langage.tab.c lex.yy.c -o mon_analyseur

```



## Exécution

### Mode interactif

Sous Windows :

```cmd
mon_analyseur.exe

```

Sous Linux/Mac :

```bash
./mon_analyseur

```

Saisissez votre code, faites `Entrée` pour aller sur une nouvelle ligne, puis utilisez `Ctrl+Z` (Windows) ou `Ctrl+D` (Linux/Mac) suivi de `Entrée` pour lancer l'analyse.

### Mode fichier (Recommandé)

Créez un fichier texte contenant votre code source (ex: `test.txt`) et passez-le à l'analyseur :
Sous Windows :

```cmd
mon_analyseur.exe < test.txt

```

Sous Linux/Mac :

```bash
./mon_analyseur < test.txt

```