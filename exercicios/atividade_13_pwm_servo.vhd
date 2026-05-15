-- atividade_13_pwm_servo.vhd
-- PWM para controle de servo motor (padrao hobby)
--
-- Enunciado: gerar um sinal PWM com periodo de 20 ms (50 Hz) e largura de
-- pulso entre 1 ms (posicao 0 graus) e 2 ms (posicao 180 graus). A posicao
-- e selecionada por 3 chaves (8 posicoes discretas).
--
-- Considerando clock de 50 MHz (periodo = 20 ns):
--   1 ciclo  = 20 ns
--   20 ms    = 1.000.000 ciclos -> contador de 20 bits ate 999_999
--   1 ms     = 50.000 ciclos    (pulso minimo)
--   2 ms     = 100.000 ciclos   (pulso maximo)
--   passo    = (100000 - 50000) / 7 = aproximadamente 7143 ciclos por posicao
--
-- Saida: servo = '1' durante a janela do pulso, '0' no restante do periodo.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY pwm_servo IS
    PORT (
        clk   : IN  std_logic;
        rst   : IN  std_logic;
        pos   : IN  std_logic_vector(2 DOWNTO 0);  -- 0 a 7
        servo : OUT std_logic
    );
END pwm_servo;

ARCHITECTURE rtl OF pwm_servo IS
    CONSTANT PERIODO  : unsigned(19 DOWNTO 0) := to_unsigned(1000000, 20);
    CONSTANT PULSO_MIN: unsigned(19 DOWNTO 0) := to_unsigned(50000,   20);
    CONSTANT PASSO    : unsigned(19 DOWNTO 0) := to_unsigned(7143,    20);

    SIGNAL contador  : unsigned(19 DOWNTO 0) := (OTHERS => '0');
    SIGNAL largura   : unsigned(19 DOWNTO 0);
BEGIN

    -- Calcula a largura do pulso a partir da posicao selecionada
    largura <= PULSO_MIN + PASSO * unsigned(pos);

    -- Contador de periodo (0 ate 999_999)
    PROCESS(clk, rst)
    BEGIN
        IF rst = '1' THEN
            contador <= (OTHERS => '0');
        ELSIF rising_edge(clk) THEN
            IF contador = PERIODO - 1 THEN
                contador <= (OTHERS => '0');
            ELSE
                contador <= contador + 1;
            END IF;
        END IF;
    END PROCESS;

    servo <= '1' WHEN contador < largura ELSE '0';

END rtl;
