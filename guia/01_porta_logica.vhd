-- 01_porta_logica.vhd
-- Descricao ESTRUTURAL: Z = (A AND B) OR (NOT C)
-- Exemplo de uso de sinais intermediarios e portas logicas

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY porta_logica IS
    PORT (
        A : IN  std_logic;
        B : IN  std_logic;
        C : IN  std_logic;
        Z : OUT std_logic
    );
END porta_logica;

ARCHITECTURE estrutural OF porta_logica IS
    SIGNAL s_and : std_logic;
    SIGNAL s_not : std_logic;
BEGIN
    s_and <= A AND B;
    s_not <= NOT C;
    Z     <= s_and OR s_not;
END estrutural;
