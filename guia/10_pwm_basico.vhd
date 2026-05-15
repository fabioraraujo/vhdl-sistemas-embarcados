-- 10_pwm_basico.vhd
-- PWM (Pulse Width Modulation) basico com duty cycle fixo
--
-- Conceito: gera um sinal digital periodico cuja largura de pulso (tempo em '1')
-- e uma fracao do periodo total. Aqui usamos um contador de 8 bits comparado
-- com um valor de duty cycle constante (DUTY = 64 -> aproximadamente 25%).
--
-- Periodo do PWM: 256 ciclos de clock (contador de 8 bits)
-- Duty cycle    : DUTY / 256 = 64 / 256 = 25%

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY pwm_basico IS
    PORT (
        clk    : IN  std_logic;
        rst    : IN  std_logic;
        pwm_out: OUT std_logic
    );
END pwm_basico;

ARCHITECTURE rtl OF pwm_basico IS
    CONSTANT DUTY : unsigned(7 DOWNTO 0) := to_unsigned(64, 8);  -- 25%
    SIGNAL contador : unsigned(7 DOWNTO 0) := (OTHERS => '0');
BEGIN

    -- Contador livre de 0 a 255
    PROCESS(clk, rst)
    BEGIN
        IF rst = '1' THEN
            contador <= (OTHERS => '0');
        ELSIF rising_edge(clk) THEN
            contador <= contador + 1;
        END IF;
    END PROCESS;

    -- Saida PWM: '1' enquanto contador < DUTY
    pwm_out <= '1' WHEN contador < DUTY ELSE '0';

END rtl;
