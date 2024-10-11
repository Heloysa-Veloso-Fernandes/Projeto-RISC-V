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
