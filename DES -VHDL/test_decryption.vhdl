library ieee;

use ieee.std_logic_1164.all;

use work.all;

entity test_decryption is
end test_decryption;


architecture behavior of test_decryption is

	signal data_in: std_logic_vector(0 to 63);
	signal key: std_logic_vector(0 to 63);
	signal data_out: std_logic_vector(0 to 63);

begin

	uut:entity decrypt port map(data_in,key,data_out);
	end behavior;
