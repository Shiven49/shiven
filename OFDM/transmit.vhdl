library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity OFDM_Transmitter is
    Generic (
        N           : integer := 64;  -- Number of subcarriers
        CP_LENGTH   : integer := 16   -- Cyclic prefix length
    );
    Port (
        clk         : in  std_logic;                            -- Clock signal
        reset       : in  std_logic;                            -- Reset signal
        data_in     : in  std_logic_vector((2*N)-1 downto 0);   -- Input bits (2 bits per subcarrier for QPSK)
        tx_enable   : in  std_logic;                            -- Enable signal for transmission
        data_out    : out std_logic_vector(15 downto 0);        -- Serial output OFDM signal
        data_ready  : out std_logic                             -- Output ready signal
    );
end OFDM_Transmitter;
