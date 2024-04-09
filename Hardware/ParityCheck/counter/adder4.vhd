library ieee;
use ieee.std_logic_1164.all;

entity adder1 is
port
	(
	A: in std_logic;
	B: in std_logic;
	C0: in std_logic;
	S: out std_logic;
	C4: out std_logic
	);
end adder1;

architecture structural of adder1 is
component FA is
port
	(
	A: in std_logic;
	B: in std_logic;
	Ci: in std_logic;
	S: out std_logic;
	Co: out std_logic
	);
end component;

signal CarryOver: std_logic;

begin

	FA1: FA port map (A => A, B => B, Ci => C0, S => S, Co => CarryOver);


end structural;