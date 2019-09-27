https://www.coursera.org/learn/build-a-computer/

x and y == y and x // commutative law 
x and (y and z) == (x and y) and z // associative law 
(x and y) or z == (x or z) and (y or z) // distributive law 
not (x and y) == (not x) or (not Y) // de Morgan law 
not (x or y) ==(not x) and (not y) // de Morgan law 
x and x == x // idempotance law 
not not x == x // double negation law 
25.09.2019 19:06:54
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

