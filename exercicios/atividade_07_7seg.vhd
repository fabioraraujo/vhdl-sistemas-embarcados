-- atividade_07_7seg.vhd
-- Atividade 7: Decodificador 7 segmentos (hexadecimal)
-- 4 bits de entrada (D3..D0), 7 saidas (a..g)
-- Segmentos ativos em '1' (anodo comum invertido ou catodo comum)
--
--    aaa
--   f   b
--    ggg
--   e   c
--    ddd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY decodificador_7seg IS
    PORT (
        D    : IN  std_logic_vector(3 DOWNTO 0);
        seg  : OUT std_logic_vector(6 DOWNTO 0)  -- seg = "abcdefg"
    );
END decodificador_7seg;

ARCHITECTURE rtl OF decodificador_7seg IS
BEGIN
    -- seg(6)=a, seg(5)=b, seg(4)=c, seg(3)=d, seg(2)=e, seg(1)=f, seg(0)=g
    WITH D SELECT
        seg <= "1111110" WHEN "0000",  -- 0
               "0110000" WHEN "0001",  -- 1
               "1101101" WHEN "0010",  -- 2
               "1111001" WHEN "0011",  -- 3
               "0110011" WHEN "0100",  -- 4
               "1011011" WHEN "0101",  -- 5
               "1011111" WHEN "0110",  -- 6
               "1110000" WHEN "0111",  -- 7
               "1111111" WHEN "1000",  -- 8
               "1111011" WHEN "1001",  -- 9
               "1110111" WHEN "1010",  -- A
               "0011111" WHEN "1011",  -- b
               "1001110" WHEN "1100",  -- C
               "0111101" WHEN "1101",  -- d
               "1001111" WHEN "1110",  -- E
               "1000111" WHEN OTHERS;  -- F
END rtl;
