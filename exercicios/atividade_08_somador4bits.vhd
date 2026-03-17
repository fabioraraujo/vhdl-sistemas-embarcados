-- atividade_08_somador4bits.vhd
-- Atividade 8: Somador de 4 bits reutilizando somador de 1 bit
-- 4 instancias encadeadas (ripple carry adder)

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY somador4bits IS
    PORT (
        A, B  : IN  std_logic_vector(3 DOWNTO 0);
        Cin   : IN  std_logic;
        S     : OUT std_logic_vector(3 DOWNTO 0);
        Cout  : OUT std_logic
    );
END somador4bits;

ARCHITECTURE estrutural OF somador4bits IS

    COMPONENT somador1bit IS
        PORT (
            A, B, Cin : IN  std_logic;
            S, Cout   : OUT std_logic
        );
    END COMPONENT;

    SIGNAL c : std_logic_vector(3 DOWNTO 1);

BEGIN
    BIT0: somador1bit PORT MAP (A => A(0), B => B(0), Cin => Cin,  S => S(0), Cout => c(1));
    BIT1: somador1bit PORT MAP (A => A(1), B => B(1), Cin => c(1), S => S(1), Cout => c(2));
    BIT2: somador1bit PORT MAP (A => A(2), B => B(2), Cin => c(2), S => S(2), Cout => c(3));
    BIT3: somador1bit PORT MAP (A => A(3), B => B(3), Cin => c(3), S => S(3), Cout => Cout);
END estrutural;
