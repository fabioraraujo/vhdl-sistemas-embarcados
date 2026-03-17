# VHDL - Sistemas Embarcados 2026

**Disciplina:** Linguagem de Descricao de Hardware (VHDL)
**Professor:** Fabio Araujo — CESUPA

---

## Estrutura do Repositorio

```
scripts/
├── README.md                          -- Este arquivo
├── guia/
│   ├── README.md                      -- Guia completo de VHDL (teoria + exemplos)
│   ├── 01_porta_logica.vhd            -- Descricao estrutural (AND, OR, NOT)
│   ├── 02_porta_logica_comportamental.vhd  -- Descricao comportamental
│   ├── 03_mux_4to1_with_select.vhd    -- MUX 4:1 com WITH...SELECT
│   ├── 04_mux_4to1_when_else.vhd      -- MUX 4:1 com WHEN...ELSE
│   ├── 05_mux_2to1_process.vhd        -- MUX 2:1 com PROCESS
│   ├── 06_componentes_aoi.vhd         -- Declaracao de componentes (AOI)
│   ├── 07_reg_sincrono.vhd            -- Registrador sincrono
│   ├── 08_reg_assincrono.vhd          -- Registrador assincrono
│   └── 09_flip_flop_d.vhd             -- Flip-Flop D (3 formas)
├── exercicios/
│   ├── README.md                      -- Indice e enunciados das atividades
│   ├── atividade_01_expressoes.vhd    -- Expressoes booleanas
│   ├── atividade_02_controle.vhd      -- Controle de passagem
│   ├── atividade_03_comparador.vhd    -- Comparador 4 bits
│   ├── atividade_04_mux4to1.vhd       -- Componente MUX 4:1
│   ├── atividade_04_mux16to1.vhd      -- MUX 16:1 hierarquico
│   ├── atividade_05_flipflop_d.vhd    -- Componente Flip-Flop D
│   ├── atividade_05_reg2bits.vhd      -- Registrador 2 bits
│   ├── atividade_06_funcoes.vhd       -- Funcoes concorrentes
│   ├── atividade_07_7seg.vhd          -- Decodificador 7 segmentos
│   ├── atividade_08_somador1bit.vhd   -- Somador completo 1 bit
│   ├── atividade_08_somador4bits.vhd  -- Somador 4 bits
│   ├── atividade_09_demux.vhd         -- Demultiplexador 1:8
│   ├── atividade_10_portand.vhd       -- Componente porta AND
│   ├── atividade_10_latchd.vhd        -- Componente Latch D
│   ├── atividade_10_latchen.vhd       -- LatchEn
│   ├── atividade_11_portand3.vhd      -- Componente AND 3 entradas
│   └── atividade_11_unidade_a.vhd     -- Unidade_A
```

## Guia de VHDL

O [guia/](guia/) contem um guia completo de VHDL com teoria e 9 exemplos praticos cobrindo:

1. O que e VHDL e sua historia
2. Niveis de abstracao
3. Estrutura de um projeto (Library, Entity, Architecture)
4. Descricao estrutural vs comportamental
5. Aspectos gerais da linguagem
6. Operadores logicos
7. Tipos de dados (std_logic, std_logic_vector)
8. Condicionais (WITH...SELECT, WHEN...ELSE, IF-THEN-ELSE)
9. Declaracao de componentes e PORT MAP
10. Circuitos sincronos e assincronos
11. Flip-Flop D

## Exercicios Resolvidos

O [exercicios/](exercicios/) contem a resolucao das 11 atividades praticas da disciplina:

| # | Atividade | Conceitos Principais |
|---|-----------|---------------------|
| 1 | Expressoes Booleanas | Operadores logicos |
| 2 | Controle de Passagem | PROCESS, IF |
| 3 | Comparador 4 bits | std_logic_vector, comparacao |
| 4 | MUX 16:1 | Hierarquia de componentes |
| 5 | Registrador 2 bits | Reuso de Flip-Flop D |
| 6 | Funcoes concorrentes | Atribuicao concorrente |
| 7 | Decodificador 7 segmentos | WITH...SELECT |
| 8 | Somador 4 bits | Ripple carry adder |
| 9 | Demultiplexador 1:8 | CASE |
| 10 | LatchEn | Reuso de componentes |
| 11 | Unidade_A | AND de 3 entradas |
