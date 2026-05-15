# Exercicios Resolvidos - VHDL

**Disciplina:** Linguagem de Descricao de Hardware (VHDL)
**Professor:** Fabio Araujo — CESUPA, Sistemas Embarcados 2026

---

## Indice

| # | Atividade | Arquivos | Conceitos |
|---|-----------|----------|-----------|
| 1 | [Expressoes Booleanas](#atividade-1---expressoes-booleanas) | `atividade_01_expressoes.vhd` | Operadores logicos, atribuicao concorrente |
| 2 | [Controle de Passagem](#atividade-2---controle-de-passagem) | `atividade_02_controle.vhd` | PROCESS, IF-THEN-ELSE |
| 3 | [Comparador 4 bits](#atividade-3---comparador-4-bits) | `atividade_03_comparador.vhd` | std_logic_vector, IF-ELSIF-ELSE |
| 4 | [MUX 16:1](#atividade-4---mux-161) | `atividade_04_mux16to1.vhd`, `atividade_04_mux4to1.vhd` | COMPONENT, PORT MAP, hierarquia |
| 5 | [Registrador 2 bits](#atividade-5---registrador-2-bits) | `atividade_05_reg2bits.vhd`, `atividade_05_flipflop_d.vhd` | COMPONENT, PORT MAP, Flip-Flop D |
| 6 | [Funcoes concorrentes](#atividade-6---funcoes-concorrentes) | `atividade_06_funcoes.vhd` | Atribuicao concorrente |
| 7 | [Decodificador 7 segmentos](#atividade-7---decodificador-7-segmentos) | `atividade_07_7seg.vhd` | WITH...SELECT, tabela verdade |
| 8 | [Somador 4 bits](#atividade-8---somador-4-bits) | `atividade_08_somador4bits.vhd`, `atividade_08_somador1bit.vhd` | COMPONENT, ripple carry |
| 9 | [Demultiplexador 1:8](#atividade-9---demultiplexador-18) | `atividade_09_demux.vhd` | CASE, PROCESS |
| 10 | [LatchEn](#atividade-10---latchen) | `atividade_10_latchen.vhd`, `atividade_10_portand.vhd`, `atividade_10_latchd.vhd` | COMPONENT, Latch D |
| 11 | [Unidade_A](#atividade-11---unidade_a) | `atividade_11_unidade_a.vhd`, `atividade_11_portand3.vhd` | COMPONENT, sinais internos |
| 12 | [PWM em LED](#atividade-12---pwm-em-led) | `atividade_12_pwm_led.vhd` | PWM, contador, numeric_std, WITH...SELECT |
| 13 | [PWM Servo Motor](#atividade-13---pwm-servo-motor) | `atividade_13_pwm_servo.vhd` | PWM 50 Hz, aritmetica com unsigned |

---

## Atividade 1 - Expressoes Booleanas

**Enunciado:** Implementar as seguintes expressoes booleanas em VHDL:
- `Z = ((A OR B) AND C) AND D`
- `S = (A AND B) OR (NOT C OR D)`
- `R = (A OR C) AND (A OR B)`

**Entradas:** A, B, C, D (std_logic)
**Saidas:** Z, S, R (std_logic)
**Tecnica:** Atribuicoes concorrentes com operadores logicos.

---

## Atividade 2 - Controle de Passagem

**Enunciado:** Implementar um circuito onde a saida recebe o sinal A quando B='0' e C='1'. Caso contrario, a saida e '0'.

**Entradas:** A, B, C (std_logic)
**Saida:** Saida (std_logic)
**Tecnica:** PROCESS com IF-THEN-ELSE.

---

## Atividade 3 - Comparador 4 bits

**Enunciado:** Implementar um comparador de 4 bits que indica se A=B, A>B ou A<B.

**Entradas:** A, B (std_logic_vector 3 downto 0)
**Saidas:** AigualB, AmaiorB, AmenorB (std_logic)
**Tecnica:** PROCESS com IF-ELSIF-ELSE, uso de std_logic_unsigned.

---

## Atividade 4 - MUX 16:1

**Enunciado:** Implementar um multiplexador 16:1 reutilizando o componente MUX 4:1. Arquitetura hierarquica com 5 instancias de MUX 4:1 (4 no primeiro nivel + 1 no segundo nivel).

**Entradas:** D0..D15 (std_logic), sel (std_logic_vector 3 downto 0)
**Saida:** Y (std_logic)
**Tecnica:** COMPONENT, PORT MAP, design hierarquico.

**Arquivos:**
- `atividade_04_mux4to1.vhd` — componente MUX 4:1
- `atividade_04_mux16to1.vhd` — MUX 16:1 usando 5x MUX 4:1

---

## Atividade 5 - Registrador 2 bits

**Enunciado:** Implementar um registrador de 2 bits reutilizando o componente Flip-Flop D. Duas instancias com port map.

**Entradas:** clk (std_logic), d (std_logic_vector 1 downto 0)
**Saida:** q (std_logic_vector 1 downto 0)
**Tecnica:** COMPONENT, PORT MAP, instanciacao de Flip-Flop D.

**Arquivos:**
- `atividade_05_flipflop_d.vhd` — componente Flip-Flop D
- `atividade_05_reg2bits.vhd` — registrador 2 bits

---

## Atividade 6 - Funcoes concorrentes

**Enunciado:** Implementar duas funcoes logicas concorrentes:
- `S1 = (A OR B) AND C`
- `S2 = (A AND B) OR C`

**Entradas:** A, B, C (std_logic)
**Saidas:** S1, S2 (std_logic)
**Tecnica:** Atribuicoes concorrentes (sem PROCESS).

---

## Atividade 7 - Decodificador 7 segmentos

**Enunciado:** Implementar um decodificador de 7 segmentos para display hexadecimal (0-F).

**Entrada:** D (std_logic_vector 3 downto 0)
**Saida:** seg (std_logic_vector 6 downto 0) — segmentos a, b, c, d, e, f, g
**Tecnica:** WITH...SELECT com tabela verdade completa (16 valores).

---

## Atividade 8 - Somador 4 bits

**Enunciado:** Implementar um somador completo de 4 bits reutilizando o somador de 1 bit. Quatro instancias encadeadas (ripple carry adder).

**Entradas:** A, B (std_logic_vector 3 downto 0), Cin (std_logic)
**Saidas:** S (std_logic_vector 3 downto 0), Cout (std_logic)
**Tecnica:** COMPONENT, PORT MAP, carry chain.

**Arquivos:**
- `atividade_08_somador1bit.vhd` — somador completo de 1 bit
- `atividade_08_somador4bits.vhd` — somador 4 bits (4 instancias)

---

## Atividade 9 - Demultiplexador 1:8

**Enunciado:** Implementar um demultiplexador 1:8 com 1 entrada de dado, 3 bits de selecao e 8 saidas.

**Entradas:** D (std_logic), sel (std_logic_vector 2 downto 0)
**Saidas:** Y (std_logic_vector 7 downto 0)
**Tecnica:** PROCESS com CASE.

---

## Atividade 10 - LatchEn

**Enunciado:** Implementar um Latch com Enable (LatchEn) reutilizando os componentes porta AND e Latch D.
- PortaE: Clk AND En -> Cint
- LatchD: D=Din, Clk=Cint -> Qout

**Entradas:** Din, Clk, En (std_logic)
**Saida:** Qout (std_logic)
**Tecnica:** COMPONENT, PORT MAP, design hierarquico.

**Arquivos:**
- `atividade_10_portand.vhd` — porta AND 2 entradas
- `atividade_10_latchd.vhd` — Latch D
- `atividade_10_latchen.vhd` — LatchEn (reutiliza os dois componentes)

---

## Atividade 11 - Unidade_A

**Enunciado:** Implementar a Unidade_A que utiliza o componente portand_3 (AND de 3 entradas):
- G1: portand_3(a, b, c) -> g
- G2: portand_3(c, d, e) -> X1 (sinal interno)
- f = g OR X1

**Entradas:** a, b, c, d, e (std_logic)
**Saidas:** f, g (std_logic)
**Tecnica:** COMPONENT, PORT MAP, sinais internos.

**Arquivos:**
- `atividade_11_portand3.vhd` — porta AND de 3 entradas
- `atividade_11_unidade_a.vhd` — Unidade_A

---

## Atividade 12 - PWM em LED

**Enunciado:** Implementar um modulo PWM (Pulse Width Modulation) que controla o brilho de um LED. O nivel de brilho e selecionado por 2 chaves (sel), com 4 niveis pre-definidos:

| sel  | Duty cycle | Brilho       |
|------|-----------:|--------------|
| "00" |       0%   | Apagado      |
| "01" |      25%   | Baixo        |
| "10" |      50%   | Medio        |
| "11" |      75%   | Alto         |

**Entradas:** clk, rst, sel (2 bits)
**Saida:** led (std_logic)
**Tecnica:** contador livre de 8 bits, comparacao com duty, WITH...SELECT, pacote `numeric_std`.

**Arquivo:** `atividade_12_pwm_led.vhd`

---

## Atividade 13 - PWM Servo Motor

**Enunciado:** Gerar um sinal PWM padrao para servo motores hobby:
- Periodo de 20 ms (50 Hz)
- Largura de pulso entre 1 ms (0 graus) e 2 ms (180 graus)
- Posicao discreta selecionada por 3 chaves (8 posicoes)

Considerando clock de 50 MHz:
- Periodo = 1.000.000 ciclos (contador de 20 bits)
- Pulso minimo (1 ms) = 50.000 ciclos
- Pulso maximo (2 ms) = 100.000 ciclos
- Passo entre posicoes ~= 7.143 ciclos

**Entradas:** clk, rst, pos (3 bits, 0 a 7)
**Saida:** servo (std_logic)
**Tecnica:** contador com reset no fim do periodo, aritmetica `unsigned`, multiplicacao por constante.

**Arquivo:** `atividade_13_pwm_servo.vhd`
