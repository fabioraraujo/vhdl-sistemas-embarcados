-- atividade_03_comparador.vhd
-- Atividade 3: Comparador de 4 bits
-- Compara A e B, gera sinais AigualB, AmaiorB, AmenorB

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY comparador_4bits IS
    PORT (
        A, B     : IN  std_logic_vector(3 DOWNTO 0);
        AigualB  : OUT std_logic;
        AmaiorB  : OUT std_logic;
        AmenorB  : OUT std_logic
    );
END comparador_4bits;

ARCHITECTURE rtl OF comparador_4bits IS
BEGIN
    PROCESS(A, B)
    BEGIN
        IF A = B THEN
            AigualB <= '1';
            AmaiorB <= '0';
            AmenorB <= '0';
        ELSIF A > B THEN
            AigualB <= '0';
            AmaiorB <= '1';
            AmenorB <= '0';
        ELSE
            AigualB <= '0';
            AmaiorB <= '0';
            AmenorB <= '1';
        END IF;
    END PROCESS;
END rtl;
