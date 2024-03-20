LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity LCDPArallel is
port(
	DataIn: in std_logic_vector(7 downto 0);
	rst: in std_logic;
	clk: in std_logic;
	DataOut: out std_logic_vector(7 downto 0);
	RS: out std_logic;
	E: out std_logic
	
);
end LCDParallel;

architecture structural of LCDParallel is
component UsbPort IS 
	PORT
	(
		inputPort:  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		outputPort :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END component;

component Registo is
port
	(
	A: in std_logic_vector(3 downto 0);
	Clk: in std_logic;
	Reset: in std_logic;
	E: in std_logic;
	S: out std_logic_vector(3 downto 0)
	);
end component;

signal enableReg: std_logic;
signal Sclk: std_logic;
signal SRegH: std_logic_vector(3 downto 0);
signal SRegL: std_logic_vector(3 downto 0);

begin



usb: UsbPort port map (
	inputPort => DataIn,
	outputPort(6) => RS,
	outputPort(5) => E,
	outputPort(4) => Sclk,
	outputPort(0) => SRegH(0),
	outputPort(1) => SRegH(1),
	outputPort(2) => SRegH(2),
	outputPort(3) => SRegH(3)
);

RegHigh: Registo port map(
	A => SRegH,
	Reset => rst,
	Clk => clk,
	E => Sclk,
	S => SRegL
);

RegLow: Registo port map(
	A => SRegL,
	Reset => rst,
	Clk => clk,
	E => Sclk,
	S(0) => DataOut(0),
	S(1) => DataOut(1),
	S(2) => DataOut(2),
	S(3) => DataOut(3)
);
	

	DataOut(4) <= SRegL(0);
	DataOut(5) <= SRegL(1);
	DataOut(6) <= SRegL(2);
	DataOut(7) <= SRegL(3);
	
end structural;
	