%{
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  extern int yylex();
  void yyerror(const char *s) { printf("ERROR: %s\n", s); }
%}

%token ASSIGN
%token PLUS
%token MINUS
%token MULT
%token DIV
%token OPEN_PARENT
%token CLOSE_PARENT
%token OPEN_BRACE
%token CLOSE_BRACE
%token LESS_THAN
%token GREATER_THAN
%token EQUAL
%token COMMA
%token TYPE
%token PRINT
%token FUNCTION_CALL
%token FUNCTION_DECLARATION
%token RETURN
%token TRUE
%token FALSE
%token NOT
%token AND
%token OR
%token IF
%token ELSE
%token WHILE
%token STRING
%token INT
%token IDENTIFIER

%start program

%%
program: statement_list
       ;

block   : OPEN_BRACE statement_list CLOSE_BRACE
        | OPEN_BRACE CLOSE_BRACE
        ;

statement_list  : statement
                | statement_list statement
                ;

statement   : TYPE IDENTIFIER ASSIGN relexpression
            | IDENTIFIER ASSIGN relexpression
            | PRINT OPEN_PARENT print_list CLOSE_PARENT
            | IF OPEN_PARENT relexpression CLOSE_PARENT block
            | IF OPEN_PARENT relexpression CLOSE_PARENT block ELSE block
            | WHILE OPEN_PARENT relexpression CLOSE_PARENT block
            | FUNCTION_DECLARATION IDENTIFIER OPEN_PARENT parameter_list CLOSE_PARENT block
            | IDENTIFIER OPEN_PARENT parameter_list CLOSE_PARENT
            | RETURN relexpression
            ;

parameter_list  : IDENTIFIER
                | parameter_list COMMA IDENTIFIER
                ;

print_list      : relexpression
                | print_list COMMA relexpression
                ;

relexpression   : expression EQUAL expression
                | expression LESS_THAN expression
                | expression GREATER_THAN expression
                | expression
                ;

expression  : term PLUS term
            | term MINUS term
            | term OR term
            | term
            ;


term    : factor
        | term MULT factor
        | term DIV factor
        | term AND factor
        ;

factor  : INT
        | STRING
        | TRUE
        | FALSE
        | IDENTIFIER
        | PLUS factor
        | MINUS factor
        | NOT factor
        | OPEN_PARENT relexpression CLOSE_PARENT
        ;

%%

int main(void) {
  yyparse();
  return 0;
}
