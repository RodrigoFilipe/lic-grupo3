library ieee;

use ieee.std_logic_1164.all;

entity Multiplexer is
port(
I: in std_logic_vector(3 downto 0);
OP0, OP1: in std_logic;
Y: out std_logic
);
end Multiplexer;

architecture LogicFunction of Multiplexer is

begin
Y <= 	not ((OP0 or OP1 or (I(0))) and ((OP0) or (not OP1) or (I(1))) and ((not OP0) or OP1 or (I(2))) and ((not OP0) or (not OP1) or (I(3))));


end LogicFunction;

