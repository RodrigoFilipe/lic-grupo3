library ieee;
use ieee.std_logic_1164.all;

entity keyDecode is
port(
	rst: in std_logic;
	clk: in std_logic;
	kack: in std_logic;
	I: in std_logic_vector(3 downto 0);
	O: out std_logic_vector(3 downto 0);
	kval: out std_logic;
	K: out std_logic_vector(3 downto 0)
);

end keyDecode;
architecture structure of keyDecode is
component keyScan is
port(
	Kscan: in std_logic;
	I: in std_logic_vector(3 downto 0);
	clk: in std_logic;	
	Rst: in std_logic;
	K: out std_logic_vector(3 downto 0);
	Kpress: out std_logic;
	O: out std_logic_vector(3 downto 0)
);

end component;

component keyControl is
port(
	clk: in std_logic;
	rst: in std_logic;
	kpress: in std_logic;
	kack: in std_logic;
	kscan: out std_logic;
	kval: out std_logic
	);
	
end component;

signal kp: std_logic;
signal ks: std_logic;

begin

kscan: keyScan port map(
Kscan => ks,
I => I,
clk => clk,
Rst => rst,
K => K,
Kpress => kp,
O => O
);

kctrl: keyControl port map(
clk => clk,
rst => rst,
kpress => kp,
kack => kack,
kscan => ks,
kval => kval
);

end structure;

