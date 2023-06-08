library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use work.all;

entity OrComponent is
	port(
		a, b : in std_logic_vector(3 downto 0);
		f : out std_logic_vector(3 downto 0)
	);
	
end OrComponent;

architecture funcao of OrComponent is
	begin
		f <= a or b; --Or
end funcao;
