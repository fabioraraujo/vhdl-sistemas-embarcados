-- 03_mux_4to1_with_select.vhd
-- MUX 4:1 usando WITH...SELECT (atribuicao concorrente)

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux_4to1_with_select IS
    PORT (
        D0, D1, D2, D3 : IN  std_logic;
        sel             : IN  std_logic_vector(1 DOWNTO 0);
        Y               : OUT std_logic
    );
END mux_4to1_with_select;

ARCHITECTURE concorrente OF mux_4to1_with_select IS
BEGIN
    WITH sel SELECT
        Y <= D0 WHEN "00",
             D1 WHEN "01",
             D2 WHEN "10",
             D3 WHEN OTHERS;
END concorrente;
