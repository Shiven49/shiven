library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_swap is
-- No ports required for testbench
end tb_swap;

architecture Behavioral of tb_swap is
    -- Component declaration
    component swap_left_right_64_bits is
        port(
            data_in_left: in std_logic_vector(31 downto 0);  -- 32-bit input left half
            data_in_right: in std_logic_vector(31 downto 0); -- 32-bit input right half
            data_out_left: out std_logic_vector(31 downto 0); -- Swapped output left half
            data_out_right: out std_logic_vector(31 downto 0) -- Swapped output right half
        );
    end component;

    -- Signals for testbench
    signal data_in_left_tb: std_logic_vector(31 downto 0);
    signal data_in_right_tb: std_logic_vector(31 downto 0);
    signal data_out_left_tb: std_logic_vector(31 downto 0);
    signal data_out_right_tb: std_logic_vector(31 downto 0);

begin
    -- Instantiate the swap component
    l1: swap_left_right_64_bits 
        port map(
            data_in_left => data_in_left_tb,  -- Map testbench signals
            data_in_right => data_in_right_tb,
            data_out_left => data_out_left_tb,
            data_out_right => data_out_right_tb
        );
        end behavioral;