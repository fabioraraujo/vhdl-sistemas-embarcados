# Guia Completo de VHDL

**Disciplina:** Linguagem de Descricao de Hardware (VHDL)
**Professor:** Fabio Araujo — CESUPA, Sistemas Embarcados 2026

---

## 1. O que e VHDL

VHDL significa **VHSIC Hardware Description Language** (VHSIC = Very High Speed Integrated Circuit). Foi desenvolvida nos anos 80 pelo Departamento de Defesa dos Estados Unidos (DoD) para documentar e simular circuitos integrados. Em 1987 foi padronizada pelo IEEE (IEEE 1076-1987) e desde entao e amplamente utilizada para:

- Descricao de circuitos digitais
- Simulacao de hardware
- Sintese em FPGAs e ASICs

VHDL permite descrever o **comportamento** e a **estrutura** de sistemas digitais em diferentes niveis de abstracao.

---

## 2. Niveis de Abstracao

Do mais abstrato ao mais concreto:

| Nivel | Descricao |
|-------|-----------|
| **Ideia** | Conceito funcional do sistema |
| **Algoritmo** | Sequencia de operacoes para resolver o problema |
| **Arquitetura** | Estrutura de blocos e interconexoes |
| **RTL (Register Transfer Level)** | Transferencia entre registradores, operacoes por ciclo de clock |
| **Portas Logicas** | Descricao em termos de AND, OR, NOT, etc. |

---

## 3. Estrutura de um Projeto VHDL

Todo projeto VHDL e composto por tres partes fundamentais:

### 3.1 Cabecalho (Library / Use)

```vhdl
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
```

- `LIBRARY` declara a biblioteca a ser utilizada.
- `USE` importa pacotes especificos da biblioteca.
- `ieee.std_logic_1164` e o pacote mais comum, define os tipos `std_logic` e `std_logic_vector`.

### 3.2 Entidade (Entity)

Define a **interface externa** do circuito (entradas e saidas):

```vhdl
ENTITY nome_entidade IS
    PORT (
        entrada1 : IN  std_logic;
        entrada2 : IN  std_logic;
        saida1   : OUT std_logic
    );
END nome_entidade;
```

### 3.3 Arquitetura (Architecture)

Define o **comportamento interno** ou a **estrutura** do circuito:

```vhdl
ARCHITECTURE nome_arch OF nome_entidade IS
BEGIN
    -- descricao do circuito
END nome_arch;
```

---

## 4. Descricao Estrutural vs Comportamental

### Descricao Estrutural

Descreve o circuito como uma **interconexao de componentes** (portas logicas, blocos). E como desenhar o esquematico.

```vhdl
-- Exemplo: Z = (A AND B) OR C
ARCHITECTURE estrutural OF circuito IS
    SIGNAL s1 : std_logic;
BEGIN
    s1 <= A AND B;
    Z  <= s1 OR C;
END estrutural;
```

> Veja o exemplo completo em [01_porta_logica.vhd](01_porta_logica.vhd)

### Descricao Comportamental

Descreve **o que o circuito faz**, sem detalhar como e montado internamente. Usa construcoes como `PROCESS`, `IF`, `CASE`.

```vhdl
-- Exemplo: mesmo circuito Z = (A AND B) OR C
ARCHITECTURE comportamental OF circuito IS
BEGIN
    PROCESS(A, B, C)
    BEGIN
        IF (A = '1' AND B = '1') THEN
            Z <= '1';
        ELSIF C = '1' THEN
            Z <= '1';
        ELSE
            Z <= '0';
        END IF;
    END PROCESS;
END comportamental;
```

> Veja o exemplo completo em [02_porta_logica_comportamental.vhd](02_porta_logica_comportamental.vhd)

---

## 5. Aspectos Gerais

- **Case insensitive**: `ENTITY`, `entity` e `Entity` sao equivalentes.
- **Concorrente**: comandos fora de `PROCESS` executam **simultaneamente** (paralelo).
- **Sequencial**: comandos dentro de `PROCESS` executam **em ordem**.
- **Hierarquia**: circuitos complexos sao construidos instanciando componentes menores.
- **Comentarios**: iniciam com `--` (dois hifens).

---

## 6. Operadores Logicos

