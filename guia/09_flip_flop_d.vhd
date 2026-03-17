-- 09_flip_flop_d.vhd
-- Flip-Flop D descrito de tres formas diferentes

-- =============================================
-- Forma 1: WAIT UNTIL
-- =============================================
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ff_d_wait IS
    PORT (
        clk : IN  std_logic;
        d   : IN  std_logic;
        q   : OUT std_logic
    );
END ff_d_wait;

ARCHITECTURE rtl OF ff_d_wait IS
BEGIN
    PROCESS
    BEGIN
        WAIT UNTIL clk'EVENT AND clk = '1';
        q <= d;
    END PROCESS;
END rtl;

-- =============================================
-- Forma 2: IF com EVENT (mais comum)
-- =============================================
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ff_d_if IS
    PORT (
        clk : IN  std_logic;
        d   : IN  std_logic;
        q   : OUT std_logic
    );
END ff_d_if;

ARCHITECTURE rtl OF ff_d_if IS
BEGIN
    PROCESS(clk)
    BEGIN
        IF clk'EVENT AND clk = '1' THEN
            q <= d;
        END IF;
    END PROCESS;
END rtl;

-- =============================================
-- Forma 3: BLOCK (guarded)
-- =============================================
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ff_d_block IS
    PORT (
        clk : IN  std_logic;
        d   : IN  std_logic;
        q   : OUT std_logic
    );
END ff_d_block;

ARCHITECTURE rtl OF ff_d_block IS
BEGIN
    bloco: BLOCK (clk'EVENT AND clk = '1')
    BEGIN
        q <= GUARDED d;
    END BLOCK bloco;
END rtl;
