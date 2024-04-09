library ieee;
use ieee.std_logic_1164.all;

entity Registo is
port
	(
	A: in std_logic;
	Clk: in std_logic;
	Reset: in std_logic;
	E: in std_logic;
	S: out std_logic
	);
end Registo;

architecture structure of Registo is
component FFD is
port
	(
	CLK: in std_logic;
	RESET: in STD_LOGIC;
	SET: in std_logic;
	D: in STD_LOGIC;
	EN: in STD_LOGIC;
	Q: out std_logic
	);
end component;

begin

	FFD1: FFD port map (CLK => Clk, RESET => Reset, SET => '0', D => A, EN => E, Q => S);


end structure;