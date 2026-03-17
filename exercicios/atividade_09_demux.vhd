-- atividade_09_demux.vhd
-- Atividade 9: Demultiplexador 1:8
-- 1 entrada de dado (D), 3 bits de selecao (sel), 8 saidas (Y0..Y7)

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY demux_1to8 IS
    PORT (
        D   : IN  std_logic;
        sel : IN  std_logic_vector(2 DOWNTO 0);
        Y   : OUT std_logic_vector(7 DOWNTO 0)
    );
END demux_1to8;

ARCHITECTURE rtl OF demux_1to8 IS
BEGIN
    PROCESS(D, sel)
    BEGIN
        Y <= (OTHERS => '0');
        CASE sel IS
            WHEN "000" => Y(0) <= D;
            WHEN "001" => Y(1) <= D;
            WHEN "010" => Y(2) <= D;
            WHEN "011" => Y(3) <= D;
            WHEN "100" => Y(4) <= D;
            WHEN "101" => Y(5) <= D;
            WHEN "110" => Y(6) <= D;
            WHEN OTHERS => Y(7) <= D;
        END CASE;
    END PROCESS;
END rtl;
