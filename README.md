# Projeto RISC-V: Sequência de Fibonacci

Este repositório contém os arquivos base para o projeto da disciplina Laboratório de Arquitetura de Sistemas Digitais. O objetivo do projeto tem como foco a implementação de um processador RISC-V de ciclo único capaz de calcular a sequência de Fibonacci, uma série numérica em que cada termo é a soma dos dois anteriores, iniciando pelos valores 0 e 1.

## 📝 Fundamentação Teórica
A sequência de Fibonacci é uma sequência numérica em que cada termo a partir do terceiro é a soma dos dois antecessores. O primeiro termo da sequência de Fibonacci é o número 1 e o segundo termo também é o número 1. O terceiro termo é 2, pois 1+1=2. Já o quarto termo é 3, pois 1+2=3. E assim sucessivamente.

Estudos sugerem que essa sequência foi atribuída a Fibonacci por causa de uma situação/problema em um de seus livros sobre a reprodução de uma população de coelhos.

<p align="center">
  <img width="460" height="300" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/FibonacciRabbit.svg/340px-FibonacciRabbit.svg.png">
</p>

Sequência de Fibonacci = 1,1,2,3,5,8,13,21,34,55…

### 🔹 Fórmula de Fibonacci

Uma maneira de expressar cada um dos termos da sequência de Fibonacci é através de uma fórmula que atribui cada termo à soma dos dois anteriores, ou seja, o n -ésimo termo da sequência é igual à soma dos termos n-1 e n-2, para todo número n natural maior do que 2.

Logo, os termos da sequência de Fibonacci são dados de forma recursiva:

    𝐹𝑛 = 𝐹𝑛−1 + 𝐹𝑛−2

A fórmula da sequência de Fibonacci é a forma algébrica de dizer que um termo qualquer na sequência é a soma dos seus dois anteriores.

### 🔹 Números de Fibonacci

A seguinte tabela apresenta os 10 primeiros Números de Fibonacci, na base decimal, hexadecimal e na base binária.

| Ordem/Índice  | Número de Fibonacci (decimal) |  Número de Fibonacci (hexadecimal) | Número de Fibonacci (binário) |
| :---:         | :---:                         | :---:                              |  :---:                        |
| F1            | 0                             | 0                                  | 0                             |
| F2            | 1                             | 1                                  | 1                             |
| F3            | 1                             | 1                                  | 1                             |
| F4            | 2                             | 2                                  | 10                            |
| F5            | 3                             | 3                                  | 11                            |
| F6            | 5                             | 5                                  | 101                           |
| F7            | 8                             | 8                                  | 1000                          |
| F8            | 13                            | D                                  | 1101                          |
| F9            | 21                            | 15                                 | 10101                         |
| F10           | 34                            | 22                                 | 100010                        |

### 🔹 Aplicações da Sequência de Fibonacci

A sequência de Fibonacci tem uma ampla gama de aplicações em diversos campos, desde matemática pura até ciências aplicadas e até mesmo em aspectos estéticos e de design.

Muito interessante é que através do coeficiente de um número com o seu antecessor, obtém-se a constante com o valor aproximado de 1,618.

A sequência de Fibonacci é aplicada em análises financeiras e na informática, sido utilizada por Da Vinci, que chamou a sequência de Divina Proporção, para fazer desenhos perfeitos.

Na Biologia, a sequência descreve padrões de crescimento em plantas e animais. A arte, o design e a arquitetura se inspiram para criar desde obras de arte a construções. No campo da matemática e computação, ela contribui com aplicações na teoria dos números, estudos de sequências, algoritmos e ciência da computação.

## 📝 Instruções

A tabela abaixo mostra o status de implementação das instruções no projeto atual:

| #  | Instrução | Implementada | Testada | Funcionando |
| :---:  | :---: | :---: | :---: | :---: |
| 1  | ADD | ✅ | ✅ | ✅ |
| 2  | SUB | ✅ | ✅ | ✅ |
| 3  | AND | ✅ | ✅ | ✅ |
| 4  | OR | ✅ | ✅ | ✅ |
| 5  | XOR | ✅ | ✅ | ✅ |
| 6  | SLT | ✅ | ✅ | ✅ |
| 7  | ADDI | ✅ | ✅ | ✅ |
| 8  | LB | ✅ | ✅ | ✅ |
| 9  | SB | ✅ | ✅ | ✅ |
| 10  | BEQ | ✅ | ✅ | ✅ |

