# Código Assembly para a Sequência de Fibonacci com BNE, JAL e ORI:
# Inicializa os primeiros números da sequência de Fibonacci
addi x0, zero, 0      # x0 = 0
ori x1, x0, 0         # x1 = 0 (primeiro número Fibonacci)
ori x2, x0, 1         # x2 = 1 (segundo número Fibonacci)

# Inicializa o contador
ori x6, x0, 0         # x6 = 0 (contador para o número de iterações)
ori x7, x0, 10        # x7 = 10 (limite para o contador, 10 números)

# Inicializa o endereço de memória para armazenar os números
ori x5, x0, 0xFF        # x5 = 0xFF (endereço do display para mostrar o número Fibonacci)

loop:
# Gera o próximo número da sequência de Fibonacci
add  x3, x1, x2       # x3 = x1 + x2 (próximo número Fibonacci)

# Envia o número Fibonacci para o display (via endereço 0xFF)
sb   x3, 0(x5)        # Armazena o valor de x3 no endereço x5

# Atualiza os números Fibonacci
add  x1, x2, x0       # x1 = x2 (atualiza o primeiro número)
add  x2, x3, x0       # x2 = x3 (atualiza o segundo número)

# Incrementa o contador
addi x6, x6, 1        # x6 = x6 + 1

# Verifica se o contador atingiu 10, caso contrário, volta para o loop
bne  x6, x7, loop     # Se x6 != 10, volta para o loop

# Reinicializa os valores para repetir o cálculo
jal  x0, reset        # Salta para reset, para reiniciar a sequência

reset:
# Reinicializa os registradores e o contador para calcular novamente
ori x1, x0, 0         # x1 = 0 (primeiro número Fibonacci)
ori x2, x0, 1         # x2 = 1 (segundo número Fibonacci)
ori x6, x0, 0         # x6 = 0 (reinicializa o contador)
ori x5, x0, 0xFF        # x5 = 0xFF (endereço inicial da memória)

# Volta ao loop para reiniciar o cálculo
jal  x0, loop         # Salta de volta para o início do loop

end: # Fim do programa 
