library ieee;
use ieee.std_logic_1164.all;

entity test_key_permutation_1 is
end entity test_key_permutation_1;

architecture behavior of test_key_permutation_1 is

   
    component key_permutation_1
        port (
            key: in std_logic_vector(63 downto 0);
            permuted_left_key: out std_logic_vector(27 downto 0);
            permuted_right_key: out std_logic_vector(27 downto 0)
        );
    end component;

   
    signal data_in: std_logic_vector(63 downto 0);
    signal permuted_left_half: std_logic_vector(27 downto 0);
    signal permuted_right_half: std_logic_vector(27 downto 0);

begin

   
    uut: key_permutation_1 port map (
            key => data_in,
            permuted_left_key => permuted_left_half,
            permuted_right_key => permuted_right_half
        );

    -- Test process
    testprocess: process
    begin
        -- Assigning a test value to `data_in`
        data_in <= "1101111000010000100111000101100011101000101001001010011000110000";
        wait for 10 ns;


    end process testprocess;

end architecture behavior;
