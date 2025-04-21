library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;
use work.aes_pkg.all;

entity add_round_key is
  port (
    clk          : in  std_logic;
    reset        : in  std_logic;
    data_in      : in  DATA_BLOCK;
    cipher_block : in  DATA_BLOCK;
    data_out     : out DATA_BLOCK
  );
end entity add_round_key;

architecture rtl of add_round_key is
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if reset = '1' then
     data_out <= (others => (others => "00000000"));
      else
        for i in 0 to 3 loop
          for j in 0 to 3 loop
            data_out(i, j) <= data_in(i, j) xor cipher_block(i, j);
          end loop;
        end loop;
      end if;
    end if;
  end process;
end architecture rtl;

