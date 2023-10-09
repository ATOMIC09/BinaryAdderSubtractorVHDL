LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_signed.ALL;

ENTITY signdetector IS
    PORT (
        s_detect : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        clk : IN STD_LOGIC;
        minus : OUT STD_LOGIC;
        o : OUT STD_LOGIC_VECTOR(4 DOWNTO 0));
END signdetector;

ARCHITECTURE Structural OF signdetector IS
    SIGNAL complemented : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL plusone : STD_LOGIC_VECTOR(4 DOWNTO 0) := (0 => '1', OTHERS => '0');

BEGIN
    adder : ENTITY work.fivebitbinaryadder(Structural) 
        PORT MAP(
            a => NOT s_detect,
            b => plusone,
            m => '0',
            clock => clk,
            s => complemented -- complemented is the output of the adder
        );
        -- Bypass
        -- o <= s_detect;

        -- PORT MAP(
        --     x => NOT s,
        --     y => plusone,
        --     z => '0',
        --     s => complemented
        -- );
        -- Select the output
        minus <= s_detect(4);
        
        WITH s_detect(4) SELECT -- Detect MSB
        o <= s_detect when '0', -- If MSB is 0, output is s_detect
        complemented when others;  -- If MSB is 1, output is complemented

        
END Structural;