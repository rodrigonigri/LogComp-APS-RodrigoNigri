# APS Lógica da Computação
## Feito por: Rodrgo Nigri Griner

# Proposta:
A proposta desse projeto é criar uma linguagem de programação com todas as estruturas básicas, como: variáveis, condicionais, laços de repetição, funções...

# Minha Linguagem:
A linguagem que eu criei se chama **צפת** (Tzfat ou Sefat) que é uma cidade de Israel que meu bisavô nasceu e viveu grande parte da sua vida. Além disso, a palavra **שפה** (Safa, derivação do nome da cidade) significa Linguagem em hebraico.

Ela é baseada na linguagem python, mas com algumas diferenças, como por exemplo, a utilização das chaves para abrir e fechar blocos de código ao invés de indentação.

# Tabela de elementos da linguagem:

| Elemento              | Descrição                 |
|-----------------------|---------------------------|
| hedpes (print)        | printa um valor na tela   |
| im (if)               | condicional               |
| acher (else)          | condicional               |
| acher im (else if)    | condicional               |
| bizman (while)        | laço de repetição         |
| functzia (function)   | declaração de função      |
| lachzor (return)      | retorna um valor          |
| nachon (true)         | valor booleano verdadeiro |
| kozev (false)         | valor booleano falso      |
| lo (not)              | operador lógico negação   |
| ve (and)              | operador lógico and       |
| oh (or)               | operador lógico or        |



# EBNF:
```
BLOCK = "{",  {COMMAND}, "}";
COMMAND = ASSIGN | PRINT | BLOCK | WHILE | IF

ASSIGN = IDENTIFIER, "=", OREXPR;
PRINT = "hedpes", "(", OREXPR, ")";
WHILE = "bizman", "(", OREXPR, ")", COMMAND;
IF = "im", "(", OREXPR, ")", COMMAND |
     "im", "(", OREXPR, ")", COMMAND, "acher", COMMAND;

OREXPR = ANDEXPR, {"oh", ANDEXPR};
ANDEXPR = EQEXPR, {"ve", EQEXPR};
EQEXPR = RELEXPR, {"==", RELEXPR};
RELEXPR = EXPRESSION, {(">" | "<"), EXPRESSION};
EXPRESSION = TERM, {("+" | "-"), TERM} ;
TERM = FACTOR, {("*" | "/"), FACTOR} ;
FACTOR = ("+" | "-", "lo"), FACTOR | "(", OREXPR, ")" | NUMBER | IDENTIFIER | STRING | BOOLEAN;

IDENTIFIER = VTYPE, ALPHACHAR, {CHAR};

NUMBER = DIGIT, {DIGIT} ;
DIGIT = 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9;

BOOLEAN = "nachon" | "kozev";

STRING = """, {CHAR | SPACE}, """; 

CHAR = ALPHACHAR | DIGIT | "_";
ALPHACHAR = "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" ;
SPACE = " ";

VTYPE = "int" | "bool" | "string";
```
