library ieee;
use ieee.std_logic_1164.all;

entity ContadorCrescente is
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
end ContadorCrescente;

architecture structure of ContadorCrescente is
component adder1
port
	(
	A: in std_logic;
	B: in std_logic;
	C0: in std_logic;
	S: out std_logic;
	C4: out std_logic
	);
end component;

component MuxCont
port
	(
	X: in std_logic;
	Y: in std_logic;
	S: in std_logic;
	R: out std_logic
	);
end component;

component Registo
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

	CC_Reg: Registo port map (A => MUXout, Clk => CLK, Reset => Reset, E => '1', S => Rout);
	CC_Adder: adder1 port map (A => CE4bit, B => Rout, C0 => '0', S => AdderOut);
	CC_MUX: MuxCont port map (X => DataIn, Y => AdderOut, S => PL, R => MUXout);
	TC <= Rout; 
	S <= Rout;

end structure;