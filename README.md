https://www.coursera.org/learn/build-a-computer/

https://www.nand2tetris.org/project01

```
x and y == y and x // commutative law 
x and (y and z) == (x and y) and z // associative law 
(x and y) or z == (x or z) and (y or z) // distributive law 
not (x and y) == (not x) or (not Y) // de Morgan law 
not (x or y) ==(not x) and (not y) // de Morgan law 
x and x == x // idempotance law 
not not x == x // double negation law 


any boolean function can be represented using an expression containing AND and NOT operations
(x OR y) = NOT(NOT(x) AND NOT(y))

nand
00 1
01 1
10 1
11 0

x nand y == not(x and y)
x nand x == not(x)
not(x nand y) == (x and y)

logic gate (chip)
  elementary
  composite

hdl - hardware description language
```


```
symbol
  variable
    @i
    M=1 // i=1
  label (destination of goto command)
    (LOOP)
     ...
    @LOOP
  pre-defined symbols ( @R0-@R15, @SCREEN, @KBD - virtual registers, screen, keyboard)


symbol table
sym      instuction_number
----------
LOOP     4

build the table:
  init - pre defined (1..15, SCR, KBD )
  first pass - labels (instruction number)
  second pass - variables (starting 16)
  
````


```
parsing command - (break into components)
translating command into machine code

```
