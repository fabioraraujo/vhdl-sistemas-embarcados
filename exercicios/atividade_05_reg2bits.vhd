-- atividade_05_reg2bits.vhd
-- Atividade 5: Registrador de 2 bits reutilizando Flip-Flop D
-- 2 instancias de flipflop_d com port map

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY reg2bits IS
    PORT (
        clk  : IN  std_logic;
        d    : IN  std_logic_vector(1 DOWNTO 0);
        q    : OUT std_logic_vector(1 DOWNTO 0)
    );
END reg2bits;

ARCHITECTURE estrutural OF reg2bits IS

    COMPONENT flipflop_d IS
        PORT (
            clk : IN  std_logic;
            d   : IN  std_logic;
            q   : OUT std_logic
        );
    END COMPONENT;

BEGIN
    FF0: flipflop_d PORT MAP (clk => clk, d => d(0), q => q(0));
    FF1: flipflop_d PORT MAP (clk => clk, d => d(1), q => q(1));
END estrutural;
