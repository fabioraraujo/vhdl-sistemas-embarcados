-- 05_mux_2to1_process.vhd
-- MUX 2:1 usando IF-THEN-ELSE dentro de PROCESS (sequencial)

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux_2to1_process IS
    PORT (
        A, B : IN  std_logic;
        sel  : IN  std_logic;
        Y    : OUT std_logic
    );
END mux_2to1_process;

ARCHITECTURE sequencial OF mux_2to1_process IS
BEGIN
    PROCESS(sel, A, B)
    BEGIN
        IF sel = '0' THEN
            Y <= A;
        ELSE
            Y <= B;
        END IF;
    END PROCESS;
END sequencial;
