-- 07_reg_sincrono.vhd
-- Registrador sincrono de 8 bits (sensivel a borda de subida do clock)

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY reg_sincrono IS
    PORT (
        clk : IN  std_logic;
        d   : IN  std_logic_vector(7 DOWNTO 0);
        q   : OUT std_logic_vector(7 DOWNTO 0)
    );
END reg_sincrono;

ARCHITECTURE rtl OF reg_sincrono IS
BEGIN
    PROCESS(clk)
    BEGIN
        IF clk'EVENT AND clk = '1' THEN
            q <= d;
        END IF;
    END PROCESS;
END rtl;
