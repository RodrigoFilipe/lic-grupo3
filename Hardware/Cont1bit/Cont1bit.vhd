library ieee;
use ieee.std_logic_1164.all;

entity Cont1bit is
port
	(
	R: in std_logic;
	CE: in std_logic;
	Clk: in std_logic;
	Q: out std_logic
	);
end Cont1bit;

architecture structure of Cont1bit is
component ContadorCrescente1bit is
port
	(
	DataIn: in std_logic;
	PL: in std_logic;
	CE: in std_logic;
	CLK: in std_logic;
	Reset: in std_logic;
	TC: out std_logic;
	S: out std_logic
	);
end component;

begin

	U1: ContadorCrescente1bit port map (DataIn => '0', PL => '0', CE => CE, CLK => Clk, Reset => R, S => Q);
	
end structure;