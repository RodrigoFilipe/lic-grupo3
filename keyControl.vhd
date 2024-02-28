library ieee;
use ieee.std_logic_1164.all;

entity keyControl is
port(
	clk: in std_logic;
	rst: in std_logic;
	kpress: in std_logic;
	kack: in std_logic;
	kscan: out std_logic;
	kval: out std_logic
	);
	
end keyControl;

architecture behavioral of keyControl is

type STATE_TYPE is (STATE_00, STATE_01, STATE_10);
signal CurrentState, NextState : STATE_TYPE;

begin

--Flip-Flop
CurrentState <= STATE_00 when rst ='1' else NextState when rising_edge(clk);

GenerateNextState:
process(CurrentState, kack, kpress)
	begin 
	
case CurrentState is
	when STATE_00 => if (kpress = '0' or kack = '1') then
								NextState <= STATE_00;
							else 
								NextState <= STATE_01;
							end if;
							
	when STATE_01 => if( kack = '0') then
								NextState <= STATE_01;
							else
								NextState <= STATE_10;
							end if;
							
	when STATE_10 => if(kpress = '1') then
								NextState <= STATE_10;
							else
								NextState <= STATE_00;
							end if;
							
							
	end case;
	
end process;
					
kscan <= '1' when (CurrentState = STATE_00) else '0';
kval <= '1' when (CurrentState = STATE_01) else '0';

end behavioral;	
	
