library ieee;
use ieee.std_logic_1164.all;

entity ContadorCrescente1bit is
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
end ContadorCrescente1bit;

architecture structure of ContadorCrescente1bit is
component adder1bit
port
	(
	A: in std_logic;
	B: in std_logic;
	C0: in std_logic;
	S: out std_logic;
	C4: out std_logic
	);
end component;

component MuxCont1bit
port
	(
	X: in std_logic;
	Y: in std_logic;
	S: in std_logic;
	R: out std_logic
	);
end component;

component Registo1bit
port
	(
	A: in std_logic;
	Clk: in std_logic;
	Reset: in std_logic;
	E: in std_logic;
	S: out std_logic
	);
end component;

signal MUXout: std_logic;
signal Rout: std_logic;
signal AdderOut: std_logic;
signal CE4bit: std_logic;

begin
	
	CE4bit <= CE;

	CC_Reg: Registo1bit port map (A => MUXout, Clk => CLK, Reset => Reset, E => '1', S => Rout);
	CC_Adder: adder1bit port map (A => CE4bit, B => Rout, C0 => '0', S => AdderOut);
	CC_MUX: MuxCont1bit port map (X => DataIn, Y => AdderOut, S => PL, R => MUXout);
	TC <= Rout; 
	S <= Rout;

end structure;