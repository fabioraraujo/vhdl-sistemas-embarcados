-- 11_pwm_duty_variavel.vhd
-- PWM com duty cycle variavel via entrada externa
--
-- O valor de "duty" e fornecido por uma porta de 8 bits, permitindo
-- variar a largura de pulso em tempo de execucao (256 niveis).
--
-- Aplicacao tipica: controle de brilho de LED, velocidade de motor DC,
-- conversao digital-analogica simples (D/A por filtro RC).
--
-- Relacao: duty / 256 = fracao do periodo em nivel alto.
--    duty = 0   -> saida sempre '0'   (0%)
--    duty = 128 -> 50% do periodo     (meio brilho)
--    duty = 255 -> quase sempre '1'   (~99.6%)

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY pwm_duty_variavel IS
    PORT (
        clk    : IN  std_logic;
        rst    : IN  std_logic;
        duty   : IN  std_logic_vector(7 DOWNTO 0);
        pwm_out: OUT std_logic
    );
END pwm_duty_variavel;

ARCHITECTURE rtl OF pwm_duty_variavel IS
    SIGNAL contador : unsigned(7 DOWNTO 0) := (OTHERS => '0');
BEGIN

    PROCESS(clk, rst)
    BEGIN
        IF rst = '1' THEN
            contador <= (OTHERS => '0');
        ELSIF rising_edge(clk) THEN
            contador <= contador + 1;
        END IF;
    END PROCESS;

    -- Compara contador com o duty cycle de entrada
    pwm_out <= '1' WHEN contador < unsigned(duty) ELSE '0';

END rtl;
