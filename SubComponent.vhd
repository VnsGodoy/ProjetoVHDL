library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use work.all;

entity SubComponent is
	port(
		a, b : in std_logic_vector(3 downto 0);
		f : out std_logic_vector(3 downto 0);
		cout : out std_logic
	);
	
end SubComponent;

architecture funcao of SubComponent is

	signal soma : std_logic_vector(4 downto 0); --resultado com 5 bits

	begin
		soma <= ('0' & a) + (-('1' & b)); --soma com o segundo negado para complemento de 2
		f <= soma(3 downto 0); -- resultado sao os 4 bits menos significativos
		cout <= soma(4); --carry out é o bit mais signficativo
end funcao;
