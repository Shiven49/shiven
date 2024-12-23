library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test_f is
end test_f;

architecture behavior of test_f is

    -- Signals for testing
    signal data_in  : std_logic_vector(0 to 31) := (others => '0');
    signal key      : std_logic_vector(0 to 47) := (others => '0');
    signal data_out : std_logic_vector(0 to 31);

    -- Component Declaration for f
    component f
        port(
            data_in  : in  std_logic_vector(0 to 31);
            key      : in  std_logic_vector(0 to 47);
            data_out : out std_logic_vector(0 to 31)
        );
    end component;

begin

    -- Instantiate f component in the testbench
    uut: f 
        port map (
            data_in  => data_in,
            key      => key,
            data_out => data_out
        );

    -- Test Process
   

end architecture behavior;
