-- 04_mux_4to1_when_else.vhd
-- MUX 4:1 usando WHEN...ELSE (atribuicao condicional concorrente)

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux_4to1_when_else IS
    PORT (
        D0, D1, D2, D3 : IN  std_logic;
        sel             : IN  std_logic_vector(1 DOWNTO 0);
        Y               : OUT std_logic
    );
END mux_4to1_when_else;

ARCHITECTURE concorrente OF mux_4to1_when_else IS
BEGIN
    Y <= D0 WHEN sel = "00" ELSE
         D1 WHEN sel = "01" ELSE
         D2 WHEN sel = "10" ELSE
         D3;
END concorrente;
