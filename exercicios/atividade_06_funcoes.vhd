-- atividade_06_funcoes.vhd
-- Atividade 6: Funcoes concorrentes
-- S1 = (A OR B) AND C
-- S2 = (A AND B) OR C
-- Atribuicoes concorrentes (sem process)

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY funcoes IS
    PORT (
        A, B, C  : IN  std_logic;
        S1, S2   : OUT std_logic
    );
END funcoes;

ARCHITECTURE rtl OF funcoes IS
BEGIN
    S1 <= (A OR B) AND C;
    S2 <= (A AND B) OR C;
END rtl;
