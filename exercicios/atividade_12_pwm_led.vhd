-- atividade_12_pwm_led.vhd
-- Controle de brilho de LED via PWM com 4 niveis selecionaveis por chaves
--
-- Enunciado: implementar um modulo PWM que controla o brilho de um LED.
-- O nivel de brilho e selecionado por duas chaves (sel) com 4 niveis:
--   sel = "00" -> 0%   (apagado)
--   sel = "01" -> 25%
--   sel = "10" -> 50%
--   sel = "11" -> 75%
--
-- Tecnica: contador, WITH...SELECT para gerar o duty, comparacao concorrente.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY pwm_led IS
    PORT (
        clk : IN  std_logic;
        rst : IN  std_logic;
        sel : IN  std_logic_vector(1 DOWNTO 0);
        led : OUT std_logic
    );
END pwm_led;

ARCHITECTURE rtl OF pwm_led IS
    SIGNAL contador : unsigned(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL duty     : unsigned(7 DOWNTO 0);
BEGIN

    -- Tabela de duty cycles (4 niveis pre-definidos)
    WITH sel SELECT
        duty <= to_unsigned(0,   8) WHEN "00",
                to_unsigned(64,  8) WHEN "01",
                to_unsigned(128, 8) WHEN "10",
                to_unsigned(192, 8) WHEN "11",
                to_unsigned(0,   8) WHEN OTHERS;

    -- Contador livre de 8 bits
    PROCESS(clk, rst)
    BEGIN
        IF rst = '1' THEN
            contador <= (OTHERS => '0');
        ELSIF rising_edge(clk) THEN
            contador <= contador + 1;
        END IF;
    END PROCESS;

    led <= '1' WHEN contador < duty ELSE '0';

END rtl;
