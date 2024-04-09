library ieee;
use ieee.std_logic_1164.all;

entity adder1bit is
port
	(
	A: in std_logic;
	B: in std_logic;
	C0: in std_logic;
	S: out std_logic;
	C4: out std_logic
	);
end adder1bit;

architecture structural of adder1bit is
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