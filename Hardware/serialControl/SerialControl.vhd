library ieee;
use ieee.std_logic_1164.all;

entity SerialControl is
port(
	rst: in std_logic;
	clk: in std_logic;
	enRx: in std_logic;
	accept: in std_logic;
	pFlag: in std_logic;
	dFlag: in std_logic;
	RXerror: in std_logic;
	wr: out std_logic;
	init: out std_logic;
	DXval: out std_logic
);
end SerialControl;

architecture behavioral of SerialControl is

type STATE_TYPE is (STATE_000, STATE_001, STATE_010, STATE_011, STATE_100);
signal CurrentState, NextState : STATE_TYPE;

begin

--Flip-Flop
CurrentState <= STATE_000 when rst ='1' else NextState when rising_edge(clk);

GenerateNextState:
process(CurrentState, enRX, dFlag, pFlag, RXerror, accept)
begin 

case CurrentState is
	when STATE_000 => if (enRX = '1') then
								NextState <= STATE_000;
							else 
								NextState <= STATE_001;
							end if;
							
	when STATE_001 => if (enRX = '1') then
								NextState <= STATE_000;
							else
								NextState <= STATE_010;
								end if;
	
	when STATE_010 => if (enRX = '1') then
								NextState <= STATE_000;
							elsif (dFlag = '0') then
								NextState <= STATE_010;
							else
								NextState <= STATE_011;
								end if;
	when STATE_011 => if (enRX = '1') then
								NextState <= STATE_000;
							elsif (pFlag = '0') then
								NextState <= STATE_011;
							elsif (RXerror = '1') then
								NextState <= STATE_000;
							else
								NextState <= STATE_100;
							end if;

	when STATE_100 => if (accept = '0') then
								NextState <= STATE_100;
							else 
								NextState <= STATE_000;
							end if;
							
	end case;
	
end process;




init <= '1' when (CurrentState = STATE_001) else '0';
wr <= '1' when (CurrentState = STATE_011 or CurrentState = STATE_100) else '0';
DXval <= '1' when (CurrentState = STATE_100) else '0';

end behavioral;
