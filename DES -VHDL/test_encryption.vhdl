library ieee;
use ieee.std_logic_1164.all;

entity encrypt_tb is
-- Test bench has no ports
end encrypt_tb;

architecture behavior of encrypt_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component encrypt
        port(
            data_in: in std_logic_vector(0 to 63);
            key: in std_logic_vector(0 to 63);
            data_out: out std_logic_vector(0 to 63)
        );
    end component;

    -- Testbench Signals
    signal tb_data_in: std_logic_vector(0 to 63);
    signal tb_key: std_logic_vector(0 to 63);
    signal tb_data_out: std_logic_vector(0 to 63);

    -- Clock and reset signals (if needed in the main design)
    

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: encrypt
        port map(
            data_in => tb_data_in,
            key => tb_key,
            data_out => tb_data_out
        );

	
	
end architecture behavior;
