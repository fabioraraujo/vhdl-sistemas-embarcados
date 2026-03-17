-- atividade_04_mux16to1.vhd
-- Atividade 4: MUX 16:1 hierarquico reutilizando MUX 4:1
-- 16 entradas (D0..D15), 4 bits de selecao (sel), 1 saida (Y)
-- Arquitetura: 4 MUX 4:1 no primeiro nivel + 1 MUX 4:1 no segundo nivel

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux16to1 IS
    PORT (
        D0, D1, D2, D3     : IN  std_logic;
        D4, D5, D6, D7     : IN  std_logic;
        D8, D9, D10, D11   : IN  std_logic;
        D12, D13, D14, D15 : IN  std_logic;
        sel                 : IN  std_logic_vector(3 DOWNTO 0);
        Y                   : OUT std_logic
    );
END mux16to1;

ARCHITECTURE estrutural OF mux16to1 IS

    COMPONENT mux4to1 IS
        PORT (
            D0, D1, D2, D3 : IN  std_logic;
            sel             : IN  std_logic_vector(1 DOWNTO 0);
            Y               : OUT std_logic
        );
    END COMPONENT;

    SIGNAL m0, m1, m2, m3 : std_logic;

BEGIN
    -- Primeiro nivel: selecao pelos 2 bits menos significativos
    MUX_A: mux4to1 PORT MAP (
        D0 => D0, D1 => D1, D2 => D2, D3 => D3,
        sel => sel(1 DOWNTO 0), Y => m0
    );

    MUX_B: mux4to1 PORT MAP (
        D0 => D4, D1 => D5, D2 => D6, D3 => D7,
        sel => sel(1 DOWNTO 0), Y => m1
    );

    MUX_C: mux4to1 PORT MAP (
        D0 => D8, D1 => D9, D2 => D10, D3 => D11,
        sel => sel(1 DOWNTO 0), Y => m2
    );

    MUX_D: mux4to1 PORT MAP (
        D0 => D12, D1 => D13, D2 => D14, D3 => D15,
        sel => sel(1 DOWNTO 0), Y => m3
    );

    -- Segundo nivel: selecao pelos 2 bits mais significativos
    MUX_FINAL: mux4to1 PORT MAP (
        D0 => m0, D1 => m1, D2 => m2, D3 => m3,
        sel => sel(3 DOWNTO 2), Y => Y
    );

END estrutural;
