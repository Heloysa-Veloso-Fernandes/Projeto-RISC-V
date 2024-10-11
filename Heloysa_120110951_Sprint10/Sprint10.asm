# C�digo Assembly para a Sequ�ncia de Fibonacci com BNE, JAL e ORI:
# Inicializa os primeiros n�meros da sequ�ncia de Fibonacci
addi x0, zero, 0      # x0 = 0
ori x1, x0, 0         # x1 = 0 (primeiro n�mero Fibonacci)
ori x2, x0, 1         # x2 = 1 (segundo n�mero Fibonacci)

# Inicializa o contador
ori x6, x0, 0         # x6 = 0 (contador para o n�mero de itera��es)
ori x7, x0, 10        # x7 = 10 (limite para o contador, 10 n�meros)

# Inicializa o endere�o de mem�ria para armazenar os n�meros
ori x5, x0, 0xFF        # x5 = 0xFF (endere�o do display para mostrar o n�mero Fibonacci)

loop:
# Gera o pr�ximo n�mero da sequ�ncia de Fibonacci
add  x3, x1, x2       # x3 = x1 + x2 (pr�ximo n�mero Fibonacci)

# Envia o n�mero Fibonacci para o display (via endere�o 0xFF)
sb   x3, 0(x5)        # Armazena o valor de x3 no endere�o x5

# Atualiza os n�meros Fibonacci
add  x1, x2, x0       # x1 = x2 (atualiza o primeiro n�mero)
add  x2, x3, x0       # x2 = x3 (atualiza o segundo n�mero)

# Incrementa o contador
addi x6, x6, 1        # x6 = x6 + 1

# Verifica se o contador atingiu 10, caso contr�rio, volta para o loop
bne  x6, x7, loop     # Se x6 != 10, volta para o loop

# Reinicializa os valores para repetir o c�lculo
jal  x0, reset        # Salta para reset, para reiniciar a sequ�ncia

reset:
# Reinicializa os registradores e o contador para calcular novamente
ori x1, x0, 0         # x1 = 0 (primeiro n�mero Fibonacci)
ori x2, x0, 1         # x2 = 1 (segundo n�mero Fibonacci)
ori x6, x0, 0         # x6 = 0 (reinicializa o contador)
ori x5, x0, 0xFF        # x5 = 0xFF (endere�o inicial da mem�ria)

# Volta ao loop para reiniciar o c�lculo
jal  x0, loop         # Salta de volta para o in�cio do loop

end: # Fim do programa 
