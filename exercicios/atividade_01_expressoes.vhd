-- atividade_01_expressoes.vhd
-- Atividade 1: Expressoes Booleanas
-- Z = ((A OR B) AND C) AND D
-- S = (A AND B) OR (NOT C OR D)
-- R = (A OR C) AND (A OR B)

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY expressoes IS
    PORT (
        A, B, C, D : IN  std_logic;
        Z, S, R    : OUT std_logic
    );
END expressoes;

ARCHITECTURE rtl OF expressoes IS
BEGIN
    Z <= ((A OR B) AND C) AND D;
    S <= (A AND B) OR (NOT C OR D);
    R <= (A OR C) AND (A OR B);
END rtl;
