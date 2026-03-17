-- atividade_10_latchd.vhd
-- Componente Latch D para reuso na atividade 10

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY latchd IS
    PORT (
        D, Clk : IN  std_logic;
        Q      : OUT std_logic
    );
END latchd;

ARCHITECTURE rtl OF latchd IS
BEGIN
    PROCESS(D, Clk)
    BEGIN
        IF Clk = '1' THEN
            Q <= D;
        END IF;
    END PROCESS;
END rtl;
