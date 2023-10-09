library ieee;
use ieee.std_logic_1164.all;
use ieee.STD_LOGIC_ARITH.all;

entity converter is
    port(
        clk: in std_logic;
        reset: in std_logic;
        v: in std_logic;
        minus_con: in std_logic;
        data: in std_logic_vector(4 downto 0);
        BCD_digit_1 : out std_logic_vector(3 downto 0);
        BCD_digit_2 : out std_logic_vector(3 downto 0);
        BCD_digit_3 : out std_logic_vector(3 downto 0)
    );
end converter;

architecture Structural of converter is
signal signal_integer1 : integer := 0;
signal signal_integer2 : integer := 0;
begin
    process(clk, reset)
        begin 
            if reset = '0' then
                BCD_digit_1 <= "0000";
                BCD_digit_2 <= "0000";
                BCD_digit_3 <= "1010";
            elsif rising_edge(clk) then
                if v = '1' then
                    BCD_digit_1 <= "1111";
                    BCD_digit_2 <= "1111";
                    BCD_digit_3 <= "1111";
                else
                    signal_integer1 <=  conv_integer(unsigned(data)) MOD 10;
                    signal_integer2 <=  (conv_integer(unsigned(data)) / 10) MOD 10;

                    BCD_digit_1 <= conv_std_logic_vector(signal_integer1, 4);
                    BCD_digit_2 <= conv_std_logic_vector(signal_integer2, 4);
                    
                    if (minus_con = '1') then -- if MSB is 1
                        BCD_digit_3 <= "1011"; -- minus
                    else
                        BCD_digit_3 <= "1010"; -- none
                    end if;
            end if;
        end if;
    end process;
end Structural;