library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use work.all;

entity AndComponent is
	port(
		a, b : in std_logic_vector(3 downto 0);
		f : out std_logic_vector(3 downto 0)
	);
	
end AndComponent;

architecture funcao of AndComponent is
	begin
		f <= a and b; --And
end funcao;
