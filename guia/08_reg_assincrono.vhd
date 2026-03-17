-- 08_reg_assincrono.vhd
-- Registrador com reset assincrono de 8 bits

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY reg_assincrono IS
    PORT (
        clk : IN  std_logic;
        rst : IN  std_logic;
        d   : IN  std_logic_vector(7 DOWNTO 0);
        q   : OUT std_logic_vector(7 DOWNTO 0)
    );
END reg_assincrono;

ARCHITECTURE rtl OF reg_assincrono IS
BEGIN
    PROCESS(clk, rst)
    BEGIN
        IF rst = '1' THEN
            q <= (OTHERS => '0');
        ELSIF clk'EVENT AND clk = '1' THEN
            q <= d;
        END IF;
    END PROCESS;
END rtl;
