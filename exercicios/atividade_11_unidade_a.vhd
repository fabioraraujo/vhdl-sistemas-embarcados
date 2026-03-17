-- atividade_11_unidade_a.vhd
-- Atividade 11: Unidade_A
-- G1: portand_3(a, b, c) -> g
-- G2: portand_3(c, d, e) -> X1 (sinal interno)
-- f = g OR X1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY unidade_a IS
    PORT (
        a, b, c, d, e : IN  std_logic;
        f, g          : OUT std_logic
    );
END unidade_a;

ARCHITECTURE estrutural OF unidade_a IS

    COMPONENT portand_3 IS
        PORT (
            a, b, c : IN  std_logic;
            z       : OUT std_logic
        );
    END COMPONENT;

    SIGNAL s_g, X1 : std_logic;

BEGIN
    G1: portand_3 PORT MAP (a => a, b => b, c => c, z => s_g);
    G2: portand_3 PORT MAP (a => c, b => d, c => e, z => X1);

    g <= s_g;
    f <= s_g OR X1;
END estrutural;
