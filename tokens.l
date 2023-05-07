%{
#include <stdio.h>
#include <stdlib.h>
#include "parser.tab.h"

int num_tokens = 0;
%}

%option noyywrap


/* rules */
%%
[ \t\n]                 ;
"="                     { printf("EQUALS: %s\n", yytext); num_tokens++; return ASSIGN;} /*ASSIGN*/
"+"                     { printf("PLUS: %s\n", yytext); num_tokens++; return PLUS; } /*PLUS*/
"-"                     { printf("MINUS: %s\n", yytext); num_tokens++; return MINUS; } /*MINUS*/
"*"                     { printf("MULT: %s\n", yytext); num_tokens++; return   MULT;} /*MULT*/
"/"                     { printf("DIV: %s\n", yytext); num_tokens++; return DIV; } /*DIV*/
"("                     { printf("OPEN_PARENT: %s\n", yytext); num_tokens++; return OPEN_PARENT; } /*OPEN_PARENT*/
")"                     { printf("CLOSE_PARENT: %s\n", yytext); num_tokens++; return CLOSE_PARENT;} /*CLOSE_PARENT*/
"{"                     { printf("OPEN_BRACE: %s\n", yytext); num_tokens++; return OPEN_BRACE;} /*OPEN_BRACE*/
"}"                     { printf("CLOSE_BRACE: %s\n", yytext); num_tokens++; return CLOSE_BRACE;} /*CLOSE_BRACE*/
"<"                     { printf("LESS_THAN: %s\n", yytext); num_tokens++; return LESS_THAN; } /*LESS_THAN*/
">"                     { printf("GREATER_THAN: %s\n", yytext); num_tokens++; return GREATER_THAN; } /*GREATER_THAN*/
"=="                    { printf("EQUAL: %s\n", yytext); num_tokens++; return EQUAL; } /*LESS_THAN_OR_EQUAL*/
","                     { printf("COMMA: %s\n", yytext); num_tokens++; return COMMA; } /*COMMA*/


int                     { printf("INT (TYPE): %s\n", yytext); num_tokens++; return TYPE;} /*TYPE*/
bool                    { printf("BOOL (TYPE): %s\n", yytext); num_tokens++; return TYPE;} /*TYPE*/
string                  { printf("STRING (TYPE): %s\n", yytext); num_tokens++; return TYPE;} /*TYPE*/
hedpes                  { printf("HEDPES (PRINT): %s\n", yytext); num_tokens++; return PRINT;} /*PRINT*/
functzia                { printf("FUNCTZIA (FUNCTION): %s\n", yytext); num_tokens++; return FUNCTION_DECLARATION;} /*FUNCTION*/
lachzor                 { printf("LACHZOR (RETURN): %s\n", yytext);num_tokens++; return RETURN;} /*RETURN*/
nachon                  { printf("NACHON (TRUE): %s\n", yytext); num_tokens++; return TRUE;} /*TRUE*/
kozev                   { printf("KOZEV (FALSE): %s\n", yytext); num_tokens++; return FALSE;} /*FALSE*/
lo                      { printf("LO (NOT): %s\n", yytext);num_tokens++; return NOT;} /*NOT*/
ve                      { printf("VE (AND): %s\n", yytext);num_tokens++; return AND;} /*AND*/
oh                      { printf("OH (OR): %s\n", yytext);num_tokens++; return OR;}  /*OR*/
im                      { printf("IM (IF): %s\n", yytext);num_tokens++; return IF;} /*IF*/
acher                   { printf("ACHER (ELSE): %s\n", yytext);num_tokens++; return ELSE;} /*ELSE*/
bizman                  { printf("BIZMAN (WHILE): %s\n", yytext);num_tokens++; return WHILE;} /*WHILE*/
\'([^\\\n]|(\\.))*\'    { printf("STRING: %s\n", yytext);num_tokens++; return STRING;} /*STRING*/
\"([^\\\n]|(\\.))*\"    { printf("STRING: %s\n", yytext);num_tokens++; return STRING;}   /*STRING*/
[0-9]+                  { printf("INT: %s\n", yytext);num_tokens++; return INT;} /*INT*/
[a-zA-Z_][a-zA-Z_0-9]*  { printf("IDENTIFIER: %s\n", yytext);num_tokens++; return IDENTIFIER;} /*IDENTIFIER*/

.                       { printf("unknown\n");num_tokens++; return 404;} /*UNKNOWN*/

%%

/* 
to test the lexer separately
int main(int argc, char **argv)
{
    
    while (1){
        yylex();

    }
    

    printf("Number of tokens: %d\n", num_tokens);

    return 0;
}
*/

