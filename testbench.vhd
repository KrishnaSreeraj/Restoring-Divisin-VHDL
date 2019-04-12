library IEEE;
use IEEE.std_logic_1164.all;
entity testbench is

end testbench; 

architecture tb of testbench is
component Boot is
	port(m,q: in std_logic_vector(4 downto 0);
         qu,r: out std_logic_vector(4 downto 0));
end component;

signal divisor,dividend : std_logic_vector(4 downto 0);
signal quotient,remainder : std_logic_vector(4 downto 0);
signal clk : std_logic :='0';
begin
 
  BA1: Boot port map(divisor,dividend,quotient,remainder);
  process
   begin
    
    divisor<="00100";
    dividend<="01110";
    wait for 0.5ns;

    divisor<="00011";
    dividend<="01000";
    wait for 0.5ns;

    divisor<="01000";
    dividend<="10000";
    wait for 0.5ns;

    divisor<="00110";
    dividend<="01110";
    wait for 0.5ns;

    wait;
  end process;
end tb;
