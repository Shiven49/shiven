library ieee;
use ieee.std_logic_1164.all;

entity test_key_permutation_2 is
end entity test_key_permutation_2;

architecture behavior of test_key_permutation_2 is

    
    component key_permutation_2
        port (
            left_half: in std_logic_vector(27 downto 0);
            right_half: in std_logic_vector(27 downto 0);
            permuted_key: out std_logic_vector(47 downto 0)
        );
    end component;


    signal left_half: std_logic_vector(27 downto 0);
    signal right_half: std_logic_vector(27 downto 0);
    signal permuted_key: std_logic_vector(47 downto 0);

begin

   
    uut: key_permutation_2
        port map (
            left_half => left_half,
            right_half => right_half,
            permuted_key => permuted_key
        );

    -- Test process
    testprocess: process
    begin
        -- Test Case 
        left_half <= "1101111000010000100111000100";    -- Example 28-bit input
        right_half <="1010001010010010100110001111";   -- Example 28-bit input
        wait for 10 ns;


    end process testprocess;

end architecture behavior;
