-- 06_componentes_aoi.vhd
-- Exemplo de declaracao e instanciacao de componentes
-- Unidade AOI: Z = (A AND B) OR (C AND D) -- AND-OR-Invert

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Componente: porta AND de 2 entradas
ENTITY porta_and2 IS
    PORT (
        x, y : IN  std_logic;
        z    : OUT std_logic
    );
END porta_and2;

ARCHITECTURE rtl OF porta_and2 IS
BEGIN
    z <= x AND y;
END rtl;

-----------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Componente: porta OR de 2 entradas
ENTITY porta_or2 IS
    PORT (
        x, y : IN  std_logic;
        z    : OUT std_logic
    );
END porta_or2;

ARCHITECTURE rtl OF porta_or2 IS
BEGIN
    z <= x OR y;
END rtl;

-----------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Entidade principal: Unidade_AOI
ENTITY unidade_aoi IS
    PORT (
        A, B, C, D : IN  std_logic;
        Z          : OUT std_logic
    );
END unidade_aoi;

ARCHITECTURE estrutural OF unidade_aoi IS

    COMPONENT porta_and2 IS
        PORT (
            x, y : IN  std_logic;
            z    : OUT std_logic
        );
    END COMPONENT;

    COMPONENT porta_or2 IS
        PORT (
            x, y : IN  std_logic;
            z    : OUT std_logic
        );
    END COMPONENT;

    SIGNAL s_and1, s_and2 : std_logic;

BEGIN
    G1: porta_and2 PORT MAP (x => A, y => B, z => s_and1);
    G2: porta_and2 PORT MAP (x => C, y => D, z => s_and2);
    G3: porta_or2  PORT MAP (x => s_and1, y => s_and2, z => Z);
END estrutural;
