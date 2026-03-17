-- atividade_11_portand3.vhd
-- Componente AND de 3 entradas para reuso na atividade 11

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY portand_3 IS
    PORT (
        a, b, c : IN  std_logic;
        z       : OUT std_logic
    );
END portand_3;

ARCHITECTURE rtl OF portand_3 IS
BEGIN
    z <= a AND b AND c;
END rtl;
