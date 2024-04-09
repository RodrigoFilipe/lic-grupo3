library ieee;
use ieee.std_logic_1164.all;

entity ParityCheck is
port(
	data: in std_logic;
	init: in std_logic;
	clk: in std_logic;
	err: out std_logic
);
end ParityCheck;

architecture structure of ParityCheck is

component Cont is
port(
	R: in std_logic;
	CE: in std_logic;
	Clk: in std_logic;
	Q: out std_logic
);
end component;

begin

counter: Cont port map(
	R => init,
	CE => data,
	Clk => clk,
	Q => err
);

end structure;


