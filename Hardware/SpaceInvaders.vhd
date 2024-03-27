library ieee;
use ieee.std_logic_1164.all;

entity SpaceInvaders is
port(
	rst: in std_logic;
	clk: in std_logic;
	ack: in std_logic;
	RS: out std_logic;
	EOut: out std_logic;
	I: in std_logic_vector(3 downto 0);
	O: out std_logic_vector(3 downto 0);
	UsbportOut: out std_logic_vector(7 downto 0)

);
end SpaceInvaders;

architecture structure of SpaceInvaders is
component keyboardReader is
port(
	rst: in std_logic;
	clk: in std_logic;
	kack: in std_logic;
	I: in std_logic_vector(3 downto 0);
	O: out std_logic_vector(3 downto 0);
	dval: out std_logic;
	D: out std_logic_vector(3 downto 0)
);
end component;

component UsbPort is
port(
	inputPort:  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
	outputPort :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
);
end component;

component Registers is
port(
	Input: in std_logic_vector(3 downto 0);
	Sclk: in std_logic;
	rst: in std_logic;
	DataOut: out std_logic_vector(7 downto 0)
	
);
end component;

signal SDval: std_logic;
signal SD: std_logic_vector(3 downto 0);
signal Susbport: std_logic_vector(4 downto 0);
signal Sack: std_logic;


begin

kreader: keyboardReader port map(
	rst => rst,
	clk => clk,
	kack => Sack,
	I => I,
	O => O,
	dval => SDval,
	D => SD
);

uport: UsbPort port map(
	inputPort(0) => SD(0),
	inputPort(1) => SD(1),
	inputPort(2) => SD(2),
	inputPort(3) => SD(3),
	inputPort(4) => SDval,
	inputPort(7) => Sack,
	outputPort(0) => Susbport(0),
	outputPort(1) => Susbport(1), 
	outputPort(2) => Susbport(2), 
	outputPort(3) => Susbport(3),
	outputPort(4) => Susbport(4),
	outputPort(5) => EOut,
	outputPort(6) => RS
);

LCDdispatcher: Registers port map(
	Input(0) => Susbport(0),
	Input(1) => Susbport(1),
	Input(2) => Susbport(2),
	Input(3) => Susbport(3),
	rst => rst,
	Sclk => SusbPort(4),
	DataOut => UsbportOut 

	
);


end structure;






