library ieee;
use ieee.std_logic_1164.all;

entity Registo is
port
	(
	A: in std_logic_vector(3 downto 0);
	Clk: in std_logic;
	Reset: in std_logic;
	E: in std_logic;
	S: out std_logic_vector(3 downto 0)
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

	FFD1: FFD port map (CLK => Clk, RESET => Reset, SET => '0', D => A(0), EN => E, Q => S(0));
	FFD2: FFD port map (CLK => Clk, RESET => Reset, SET => '0', D => A(1), EN => E, Q => S(1));
	FFD3: FFD port map (CLK => Clk, RESET => Reset, SET => '0', D => A(2), EN => E, Q => S(2));
	FFD4: FFD port map (CLK => Clk, RESET => Reset, SET => '0', D => A(3), EN => E, Q => S(3));

end structure;