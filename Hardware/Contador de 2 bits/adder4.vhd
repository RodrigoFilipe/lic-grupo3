library ieee;
use ieee.std_logic_1164.all;

entity adder4 is
port
	(
	A: in std_logic_vector(3 downto 0);
	B: in std_logic_vector(3 downto 0);
	C0: in std_logic;
	S: out std_logic_vector(3 downto 0);
	C4: out std_logic
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

signal CarryOver: std_logic_vector(3 downto 1);

begin

	FA1: FA port map (A => A(0), B => B(0), Ci => C0, S => S(0), Co => CarryOver(1));
	FA2: FA port map (A => A(1), B => B(1), Ci => CarryOver(1), S => S(1), Co => CarryOver(2));
	FA3: FA port map (A => A(2), B => B(2), Ci => CarryOver(2), S => S(2), Co => CarryOver(3));
	FA4: FA port map (A => A(3), B => B(3), Ci => CarryOver(3), S => S(3), Co => C4);

end structural;