Para cumprir com os requisitos mínimos, foi implementado no módulo Control Unit mais 3 instruções: bne, jal e ori.

### 🔹 Instrução BNE (Branch if Not Equal)

A instrução BNE (Branch if Not Equal) em RISC-V é uma instrução de desvio condicional que faz o processador saltar para um novo endereço se dois registradores não forem iguais. Caso os valores dos dois registradores sejam diferentes, o PC (Program Counter) é atualizado com o endereço de destino do salto, que é calculado somando um deslocamento (offset) ao valor atual do PC.

Opcode: 1100011.

Funct3: 001.

A instrução BNE segue o formato Tipo - B em RISC-V:
    
    bne rs1, rs2, label
    
rs1: Registro fonte 1.

rs2: Registro fonte 2.

Label: Indica a localização de uma instrução.

No formato Tipo – B, as instruções são divididas em vários campos, como mostrado abaixo:

| 31:25  | 24:20 |  19:15 | 14:12| 11:7 | 6:0 |
| :---:  | :---: |  :---: | :---:| :---: | :---: |
| imm12,10:5  | rs2 |  rs1 | funct3 | imm4:1,11 | op |
| 7 bits  | 5 bits |  5 bits | 3 bits | 5 bits | 7 bits |

### 🔹 Instrução ORI (OR Immediate)

A instrução ORI (OR Immediate) em RISC-V é uma instrução do formato Tipo - I, que realiza uma operação lógica OR bit a bit entre o valor de um registrador e um valor imediato. O resultado é armazenado em um registrador de destino.

Opcode: 0010011.

Funct3: 110.

A instrução ORI tem a seguinte forma:

    ori rd, rs1, imm

rd: Registrador de destino, onde o resultado será armazenado.

rs1: Registrador fonte 1, cujo valor será usado na operação.

imm: Valor imediato de 12 bits, que será aplicado ao rs1 usando a operação lógica OR.

No formato Tipo – I, as instruções são divididas em vários campos, como mostrado abaixo:

| 31:20  | 19:15 | 14:12| 11:7 | 6:0 |
| :---:  | :---: |  :---: | :---:| :---: |
| imm11:0  | rs1 |  funct3 | rd | op |
| 12 bits  | 5 bits |  3 bits | 5 bits | 7 bits |

### 🔹 Instrução JAL (Jump and Link)

A instrução JAL (Jump and Link) em RISC-V é uma instrução usada para realizar um salto incondicional para um endereço especificado. Ao mesmo tempo, ela armazena o endereço de retorno (o endereço da instrução seguinte ao JAL) no registrador de destino. Isso permite que o programa retorne ao ponto de origem após a execução do salto, tornando a instrução útil para chamadas de função e sub-rotinas.

Opcode: 1101111.

A instrução JAL tem a seguinte forma:

    jal rd, label

rd: Registrador de destino, onde o resultado será armazenado.

label: Indica a localização de uma instrução.

No formato Tipo – J, as instruções são divididas em vários campos, como mostrado abaixo:

| 31:12  | 11:7 | 6:0|
| :---:  | :---: |  :---: |
| imm20,10:1,11,19:12  | rd |  op |
| 20 bits  | 5 bits |  7 bits |

## 📁 Estrutura do repositório

O repositório está organizado da seguinte forma:


## 📚 Recursos

Para iniciar o estudo do conjunto de instruções RISC-V, consulte:


## 📍 Descrição da Sprint 10

A Sprint 10 é dedicada a um projeto prático, proporcionando uma oportunidade excelente para a aplicação e expanção dos conhecimentos adquiridos em arquitetura de computadores. O documento com os requisitos da Sprint está anexado a esta atividade.

Esta Sprint será dividida em duas fases:

Na primeira etapa, foi respondido um questionário anexado no Classroom, e descrito em dois parágrafos o projeto que prentendiamos desenvolver para esta Sprint. No documento anexo, foi encontrado alguns exemplos e dicas que podem ser úteis.

A segunda etapa é a execução do projeto propriamente dito. Após a aprovação da proposta, foi implementado o projeto e feito um vídeo demonstrando e explicando o trabalho realizado durante a Sprint para que o professor possa avaliar.

Para o desenvolvimento do projeto, foi utilizado o Quartus. 


