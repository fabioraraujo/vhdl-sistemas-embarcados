-- atividade_08_somador1bit.vhd
-- Atividade 8: Somador completo de 1 bit
-- Entradas: A, B, Cin
-- Saidas: S (soma), Cout (carry out)

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY somador1bit IS
    PORT (
        A, B, Cin : IN  std_logic;
        S, Cout   : OUT std_logic
    );
END somador1bit;

ARCHITECTURE rtl OF somador1bit IS
BEGIN
    S    <= A XOR B XOR Cin;
    Cout <= (A AND B) OR (A AND Cin) OR (B AND Cin);
END rtl;
