LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity Registers is
port(
	Input: in std_logic_vector(3 downto 0);
	Sclk: in std_logic;
	rst: in std_logic;
	DataOut: out std_logic_vector(7 downto 0)

	
);
end Registers;

architecture structural of Registers is

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
signal Sck: std_logic;
signal SLowToHigh: std_logic_vector(3 downto 0);
signal SRegL: std_logic_vector(3 downto 0);

begin




RegHigh: Registo port map(
	A => SLowToHigh,
	Reset => rst,
	Clk => Sclk,
	E => '1',
	S(0) => DataOut(4),
	S(1) => DataOut(5),
	S(2) => DataOut(6),
	S(3) => DataOut(7)
);

RegLow: Registo port map(
	A => Input,
	Reset => rst,
	Clk => Sck,
	E => '1',
	S(0) => SLowToHigh(0),
	S(1) => SLowToHigh(1),
	S(2) => SLowToHigh(2),
	S(3) => SLowToHigh(3)
);
	

	DataOut(0) <= SLowToHigh(0);
	DataOut(1) <= SLowToHigh(1);
	DataOut(2) <= SLowToHigh(2);
	DataOut(3) <= SLowToHigh(3);
	
end structural;
	