-- atividade_05_flipflop_d.vhd
-- Componente Flip-Flop D para reuso na atividade 5

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY flipflop_d IS
    PORT (
        clk : IN  std_logic;
        d   : IN  std_logic;
        q   : OUT std_logic
    );
END flipflop_d;

ARCHITECTURE rtl OF flipflop_d IS
BEGIN
    PROCESS(clk)
    BEGIN
        IF clk'EVENT AND clk = '1' THEN
            q <= d;
        END IF;
    END PROCESS;
END rtl;
