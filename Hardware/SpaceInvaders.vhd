library ieee;
use ieee.std_logic_1164.all;

entity SpaceInvaders is
port(
	rst: in std_logic;
	clk: in std_logic;
	ack: in std_logic;
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

signal SDval: std_logic;
signal SD: std_logic_vector(3 downto 0);

begin

kreader: keyboardReader port map(
	rst => rst,
	clk => clk,
	kack => ack,
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
	inputPort(7) => SDval,
	outputPort => UsbportOut
);

end structure;






