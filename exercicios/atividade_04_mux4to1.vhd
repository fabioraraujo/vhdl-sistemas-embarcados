-- atividade_04_mux4to1.vhd
-- Componente MUX 4:1 para reuso na atividade 4

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux4to1 IS
    PORT (
        D0, D1, D2, D3 : IN  std_logic;
        sel             : IN  std_logic_vector(1 DOWNTO 0);
        Y               : OUT std_logic
    );
END mux4to1;

ARCHITECTURE rtl OF mux4to1 IS
BEGIN
    WITH sel SELECT
        Y <= D0 WHEN "00",
             D1 WHEN "01",
             D2 WHEN "10",
             D3 WHEN OTHERS;
END rtl;
