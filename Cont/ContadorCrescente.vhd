library ieee;
use ieee.std_logic_1164.all;

entity ContadorCrescente is
port
	(
	DataIn: in std_logic_vector(3 downto 0);
	PL: in std_logic;
	CE: in std_logic;
	CLK: in std_logic;
	Reset: in std_logic;
	TC: out std_logic;
	S: out std_logic_vector(3 downto 0)
	);
end ContadorCrescente;

architecture structure of ContadorCrescente is
component adder4
port
	(
	A: in std_logic_vector(3 downto 0);
	B: in std_logic_vector(3 downto 0);
	C0: in std_logic;
	S: out std_logic_vector(3 downto 0);
	C4: out std_logic
	);
end component;

component MuxCont
port
	(
	X: in std_logic_vector(3 downto 0);
	Y: in std_logic_vector(3 downto 0);
	S: in std_logic;
	R: out std_logic_vector(3 downto 0)
	);
end component;

component Registo
port
	(
	A: in std_logic_vector(3 downto 0);
	Clk: in std_logic;
	Reset: in std_logic;
	E: in std_logic;
	S: out std_logic_vector(3 downto 0)
	);
end component;

signal MUXout: std_logic_vector(3 downto 0);
signal Rout: std_logic_vector(3 downto 0);
signal AdderOut: std_logic_vector(3 downto 0);
signal CE4bit: std_logic_vector(3 downto 0);

begin
	
	CE4bit(0) <= CE;
	CE4bit(1) <= '0';
	CE4bit(2) <= '0';
	CE4bit(3) <= '0';
	CC_Reg: Registo port map (A => MUXout, Clk => CLK, Reset => Reset, E => '1', S => Rout);
	CC_Adder: adder4 port map (A => CE4bit, B => Rout, C0 => '0', S => AdderOut);
	CC_MUX: MuxCont port map (X => DataIn, Y => AdderOut, S => PL, R => MUXout);
	TC <= Rout(0) and Rout(1) and Rout(2) and Rout(3); 
	S <= Rout;

end structure;