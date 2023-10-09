LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.STD_LOGIC_ARITH.all;

ENTITY fivebitbinaryadder IS
generic (N : integer := 5);
	PORT (
		a, b : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		m, clock: IN STD_LOGIC;
		s : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		c : OUT STD_LOGIC_VECTOR(5 DOWNTO 1);
	v : OUT STD_LOGIC);
END fivebitbinaryadder;

ARCHITECTURE Structural OF fivebitbinaryadder IS
	COMPONENT fulladder IS
		PORT (
			x, y, z, clk : IN STD_LOGIC;
			s, c : OUT STD_LOGIC);
	END COMPONENT;
	SIGNAL c1, c2, c3, c4, c5 : STD_LOGIC;
BEGIN
	FA1 : fulladder
	PORT MAP(
		x => a(0),
		y => m XOR b(0),
		z => m,
		clk => clock,
		s => s(0),
		c => c1);
	FA2 : fulladder
	PORT MAP(
		x => a(1),
		y => m XOR b(1),
		z => c1,
		clk => clock,
		s => s(1),
		c => c2);
	FA3 : fulladder
	PORT MAP(
		x => a(2),
		y => m XOR b(2),
		z => c2,
		clk => clock,
		s => s(2),
		c => c3);
	FA4 : fulladder
	PORT MAP(
		x => a(3),
		y => m XOR b(3),
		z => c3,
		clk => clock,
		s => s(3),
		c => c4);
	FA5 : fulladder
	PORT MAP(
		x => a(4),
		y => m XOR b(4),
		z => c4,
		clk => clock,
		s => s(4),
		c => c5);
	v <= c4 xor c5;
		-- v <= '0';
END structural;






	-- FA1 : fulladder 
	-- PORT MAP(x => a(0),
	-- 		 y => m XOR b(0),
	-- 		 z => m,
	-- 		 clk => clock,
	-- 		 s => s(0),
	-- 		 c => c(1));
	-- FA2 : fulladder


























	-- entity fivebitbinaryadder is
	-- generic (N ;: integer := 5);
	-- port(x, y :in std_logic_vector(N-1 downto 0);
	-- 		z : in std_logic;
	-- 		s : out std_logic_vector(N-1 downto 0);
	-- 		c : out std_logic);
	-- end fivebitbinaryadder;

	-- architecture data_flow of fivebitbinaryadder is
	-- 	component fulladder is
	-- 		port(x, y, z :in std_logic;
	-- 			  	s, c :out std_logic);
	-- 	end component;
	-- signal x : std_logic_vector(N downto 0);
	-- 	begin
	-- 		x(0) <= z;
	-- 		gen_fulladder for j in 0 to N-1 generate
	-- 		gen_fulladder : fulladder port map(x(j), y(j), x(j+1), s(j);
	-- 		end generate;
	-- 		c <= x(N);
	-- 	end data_flow;

	-- -- make five bit binary adder using fulladder component in Structural architecture

	-- library ieee;
	-- use ieee.std_logic_1164.all;

	-- entity fulladder is
	-- port(x, y, z :in std_logic;
	-- 	  	s, c :out std_logic);
	-- end fulladder;

	-- architecture Structural of fulladder is
	-- 	component halfadder is
	-- 		port(x, y :in std_logic;
	-- 			  	s, c :out std_logic);
	-- 	end component;

	-- 	component or2 is
	-- 		port(x, y :in std_logic;
	-- 			  	z :out std_logic);
	-- 	end component;

	-- 	signal c1, c2, c3 :std_logic;

	-- begin
	-- 	h1 : halfadder port map(x, y, s, c1);
	-- 	h2 : halfadder port map(z, s, c, c2);
	-- 	o1 : or2 port map(c1, c2, c3);
	-- 	o2 : or2 port map(c3, z, c);
	-- end Structural;