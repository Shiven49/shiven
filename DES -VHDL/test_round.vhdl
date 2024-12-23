library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity test_round is
end test_round;

architecture behavior of test_round is

    -- Signals for inputs and outputs
    signal left_plain: std_logic_vector(0 to 31);
    signal right_plain: std_logic_vector(0 to 31);
    signal subkey: std_logic_vector(0 to 47);
    signal left_data_out: std_logic_vector(0 to 31);
    signal right_data_out: std_logic_vector(0 to 31);

    -- Component declaration for the round entity
    component round
        port(
            left_plain: in std_logic_vector(0 to 31);
            right_plain: in std_logic_vector(0 to 31);
            subkey: in std_logic_vector(0 to 47);
            left_data_out: out std_logic_vector(0 to 31);
            right_data_out: out std_logic_vector(0 to 31)
        );
    end component;

begin

    -- Instantiating the round component
    uut: round
        port map(
            left_plain => left_plain,
            right_plain => right_plain,
            subkey => subkey,
            left_data_out => left_data_out,
            right_data_out => right_data_out
        );

    -- Stimulus process
   

end architecture behavior;
