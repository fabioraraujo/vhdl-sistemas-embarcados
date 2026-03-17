-- 02_porta_logica_comportamental.vhd
-- Descricao COMPORTAMENTAL: Z = (A AND B) OR (NOT C)
-- Mesmo circuito do exemplo 01, agora com PROCESS e IF

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY porta_logica_comp IS
    PORT (
        A : IN  std_logic;
        B : IN  std_logic;
        C : IN  std_logic;
        Z : OUT std_logic
    );
END porta_logica_comp;

ARCHITECTURE comportamental OF porta_logica_comp IS
BEGIN
    PROCESS(A, B, C)
    BEGIN
        IF (A = '1' AND B = '1') THEN
            Z <= '1';
        ELSIF C = '0' THEN
            Z <= '1';
        ELSE
            Z <= '0';
        END IF;
    END PROCESS;
END comportamental;
