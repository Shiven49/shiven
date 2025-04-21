library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;
use work.aes_pkg.all;

entity tb_aes_top is
end entity;

architecture tb_arch of tb_aes_top is
  -- DUT Ports
  signal plaintext  : DATA_BLOCK;
  signal input_key  : DATA_BLOCK;
  signal ciphertext : DATA_BLOCK;
  signal clk        : std_logic := '0';
  signal reset      : std_logic := '1';

  -- DUT component
  component aes_top
    port (
      clk         : in std_logic;
      reset       : in std_logic;
      plaintext   : in  DATA_BLOCK;
      input_key   : in  DATA_BLOCK;
      ciphertext  : out DATA_BLOCK
    );
  end component;

begin
  -- Instantiate the DUT
  uut: aes_top
    port map (
      clk         => clk,
      reset       => reset,
      plaintext   => plaintext,
      input_key   => input_key,
      ciphertext  => ciphertext
    );

  -- Clock generation process
  clk_process: process
  begin
    while true loop
      clk <= '1';
      wait for 5 ns;
      clk <= '0';
      wait for 5 ns;
    end loop;
  end process;

   -- Stimulus process
  stimulus: process
  begin
    -- Apply reset
    reset <= '1';

    -- Set up inputs during reset
    plaintext <= (
      (X"01", X"89", X"FE", X"76"),
      (X"23", X"AB", X"DC", X"54"),
      (X"45", X"CD", X"BA", X"32"),
      (X"67", X"EF", X"98", X"10")
    );

    input_key <= (
      (X"0F", X"47", X"1C", X"AF"),
      (X"15", X"D9", X"B7", X"7F"),
      (X"71", X"E8", X"AD", X"67"),
      (X"C9", X"59", X"D6", X"98")
    );

    wait for 20 ns;  -- let reset propagate with input stable
    reset <= '0';

    -- Wait for encryption to complete
    wait for 500 ns;  -- adjust based on your round logic

    wait;
  end process;


end architecture;
