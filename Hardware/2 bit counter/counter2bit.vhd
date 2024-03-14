library ieee;
use ieee.std_logic_1164.all;

entity counter2bit is
port
	(
	R: in std_logic;
	CE: in std_logic;
	Clk: in std_logic;
	Q: out std_logic_vector(1 downto 0)
	);
end counter2bit;

architecture structure of counter2bit is
component ContadorCrescente is
port
	(
	DataIn: in std_logic_vector(1 downto 0);
	PL: in std_logic;
	CE: in std_logic;
	CLK: in std_logic;
	Reset: in std_logic;
	TC: out std_logic;
	S: out std_logic_vector(1 downto 0)
	);
end component;

begin

	U1: ContadorCrescente port map (DataIn => "00", PL => '0', CE => CE, CLK => Clk, Reset => R, S => Q);
	
end structure;