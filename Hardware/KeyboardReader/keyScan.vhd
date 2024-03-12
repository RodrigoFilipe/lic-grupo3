library ieee;
use ieee.std_logic_1164.all;

entity keyScan is
port(
	Kscan: in std_logic;
	I: in std_logic_vector(3 downto 0);
	clk: in std_logic;	
	Rst: in std_logic;
	K: out std_logic_vector(3 downto 0);
	Kpress: out std_logic;
	O: out std_logic_vector(3 downto 0)
);
end keyScan;

architecture structure of KeyScan is
component Multiplexer is
	port(
		I: in std_logic_vector(3 downto 0);
		OP0, OP1: in std_logic;
		Y: out std_logic
	);
end component;

component Decoder is
	port(
		S0, S1: in std_logic;
		O: out std_logic_vector(3 downto 0)
	);
end component;

component clkDIV is
	port ( 
		clk_in: in std_logic;
		clk_out: out std_logic);
end component;

component Cont is 
	port
	(
	R: in std_logic;
	CE: in std_logic;
	Clk: in std_logic;
	Q: out std_logic_vector(3 downto 0)
	);
end component;

signal QtoDec: std_logic_vector(3 downto 0);
signal CDiv: std_logic;

begin

contador: Cont port map(
	CE => Kscan,
	R => Rst,
	Clk => CDiv,
	Q(3) => QtoDec(3),
	Q(2) => QtoDec(2),
	Q(1) => QtoDec(1),
	Q(0) => QtoDec(0)
);

dec: Decoder port map(
	S0 => QtoDec(3),
	S1 => QtoDec(2),
	O => O
);

mux: Multiplexer port map(
	I => I,
	OP0 => QtoDec(1),
	OP1 => QtoDec(0),
	Y => Kpress
);

clkD: clkDIV port map(
	clk_in => clk,
	clk_out => CDiv
);

K <= QtoDec;

end structure;
