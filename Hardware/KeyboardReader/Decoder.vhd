library ieee;
use ieee.std_logic_1164.all;

entity Decoder is 
port(
S0, S1: in std_logic;
O: out std_logic_vector(3 downto 0)
);
end Decoder;

architecture LogicFunction of Decoder is
begin

O(0) <= not(not S0 and not S1);
O(1) <= not (not S0 and S1);
O(2) <= not (S0 and not S1);
O(3) <= not (S0 and S1);

end LogicFunction;