| Operador | Descricao | Exemplo |
|----------|-----------|---------|
| `AND`    | E logico | `Z <= A AND B;` |
| `OR`     | OU logico | `Z <= A OR B;` |
| `NOT`    | Inversao | `Z <= NOT A;` |
| `NAND`   | E invertido | `Z <= A NAND B;` |
| `NOR`    | OU invertido | `Z <= A NOR B;` |
| `XOR`    | OU exclusivo | `Z <= A XOR B;` |
| `XNOR`   | OU exclusivo invertido | `Z <= A XNOR B;` |

Prioridade: `NOT` > `AND` > `OR` (use parenteses para clareza).

---

## 7. Tipos de Dados

### std_logic (1 bit)

Valores possiveis: `'0'`, `'1'`, `'Z'` (alta impedancia), `'-'` (don't care), entre outros.

```vhdl
SIGNAL a : std_logic;
```

### std_logic_vector (vetor de bits)

```vhdl
SIGNAL barramento : std_logic_vector(7 DOWNTO 0);  -- 8 bits
SIGNAL dados      : std_logic_vector(3 DOWNTO 0);  -- 4 bits
```

- `DOWNTO`: bit mais significativo a esquerda (mais comum).
- `TO`: bit menos significativo a esquerda.

### bit e bit_vector

Tipos mais simples, aceitam apenas `'0'` e `'1'`. Menos utilizados que `std_logic`.

```vhdl
SIGNAL x : bit;
SIGNAL y : bit_vector(3 DOWNTO 0);
```

---

## 8. Condicionais

### 8.1 WITH...SELECT (Concurrent)

Selecao concorrente — funciona como um multiplexador ou `CASE` concorrente.

```vhdl
WITH sel SELECT
    saida <= entrada0 WHEN "00",
             entrada1 WHEN "01",
             entrada2 WHEN "10",
             entrada3 WHEN OTHERS;
```

> Veja o exemplo completo em [03_mux_4to1_with_select.vhd](03_mux_4to1_with_select.vhd)

### 8.2 WHEN...ELSE (Concurrent)

Atribuicao condicional concorrente — funciona como um `IF` fora de `PROCESS`.

```vhdl
saida <= entrada0 WHEN sel = "00" ELSE
         entrada1 WHEN sel = "01" ELSE
         entrada2 WHEN sel = "10" ELSE
         entrada3;
```

> Veja o exemplo completo em [04_mux_4to1_when_else.vhd](04_mux_4to1_when_else.vhd)

### 8.3 IF-THEN-ELSE (Sequential — dentro de PROCESS)

```vhdl
PROCESS(sel, a, b)
BEGIN
    IF sel = '0' THEN
        saida <= a;
    ELSE
        saida <= b;
    END IF;
END PROCESS;
```

> Veja o exemplo completo em [05_mux_2to1_process.vhd](05_mux_2to1_process.vhd)

---

## 9. Declaracao de Componentes

Componentes permitem **reutilizar** entidades dentro de outras arquiteturas.

### Declaracao

```vhdl
COMPONENT nome_componente IS
    PORT (
        a : IN  std_logic;
        b : OUT std_logic
    );
END COMPONENT;
```

### Instanciacao (PORT MAP)

```vhdl
instancia1: nome_componente PORT MAP (
    a => sinal_entrada,
    b => sinal_saida
);
```

> Veja o exemplo completo em [06_componentes_aoi.vhd](06_componentes_aoi.vhd)

---

## 10. Sincrono e Assincrono

### Circuito Sincrono (sensivel a borda do clock)

Utiliza o atributo `EVENT` para detectar transicoes:

```vhdl
PROCESS(clk)
BEGIN
    IF clk'EVENT AND clk = '1' THEN  -- borda de subida
        q <= d;
    END IF;
END PROCESS;
```

Alternativa com `rising_edge`:
```vhdl
IF rising_edge(clk) THEN
    q <= d;
END IF;
```

> Veja o exemplo completo em [07_reg_sincrono.vhd](07_reg_sincrono.vhd)

### Circuito Assincrono (sensivel a nivel ou reset assincrono)

```vhdl
PROCESS(clk, rst)
BEGIN
    IF rst = '1' THEN
        q <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
        q <= d;
    END IF;
END PROCESS;
```

> Veja o exemplo completo em [08_reg_assincrono.vhd](08_reg_assincrono.vhd)

---

## 11. Flip-Flop D

O Flip-Flop D e o elemento de memoria mais basico. Pode ser descrito de varias formas:

### Com WAIT UNTIL

```vhdl
PROCESS
BEGIN
    WAIT UNTIL clk'EVENT AND clk = '1';
    q <= d;
END PROCESS;
```

### Com WHEN ELSE (concurrent)

```vhdl
q <= d WHEN (clk'EVENT AND clk = '1') ELSE q;
```

### Com BLOCK (guarded)

```vhdl
bloco: BLOCK (clk'EVENT AND clk = '1')
BEGIN
    q <= GUARDED d;
END BLOCK bloco;
```

> Veja o exemplo completo em [09_flip_flop_d.vhd](09_flip_flop_d.vhd)

---

## 12. PWM (Pulse Width Modulation)

**PWM** e uma tecnica que codifica informacao analogica em um sinal digital atraves da variacao da largura de pulso. O sinal alterna entre '1' e '0' com periodo fixo, e o tempo em '1' (largura de pulso) define o valor medio do sinal.

### 12.1 Conceitos

- **Periodo (T):** duracao de um ciclo completo do sinal.
- **Frequencia (f):** f = 1 / T.
- **Largura de pulso (Ton):** tempo em que o sinal fica em '1'.
- **Duty cycle:** D = Ton / T, expresso em porcentagem (0% a 100%).
- **Valor medio:** Vmedio = D x Vcc.

### 12.2 Aplicacoes

- Controle de brilho de LEDs.
- Controle de velocidade de motores DC.
- Controle de posicao de servo motores.
- Conversao D/A (com filtro RC passa-baixa).
- Geracao de audio simples.

### 12.3 Implementacao em VHDL

A forma mais comum e usar um **contador livre** comparado com um valor de **duty**:

```vhdl
PROCESS(clk)
BEGIN
    IF rising_edge(clk) THEN
        contador <= contador + 1;
    END IF;
END PROCESS;

pwm_out <= '1' WHEN contador < duty ELSE '0';
```

- A **resolucao** do PWM e dada pela largura do contador. Um contador de N bits fornece 2^N niveis de duty.
- A **frequencia** do PWM e: f_pwm = f_clk / 2^N.

Exemplo: clock de 50 MHz e contador de 8 bits -> f_pwm = 50.000.000 / 256 ~ 195 kHz.

### 12.4 Tipos numericos: numeric_std

Para contadores e operacoes aritmeticas, use o pacote `ieee.numeric_std`:

```vhdl
USE ieee.numeric_std.ALL;

SIGNAL cnt : unsigned(7 DOWNTO 0);
cnt <= cnt + 1;                          -- soma direta
cnt <= to_unsigned(64, 8);               -- conversao de inteiro
saida <= '1' WHEN cnt < unsigned(duty) ELSE '0';
```

> Veja os exemplos em [10_pwm_basico.vhd](10_pwm_basico.vhd) e [11_pwm_duty_variavel.vhd](11_pwm_duty_variavel.vhd).

---

## Exemplos do Guia

| Arquivo | Descricao |
|---------|-----------|
| [01_porta_logica.vhd](01_porta_logica.vhd) | Descricao estrutural (AND, OR, NOT) |
| [02_porta_logica_comportamental.vhd](02_porta_logica_comportamental.vhd) | Mesmo circuito, descricao comportamental |
| [03_mux_4to1_with_select.vhd](03_mux_4to1_with_select.vhd) | MUX 4:1 com WITH...SELECT |
| [04_mux_4to1_when_else.vhd](04_mux_4to1_when_else.vhd) | MUX 4:1 com WHEN...ELSE |
| [05_mux_2to1_process.vhd](05_mux_2to1_process.vhd) | MUX 2:1 com IF-THEN-ELSE (PROCESS) |
| [06_componentes_aoi.vhd](06_componentes_aoi.vhd) | Declaracao de componentes (Unidade_AOI) |
| [07_reg_sincrono.vhd](07_reg_sincrono.vhd) | Registrador sincrono (borda de subida) |
| [08_reg_assincrono.vhd](08_reg_assincrono.vhd) | Registrador assincrono |
| [09_flip_flop_d.vhd](09_flip_flop_d.vhd) | Flip-Flop D (wait until, when else, block) |
| [10_pwm_basico.vhd](10_pwm_basico.vhd) | PWM basico com duty cycle fixo (25%) |
| [11_pwm_duty_variavel.vhd](11_pwm_duty_variavel.vhd) | PWM com duty cycle variavel via entrada |
