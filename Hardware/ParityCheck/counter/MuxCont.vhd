library ieee;
use ieee.std_logic_1164.all;

entity MuxCont is
port
	(
	X: in std_logic;
	Y: in std_logic;
	S: in std_logic;
	R: out std_logic
	);
end MuxCont;

architecture logicFunction of MuxCont is
begin

	R <= (X AND S) OR (Y AND not S);


end logicFunction;