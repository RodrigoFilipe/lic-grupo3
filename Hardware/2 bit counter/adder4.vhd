library ieee;
use ieee.std_logic_1164.all;

entity adder4 is
port
	(
	A: in std_logic_vector(1 downto 0);
	B: in std_logic_vector(1 downto 0);
	Cin: in std_logic;
	S: out std_logic_vector(1 downto 0);
	Cout: out std_logic
	);
end adder4;

architecture structural of adder4 is
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

signal Carry: std_logic;

begin

	FA1: FA port map (A => A(0), B => B(0), Ci => Cin, S => S(0), Co => Carry);
	FA2: FA port map (A => A(1), B => B(1), Ci => Carry, S => S(1), Co => Cout);


end structural;