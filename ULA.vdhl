library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use work.all;

entity ULA is
	port(
		A, B : in std_logic_vector(3 downto 0);
		s : in std_logic_vector(1 downto 0);
		Z, C, V, N : out std_logic;
		F : out std_logic_vector(3 downto 0)
	);
end ULA;

architecture behavior of ULA is
	--COMPONENTES 
	component AndComponent --Recebe 2 números de 4 bits e retorna um número de 4 bits = (a and b)
		port(
			a, b : in std_logic_vector(3 downto 0);
			f : out std_logic_vector(3 downto 0)
		);
	end component AndComponent;
	
	component OrComponent --Recebe 2 números de 4 bits e retorna um número de 4 bits = (a or b)
		port(
			a, b : in std_logic_vector(3 downto 0);
			f : out std_logic_vector(3 downto 0)
		);
	end component OrComponent;
	
	component AdderComponent --Recebe 2 números de 4 bits e retorna um número de 4 bits = (a + b)
		port(
			a, b : in std_logic_vector(3 downto 0);
			sel : in std_logic;
			f : out std_logic_vector(3 downto 0);
			cout, overflow : out std_logic
		);
	end component AdderComponent;
	
	--SINAIS
	
	--resultados
	signal somaRes, subRes, andRes, orRes, fAux : std_logic_vector(3 downto 0);
	
	--soma flags
	signal somaCout, somaOverflow, somaZero, somaNeg: std_logic;
	--sub flags
	signal subCout, subOverflow, subZero, subNeg: std_logic;
	--and flags
	signal andZero, andNeg: std_logic;
	--or flags
	signal orZero, orNeg: std_logic;
	
	begin
	
		somador : AdderComponent port map(A, B, '0', somaRes, somaCout, somaOverflow);
		subtrator : AdderComponent port map(A, B, '1', subRes, subCout, subOverflow);
		circuitoAnd : AndComponent port map(A, B, andRes);
		circuitoOr : OrComponent port map(A, B, orRes);
		
		with s select
			fAux <= somaRes when "00",
				  subRes when "01", 
				  andRes when "10",
				  orRes when others;
				  
		with s select 
			C <= somaCout when "00",
				  subCout when "01",
				  '0' when others;
		
		with s select 
			V <= somaOverflow when "00",
				  subOverflow when "01",
				  '0' when others;
				  
		F <= fAux;
		N <= fAux(3);
		Z <= not(fAux(0) or fAux(1) or fAux(2) or fAux(3));
		
end behavior;
