LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY BinaryAdderSubtractorVHDL IS
    PORT (A : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    B : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
    M : IN STD_LOGIC;
    RST : IN STD_LOGIC;
    CLK : IN STD_LOGIC;

    SEVEN_SEG_1 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    SEVEN_SEG_2 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    SEVEN_SEG_3 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
END BinaryAdderSubtractorVHDL;

architecture Structural of BinaryAdderSubtractorVHDL is
signal S : STD_LOGIC_VECTOR (4 DOWNTO 0);
signal V : std_logic;
signal Mi : std_logic;
signal O : std_logic_vector (4 DOWNTO 0);
signal seven_seg_signal_1 : std_logic_vector (3 DOWNTO 0);
signal seven_seg_signal_2 : std_logic_vector (3 DOWNTO 0);
signal seven_seg_signal_3 : std_logic_vector (3 DOWNTO 0);

begin
    Fivebitbinaryadder : entity work.fivebitbinaryadder(Structural)
        port map(
            a => A,
            b => B,
            m => NOT M,
            s => S,
            v => V,
            clock => CLK);
    
    signdetector : entity work.signdetector(Structural)
        port map (
            s_detect => S,
            o => O,
            minus => Mi,
            clk => CLK);

    converter : entity work.converter(Structural)
        port map (
            data => O,
            v => V,
            clk => CLK,
            reset => RST,
            minus_con => Mi,
            BCD_digit_1 => seven_seg_signal_1,
            BCD_digit_2 => seven_seg_signal_2,
            BCD_digit_3 => seven_seg_signal_3);

    sevenseg1 : entity work.BCD_to_7_segment(data_process)
        port map (
            BCD_i => seven_seg_signal_1,
            clk_i => CLK,
            seven_seg => SEVEN_SEG_1);
        
    sevenseg2 : entity work.BCD_to_7_segment(data_process)
        port map (
            BCD_i => seven_seg_signal_2,
            clk_i => CLK,
            seven_seg => SEVEN_SEG_2);

    sevenseg3 : entity work.BCD_to_7_segment(data_process)
        port map (
            BCD_i => seven_seg_signal_3,
            clk_i => CLK,
            seven_seg => SEVEN_SEG_3);

end Structural;
