-- atividade_10_latchen.vhd
-- Atividade 10: LatchEn (Latch com Enable)
-- PortaE (AND): Clk AND En -> Cint
-- LatchD: D=Din, Clk=Cint -> Qout
-- Reuso de componentes portand e latchd

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY latchen IS
    PORT (
        Din  : IN  std_logic;
        Clk  : IN  std_logic;
        En   : IN  std_logic;
        Qout : OUT std_logic
    );
END latchen;

ARCHITECTURE estrutural OF latchen IS

    COMPONENT portand IS
        PORT (
            a, b : IN  std_logic;
            z    : OUT std_logic
        );
    END COMPONENT;

    COMPONENT latchd IS
        PORT (
            D, Clk : IN  std_logic;
            Q      : OUT std_logic
        );
    END COMPONENT;

    SIGNAL Cint : std_logic;

BEGIN
    PortaE: portand PORT MAP (a => Clk, b => En, z => Cint);
    Latch:  latchd  PORT MAP (D => Din, Clk => Cint, Q => Qout);
END estrutural;
