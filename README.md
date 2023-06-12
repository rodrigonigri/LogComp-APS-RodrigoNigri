# APS Lógica da Computação
## Feito por: Rodrigo Nigri Griner

# Proposta:
A proposta desse projeto é criar uma linguagem de programação com todas as estruturas básicas, como: variáveis, condicionais, laços de repetição, funções...

# Minha Linguagem:
A linguagem que eu criei se chama **צפת** (Sfat) que é uma cidade de Israel que meu bisavô nasceu e viveu grande parte da sua vida. Além disso, a palavra **שפה** (Safa, derivação do nome da cidade) significa Linguagem em hebraico.

Israel é reconhecido por sua excelência em tecnologia e inovação, dessa forma surgiu a ideia de criar uma linguagem de programação em hebraico.


# Tabela de elementos da linguagem:

| Elemento                           | Descrição                 |
|------------------------------------|---------------------------|
| **hedpes** [הדפס] (print)          | printa um valor na tela   |
| **likro** [לקרוא] (read)           | lê um valor do terminal   |
| **im** [אם] (if)                   | condicional               |
| **acher** [אחר] (else)             | condicional               |
| **bizman** [בזמן] (while)          | laço de repetição         |
| **functzia** [פונקציה] (function)  | declaração de função      |
| **lachzor** [לחזור] (return)       | retorna um valor          |
| **lo** [לא] (not)                  | operador lógico negação   |
| **ve** [ו] (and)                   | operador lógico and       |
| **oh** [או] (or)                   | operador lógico or        |

# Diagrama sintático:
<img src="diagrama sintatico.png" alt="diagrama sintatico"/>

# EBNF:
```
BLOCK = { STATEMENT } ;
STATEMENT = ( λ | ASSIGNMENT | TYPE | PRINT | WHILE | IF | FUNCTION | RETURN | CALLFUNC ), "\n" ;
ASSIGNMENT = IDENTIFIER, SETTING;
CREATING = TYPE, IDENTIFIER, [ "=", RELEXPR ] ;
TYPE = "int" | "string" ;
SETTING = "=", RELEXPR ;
PRINT = "hedpes", "(", RELEXPR, ")" ;
WHILE = "bizman", RELEXPR, "{" "\n", BLOCK, "}" ;
IF = "im", RELEXPR, "{", "\n", { STATEMENT }, "}", [ "acher", "{" "\n", BLOCK, "}" ], "}" ;
FUNCTION = "functzia", TYPE, IDENTIFIER, "("[PARAMETER], ")", "{" "\n", BLOCK, "}";
PARAMETER = TYPE, IDENTIFIER, { ",", TYPE, IDENTIFIER };
RETURN = "lachzor", RELEXPR;
CALLFUNC = IDENTIFIER, "(", [RELEXPR, {",", RELEXPR}] ,")";
RELEXPR = EXPRESSION, { ("==" | ">" | "<"), EXPRESSION }
EXPRESSION = TERM, { ("+" | "-" | "oh" | "."), TERM } ;
TERM = FACTOR, { ("*" | "/" | "ve"), FACTOR } ;
FACTOR = (("+" | "-" | "lo"), FACTOR) | NUMBER | STRING | "(", RELEXPR, ")" | IDENTIFIER, ["(", RELEXPR, {",", RELEXPR} ,")"] | ("likro", "(", ")") ;
IDENTIFIER = LETTER, { LETTER | DIGIT | "_" } ;
NUMBER = DIGIT, { DIGIT } ;
LETTER = ( a | ... | z | A | ... | Z ) ;
DIGIT = ( 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 ) ;
```

# Exemplos de código:
## Hello World:
```
hedpes("shalom olam!")
```

## if/else:
```
int a = 2

im a == 1{
    hedpes("a ze 1")
}acher{
    hedpes("a ze lo 1")
}
```

## while:
```
int a = 20
int i = 0

bizman i < a{
    hedpes(i)
    i = i + 1
}
```

## Função:
```
functzia int schum(int a, int b){ # schum = soma
    lachzor a+b
}

int x = schum(1,2)
hedpes(x)
hedpes(schum(3,4))
```

## Compilado das funcionalidades:
```
hedpes("a ze: ")
int a = likro()
hedpes("b ze: ")
int b = likro()

hedpes(a)
hedpes(b)

im (a == 1) {
    hedpes("a 1")
} acher {
    hedpes("a lo 1")
}

bizman (a < 10) {
    hedpes(a)
    a = a + 1
}

functzia int schum(int x, int y) {
    lachzor x + y
}

hedpes(schum(a, b))

im 1{
    hedpes("nachon")
}

im lo 0{
    hedpes("lo kozev")
}

im 0{
    hedpes("lo hedpes")
}acher{
    hedpes("hedpes")
}

im 1 ve 1 {
    hedpes("nachon ve nachon")
}
```

# Curiosidades:
No hebraico cada letra do alfabeto tem um valor numérico, então alef = 1, bet = 2, gimel = 3... depois iud = 10, caf = 20 lamed = 30... e assim por diante sendo a última letra tav = 400. Dessa forma, cada palavra tem um valor numérico que é a soma dos valores de cada letra. Por exemplo, a palavra שלום (shalom) tem o valor 376 (300 + 30 + 6 + 40). Dessa forma, o número 18 é considerado um número especial, pois é o valor da palavra חי (chai) que significa vida. Para honrar essa tradição, quando o número 18 é printado na tela, ele é substituído por "18 - חי".

# Como executar:
Para executar o programa é necessário ter o python instalado na máquina, após isso basta executar o arquivo main.py com o seguinte comando:
```
python main.py <nome do arquivo.sf>
```
