library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity test_subkey_production is
end test_subkey_production;

architecture behavior of test_subkey_production is

    signal left_key_in: std_logic_vector(0 to 27);
    signal right_key_in: std_logic_vector(0 to 27);
    signal subkey: std_logic_vector(0 to 47);
    signal left_key_out: std_logic_vector(0 to 27);
    signal right_key_out: std_logic_vector(0 to 27);

begin

    -- Instantiate the subkey_production unit under test (UUT)
    uut: entity work.subkey_production
        generic map(shifting_parameter => "01")  -- Left shift by 1 position
        port map(
            left_key_in => left_key_in,
            right_key_in => right_key_in,
            subkey => subkey,
            left_key_out => left_key_out,
            right_key_out => right_key_out
        );

    -- Test process to apply input stimuli
    

end architecture behavior;
