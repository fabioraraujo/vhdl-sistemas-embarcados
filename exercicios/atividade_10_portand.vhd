-- atividade_10_portand.vhd
-- Componente porta AND de 2 entradas para reuso na atividade 10

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY portand IS
    PORT (
        a, b : IN  std_logic;
        z    : OUT std_logic
    );
END portand;

ARCHITECTURE rtl OF portand IS
BEGIN
    z <= a AND b;
END rtl;
