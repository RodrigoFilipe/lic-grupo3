library ieee;
use ieee.std_logic_1164.all;

entity keyboardReader is
port(
	rst: in std_logic;
	clk: in std_logic;
	kack: in std_logic;
	I: in std_logic_vector(3 downto 0);
	O: out std_logic_vector(3 downto 0);
	dval: out std_logic;
	D: out std_logic_vector(3 downto 0)
);
end keyboardReader;

architecture structure of keyboardReader is
component keyDecode is
port(
	rst: in std_logic;
	clk: in std_logic;
	kack: in std_logic;
	I: in std_logic_vector(3 downto 0);
	O: out std_logic_vector(3 downto 0);
	kval: out std_logic;
	K: out std_logic_vector(3 downto 0)
);

end component;

begin

kdecode: keyDecode port map(
	rst => rst,
	clk => clk,
	kack => kack,
	I => I,
	O => O,
	kval => dval,
	K => D
);

end structure;