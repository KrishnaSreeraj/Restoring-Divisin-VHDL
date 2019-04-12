library IEEE;
use IEEE.std_logic_1164.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
   
entity Boot is
	port(m,q: in std_logic_vector(4 downto 0);
         qu: out std_logic_vector(4 downto 0);
         r: out std_logic_vector(4 downto 0));
end Boot;
   
architecture boot of Boot is
	begin       
 		process(m,q)
             variable a: std_logic_vector(4 downto 0);
             variable s,c,d : std_logic_vector(4 downto 0);
             variable i:integer;

                begin
                    a := "00000";
                    s := m;
                    d(4 downto 0):=q;
                   
                    for i in 0 to 4 loop
                       a(4 downto 1) := a(3 downto 0);
  	                   a(0) := d(4);
                       d(4 downto 1):=d(3 downto 0);

					             c := a;
                       a(4 downto 0) := (c - s);
                       
                       if(a(4)='1') then
                     	    c :=a;
                        	a(4 downto 0) := (c+s);
                          d(0):='0';
                          
                       else
                         	d(0):='1';
                          
                       end if;
                                        					               
                    end loop;
                    
                    qu(4 downto 0) <= d(4 downto 0);
      				      r(4 downto 0) <= a(4 downto 0);
                   
      end process;
               
end boot;
