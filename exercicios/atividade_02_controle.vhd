-- atividade_02_controle.vhd
-- Atividade 2: Controle de Passagem
-- Saida = A quando B='0' e C='1', senao Saida = '0'
-- Usa PROCESS com IF

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY controle IS
    PORT (
        A, B, C : IN  std_logic;
        Saida   : OUT std_logic
    );
END controle;

ARCHITECTURE rtl OF controle IS
BEGIN
    PROCESS(A, B, C)
    BEGIN
        IF B = '0' AND C = '1' THEN
            Saida <= A;
        ELSE
            Saida <= '0';
        END IF;
    END PROCESS;
END rtl;
