-- 
-- Politecnico di Milano
-- Code created using PandA - Version: PandA 0.9.6 - Revision 891ec3caed502474cab0813cc4a9fc678deabaa5 - Date 2021-02-11T19:43:56
-- bambu executed with: bambu -I. --simulate --simulator=VERILATOR -wH frst.c 
-- 
-- Send any bug to: panda-info@polimi.it
-- ************************************************************************
-- The following text holds for all the components tagged with PANDA_LGPLv3.
-- They are all part of the BAMBU/PANDA IP LIBRARY.
-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public
-- License as published by the Free Software Foundation; either
-- version 3 of the License, or (at your option) any later version.
-- 
-- This library is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
-- 
-- You should have received a copy of the GNU Lesser General Public
-- License along with the PandA framework; see the files COPYING.LIB
-- If not, see <http://www.gnu.org/licenses/>.
-- ************************************************************************


library IEEE;
use IEEE.numeric_std.all;

package panda_pkg is
   function resize_signed(input : signed; size : integer) return signed;
end;

package body panda_pkg is
   function resize_signed(input : signed; size : integer) return signed is
   begin
     if (size > input'length) then
       return resize(input, size);
     else
       return input(size-1+input'right downto input'right);
     end if;
   end function;
end package body;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Christian Pilato <christian.pilato@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity constant_value is 
generic(
 BITSIZE_out1: integer;
 value: std_logic_vector);
port (
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end constant_value;

architecture constant_value_arch of constant_value is
  begin
   out1 <= value;
end constant_value_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity register_SE is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  clock : in std_logic;
  reset : in std_logic;
  in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
  wenable : in std_logic;
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end register_SE;

architecture register_SE_arch of register_SE is
  
  signal reg_out1 : std_logic_vector(BITSIZE_out1-1 downto 0) := (others => '0');
  begin
    out1 <= reg_out1;
    process(clock)
    begin
      if(clock'event and clock = '1') then
        if(wenable = '1') then
          reg_out1 <= in1;
        end if;
      end if;
    end process;

end register_SE_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ARRAY_1D_STD_DISTRAM_NN_SDS is 
generic(
 BITSIZE_in1: integer;
 PORTSIZE_in1: integer;
 BITSIZE_in2: integer;
 PORTSIZE_in2: integer;
 BITSIZE_in3: integer;
 PORTSIZE_in3: integer;
 BITSIZE_in4: integer;
 PORTSIZE_in4: integer;
 BITSIZE_sel_LOAD: integer;
 PORTSIZE_sel_LOAD: integer;
 BITSIZE_sel_STORE: integer;
 PORTSIZE_sel_STORE: integer;
 BITSIZE_S_oe_ram: integer;
 PORTSIZE_S_oe_ram: integer;
 BITSIZE_S_we_ram: integer;
 PORTSIZE_S_we_ram: integer;
 BITSIZE_out1: integer;
 PORTSIZE_out1: integer;
 BITSIZE_S_addr_ram: integer;
 PORTSIZE_S_addr_ram: integer;
 BITSIZE_S_Wdata_ram: integer;
 PORTSIZE_S_Wdata_ram: integer;
 BITSIZE_Sin_Rdata_ram: integer;
 PORTSIZE_Sin_Rdata_ram: integer;
 BITSIZE_Sout_Rdata_ram: integer;
 PORTSIZE_Sout_Rdata_ram: integer;
 BITSIZE_S_data_ram_size: integer;
 PORTSIZE_S_data_ram_size: integer;
 BITSIZE_Sin_DataRdy: integer;
 PORTSIZE_Sin_DataRdy: integer;
 BITSIZE_Sout_DataRdy: integer;
 PORTSIZE_Sout_DataRdy: integer;
 MEMORY_INIT_file: string;
 n_elements: integer;
 data_size: integer;
 address_space_begin: integer;
 address_space_rangesize: integer;
 BUS_PIPELINED: integer;
 BRAM_BITSIZE: integer;
 PRIVATE_MEMORY: integer;
 READ_ONLY_MEMORY: integer;
 USE_SPARSE_MEMORY: integer;
 BITSIZE_proxy_in1: integer;
 PORTSIZE_proxy_in1: integer;
 BITSIZE_proxy_in2: integer;
 PORTSIZE_proxy_in2: integer;
 BITSIZE_proxy_in3: integer;
 PORTSIZE_proxy_in3: integer;
 BITSIZE_proxy_sel_LOAD: integer;
 PORTSIZE_proxy_sel_LOAD: integer;
 BITSIZE_proxy_sel_STORE: integer;
 PORTSIZE_proxy_sel_STORE: integer;
 BITSIZE_proxy_out1: integer;
 PORTSIZE_proxy_out1: integer);
port (
  -- IN
  clock : in std_logic;
  reset : in std_logic;
  in1 : in std_logic_vector((PORTSIZE_in1*BITSIZE_in1)+(-1) downto 0) ;
  in2 : in std_logic_vector((PORTSIZE_in2*BITSIZE_in2)+(-1) downto 0) ;
  in3 : in std_logic_vector((PORTSIZE_in3*BITSIZE_in3)+(-1) downto 0) ;
  in4 : in std_logic_vector((PORTSIZE_in4*BITSIZE_in4)-1 downto 0) ;
  sel_LOAD : in std_logic_vector((PORTSIZE_sel_LOAD*BITSIZE_sel_LOAD)-1 downto 0) ;
  sel_STORE : in std_logic_vector((PORTSIZE_sel_STORE*BITSIZE_sel_STORE)-1 downto 0) ;
  S_oe_ram : in std_logic_vector((PORTSIZE_S_oe_ram*BITSIZE_S_oe_ram)-1 downto 0) ;
  S_we_ram : in std_logic_vector((PORTSIZE_S_we_ram*BITSIZE_S_we_ram)-1 downto 0) ;
  S_addr_ram : in std_logic_vector((PORTSIZE_S_addr_ram*BITSIZE_S_addr_ram)+(-1) downto 0) ;
  S_Wdata_ram : in std_logic_vector((PORTSIZE_S_Wdata_ram*BITSIZE_S_Wdata_ram)+(-1) downto 0) ;
  Sin_Rdata_ram : in std_logic_vector((PORTSIZE_Sin_Rdata_ram*BITSIZE_Sin_Rdata_ram)+(-1) downto 0) ;
  S_data_ram_size : in std_logic_vector((PORTSIZE_S_data_ram_size*BITSIZE_S_data_ram_size)+(-1) downto 0) ;
  Sin_DataRdy : in std_logic_vector((PORTSIZE_Sin_DataRdy*BITSIZE_Sin_DataRdy)-1 downto 0) ;
  proxy_in1 : in std_logic_vector((PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1) downto 0) ;
  proxy_in2 : in std_logic_vector((PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1) downto 0) ;
  proxy_in3 : in std_logic_vector((PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1) downto 0) ;
  proxy_sel_LOAD : in std_logic_vector((PORTSIZE_proxy_sel_LOAD*BITSIZE_proxy_sel_LOAD)-1 downto 0) ;
  proxy_sel_STORE : in std_logic_vector((PORTSIZE_proxy_sel_STORE*BITSIZE_proxy_sel_STORE)-1 downto 0) ;
  -- OUT
  out1 : out std_logic_vector((PORTSIZE_out1*BITSIZE_out1)+(-1) downto 0) ;
  Sout_Rdata_ram : out std_logic_vector((PORTSIZE_Sout_Rdata_ram*BITSIZE_Sout_Rdata_ram)+(-1) downto 0) ;
  Sout_DataRdy : out std_logic_vector((PORTSIZE_Sout_DataRdy*BITSIZE_Sout_DataRdy)-1 downto 0) ;
  proxy_out1 : out std_logic_vector((PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1) downto 0) 

);
end ARRAY_1D_STD_DISTRAM_NN_SDS;

architecture ARRAY_1D_STD_DISTRAM_NN_SDS_arch of ARRAY_1D_STD_DISTRAM_NN_SDS is
    function integer_ternary_operator(cond : boolean; op1 : integer; op2 : integer) return integer is
    begin
      if cond then
        return op1;
      else
        return op2;
      end if;
    end integer_ternary_operator;
  
    constant n_byte_data                   : integer := BRAM_BITSIZE/8;
    constant n_bytes                       : integer := n_elements*n_byte_data;
    constant n_byte_on_databus             : integer := BRAM_BITSIZE/8;
    constant n_mem_elements                : integer := n_bytes/n_byte_on_databus + integer_ternary_operator(n_bytes mod (n_byte_on_databus) = 0, 0, 1);
    constant nbit_addr                     : integer := integer_ternary_operator(BITSIZE_in2 > BITSIZE_proxy_in2, BITSIZE_in2, BITSIZE_proxy_in2);
    constant nbits_byte_offset             : integer := integer_ternary_operator(n_byte_on_databus=1, 0, integer(ceil(log2(real(n_byte_on_databus)))));
    constant nbit_read_addr                : integer := integer_ternary_operator(n_mem_elements = 1, 1, integer(ceil(log2(real(n_mem_elements)))));
    constant max_n_writes                  : integer := PORTSIZE_sel_STORE;
    constant max_n_reads                   : integer := PORTSIZE_sel_LOAD;
    constant max_n_rw                      : integer := integer_ternary_operator(max_n_writes > max_n_reads, max_n_writes, max_n_reads);
  
    signal bram_write : std_logic_vector(max_n_writes-1 downto 0);
  
    signal memory_addr_a : std_logic_vector(nbit_read_addr*max_n_rw-1 downto 0);
  
    signal din_value_aggregated : std_logic_vector(data_size*max_n_writes-1 downto 0);
    signal dout_a : std_logic_vector(data_size*max_n_reads-1 downto 0);
    signal tmp_addr : std_logic_vector(nbit_addr*max_n_rw-1 downto 0);
    signal relative_addr : std_logic_vector(nbit_addr*max_n_rw-1 downto 0);
  
    type mem_type is array (n_elements-1 downto 0) of std_logic_vector(data_size-1 downto 0);
  
    impure function InitMemFromFile (MemFileName : in string) return mem_type is
      FILE memfile : text open READ_MODE is MemFileName;
      variable MemFileLine : line;
      variable mem : mem_type;
      begin
         for i in 0 to n_elements-1 loop
          readline(memfile, MemFileLine);
          read(MemFileLine, mem(i));
        end loop;
        return mem;
    end function;
  
    signal mem : mem_type := InitMemFromFile(MEMORY_INIT_file);
  
  begin
    Lind2 : process(proxy_sel_LOAD, proxy_sel_STORE,proxy_in2,in2)
    begin
      for ind2 in 0 to max_n_rw-1 loop
        if ((proxy_sel_LOAD(ind2) or proxy_sel_STORE(ind2)) = '1') then
          tmp_addr((ind2+1)*nbit_addr-1 downto ind2 * nbit_addr) <= proxy_in2((ind2+1)*BITSIZE_proxy_in2-1 downto ind2*BITSIZE_proxy_in2);
        else
          tmp_addr((ind2+1)*nbit_addr-1 downto ind2 * nbit_addr) <= in2((ind2+1)*BITSIZE_in2-1 downto ind2*BITSIZE_in2);
        end if;
      end loop;
    end process;
  
    L6 : process(tmp_addr)
    begin
      for i6 in 0 to max_n_rw-1 loop
        if(USE_SPARSE_MEMORY=1) then
          relative_addr((i6)*nbit_addr+nbit_addr-1 downto i6*nbit_addr) <= tmp_addr((i6)*nbit_addr+nbit_addr-1 downto i6*nbit_addr);
        else
          relative_addr((i6+1)*nbit_addr-1 downto i6*nbit_addr) <= std_logic_vector(resize(unsigned(tmp_addr), nbit_addr) - to_unsigned(address_space_begin, nbit_addr));
        end if;
      end loop;
    end process;
  
    L7_A : process(relative_addr)
    begin
      for i7 in 0 to max_n_rw-1 loop
        if(n_mem_elements=1) then
          memory_addr_a((i7+1)*nbit_read_addr-1 downto i7*nbit_read_addr) <= (others => '0');
        else
          memory_addr_a((i7+1)*nbit_read_addr-1 downto i7*nbit_read_addr) <= relative_addr(nbit_read_addr+nbits_byte_offset-1+i7*nbit_addr downto nbits_byte_offset+i7*nbit_addr);
        end if;
      end loop;
    end process;
  
    L14 : process(proxy_sel_STORE,proxy_in1,in1)
    begin
      for i14 in 0 to max_n_reads-1 loop
        if(proxy_sel_STORE(i14)='1') then
          din_value_aggregated((i14+1)*data_size-1 downto i14*data_size) <= std_logic_vector(resize(unsigned(proxy_in1((i14+1)*BITSIZE_proxy_in1-1 downto i14*BITSIZE_proxy_in1)), data_size));
        else
          din_value_aggregated((i14+1)*data_size-1 downto i14*data_size) <= in1((i14+1)*BITSIZE_in1-1 downto i14*BITSIZE_in1);
        end if;
      end loop;
    end process;
  
    asynchronous_read : process(mem, memory_addr_a)
    begin
       for i11 in 0 to max_n_reads-1 loop
          if(to_integer(unsigned(memory_addr_a((i11+1)*nbit_read_addr-1 downto nbit_read_addr*i11))) < n_mem_elements) then
             dout_a((i11+1)*data_size-1 downto data_size*i11) <= mem(to_integer(unsigned(memory_addr_a((i11+1)*nbit_read_addr-1 downto nbit_read_addr*i11))));
          else
             dout_a((i11+1)*data_size-1 downto data_size*i11) <= (others => 'X');
          end if;
  
      end loop;
    end process;
  
    L12_single_write : process(clock)
    begin
      if (clock'event and clock='1') then
         if(READ_ONLY_MEMORY=0) then
          for index2 in 0 to max_n_writes-1 loop
            if(bram_write(index2)='1') then
              mem(to_integer(unsigned(memory_addr_a((index2+1)*nbit_read_addr-1 downto index2*nbit_read_addr)))) <= din_value_aggregated((index2+1)*data_size-1 downto index2*data_size);
            end if;
          end loop;
        end if;
      end if;
    end process;
  
    L21 : process (sel_STORE, proxy_sel_STORE, in4)
    begin
      for i21 in 0 to max_n_writes-1 loop
        bram_write(i21) <= (sel_STORE(i21) and in4(i21)) or proxy_sel_STORE(i21);
      end loop;
    end process;
  
    L20 : process(dout_a)
    begin
      for i20 in 0 to max_n_reads-1 loop
        out1((i20+1)*BITSIZE_out1-1 downto i20*BITSIZE_out1) <= dout_a((i20+1)*data_size-1 downto i20*data_size);
        proxy_out1((i20+1)*BITSIZE_proxy_out1-1 downto i20*BITSIZE_proxy_out1) <= std_logic_vector(resize(unsigned(dout_a((i20+1)*data_size-1 downto i20*data_size)), BITSIZE_proxy_out1));
      end loop;
    end process;
  
    Sout_Rdata_ram <= Sin_Rdata_ram;
    Sout_DataRdy <= Sin_DataRdy;

end ARRAY_1D_STD_DISTRAM_NN_SDS_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity addr_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end addr_expr_FU;

architecture addr_expr_FU_arch of addr_expr_FU is
  begin
   out1 <= std_logic_vector(resize(unsigned(in1), BITSIZE_out1));

end addr_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity UUdata_converter_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end UUdata_converter_FU;

architecture UUdata_converter_FU_arch of UUdata_converter_FU is
  begin
  out1 <= std_logic_vector(resize(unsigned(in1), BITSIZE_out1));
end UUdata_converter_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity register_STD is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  clock : in std_logic;
  reset : in std_logic;
  in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
  wenable : in std_logic;
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end register_STD;

architecture register_STD_arch of register_STD is
  
  signal reg_out1 : std_logic_vector(BITSIZE_out1-1 downto 0) := (others => '0');
  begin
  out1 <= reg_out1;
  process(clock)
  begin
    if(clock'event and clock = '1') then
      reg_out1 <= in1;
    end if;
  end process;

end register_STD_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity UIdata_converter_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in unsigned (BITSIZE_in1-1 downto 0);
  -- OUT
  out1 : out signed (BITSIZE_out1-1 downto 0)

);
end UIdata_converter_FU;

architecture UIdata_converter_FU_arch of UIdata_converter_FU is
  begin
    process(in1)
    begin
      if(BITSIZE_out1 > BITSIZE_in1) then
        out1 <= signed(resize(in1, BITSIZE_out1));
      else
        out1 <= signed(in1 (BITSIZE_out1-1 downto 0));
      end if;
    end process;
end UIdata_converter_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity IUdata_converter_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in signed (BITSIZE_in1-1 downto 0);
  -- OUT
  out1 : out unsigned (BITSIZE_out1-1 downto 0)

);
end IUdata_converter_FU;

architecture IUdata_converter_FU_arch of IUdata_converter_FU is
  begin
    process(in1)
    begin
      if(BITSIZE_out1 <= BITSIZE_in1) then
        out1 <= unsigned(in1(BITSIZE_out1-1 downto 0));
      else
        out1 <= unsigned(resize(in1, BITSIZE_out1));
      end if;
    end process;
end IUdata_converter_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity read_cond_FU is 
generic(
 BITSIZE_in1: integer);
port (
  -- IN
  in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
  -- OUT
  out1 : out std_logic

);
end read_cond_FU;

architecture read_cond_FU_arch of read_cond_FU is
  constant zeroes : std_logic_vector(in1'range) := (others => '0'); 
  constant xs : std_logic_vector(in1'range) := (others => 'X');
   begin out1 <= 'X' when in1 = xs else '1' when in1 /= zeroes else '0';
end read_cond_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity gt_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in signed (BITSIZE_in1-1 downto 0);
  in2 : in signed (BITSIZE_in2-1 downto 0);
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end gt_expr_FU;

architecture gt_expr_FU_arch of gt_expr_FU is
  begin
  out1 <= std_logic_vector(resize(to_unsigned(1, BITSIZE_out1), BITSIZE_out1))  when (signed(in1) > signed(in2)) else (others => '0');
end gt_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ui_bit_and_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in unsigned (BITSIZE_in1-1 downto 0);
  in2 : in unsigned (BITSIZE_in2-1 downto 0);
  -- OUT
  out1 : out unsigned (BITSIZE_out1-1 downto 0)

);
end ui_bit_and_expr_FU;

architecture ui_bit_and_expr_FU_arch of ui_bit_and_expr_FU is
  begin
  out1 <= resize(in1, BITSIZE_out1) and resize(in2, BITSIZE_out1);
end ui_bit_and_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ui_cond_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_in3: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
  in2 : in unsigned (BITSIZE_in2-1 downto 0);
  in3 : in unsigned (BITSIZE_in3-1 downto 0);
  -- OUT
  out1 : out unsigned (BITSIZE_out1-1 downto 0)

);
end ui_cond_expr_FU;

architecture ui_cond_expr_FU_arch of ui_cond_expr_FU is
  constant zeroes : std_logic_vector(in1'range) := (others => '0');
  begin
    out1 <= resize(in2, BITSIZE_out1) when (in1 /= zeroes) else resize(in3, BITSIZE_out1);

end ui_cond_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ui_eq_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in unsigned (BITSIZE_in1-1 downto 0);
  in2 : in unsigned (BITSIZE_in2-1 downto 0);
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end ui_eq_expr_FU;

architecture ui_eq_expr_FU_arch of ui_eq_expr_FU is
  begin
    out1 <= std_logic_vector(resize(to_unsigned(1, BITSIZE_out1), BITSIZE_out1)) when (in1 = in2) else (others => '0');

end ui_eq_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ui_ge_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in unsigned (BITSIZE_in1-1 downto 0);
  in2 : in unsigned (BITSIZE_in2-1 downto 0);
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end ui_ge_expr_FU;

architecture ui_ge_expr_FU_arch of ui_ge_expr_FU is
  begin
  out1(0) <= '1' when (unsigned(in1) >= unsigned(in2)) else '0';
end ui_ge_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ui_ne_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in unsigned (BITSIZE_in1-1 downto 0);
  in2 : in unsigned (BITSIZE_in2-1 downto 0);
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end ui_ne_expr_FU;

architecture ui_ne_expr_FU_arch of ui_ne_expr_FU is
  signal xs1 : unsigned(in1'range) := (others => 'X');
  signal xs2 : unsigned(in2'range) := (others => 'X');
  begin
    out1 <= (others => 'X') when (not((in1 >= in2) or (in1 <= in2))) else std_logic_vector(resize(to_unsigned(1, BITSIZE_out1), BITSIZE_out1)) when (in1 /= in2) else (others => '0');

end ui_ne_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ui_plus_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in unsigned (BITSIZE_in1-1 downto 0);
  in2 : in unsigned (BITSIZE_in2-1 downto 0);
  -- OUT
  out1 : out unsigned (BITSIZE_out1-1 downto 0)

);
end ui_plus_expr_FU;

architecture ui_plus_expr_FU_arch of ui_plus_expr_FU is
    signal resized_in1 : unsigned(BITSIZE_out1-1 downto 0);
    signal resized_in2 : unsigned(BITSIZE_out1-1 downto 0);
    begin
      process(in1,in2,resized_in1,resized_in2)
      begin
        if(BITSIZE_out1 <= BITSIZE_in1) then
          resized_in1 <= in1(BITSIZE_out1-1 downto 0);
        else
          resized_in1 <= resize(in1, BITSIZE_out1);
        end if;
        if(BITSIZE_out1 < BITSIZE_in2) then
          resized_in2 <= in2(BITSIZE_out1-1 downto 0);
        else
          resized_in2 <= resize(in2, BITSIZE_out1);
        end if;
        out1 <= resized_in1 + resized_in2;
      end process;

end ui_plus_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ui_pointer_plus_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer;
 LSB_PARAMETER: integer);
port (
  -- IN
  in1 : in unsigned (BITSIZE_in1-1 downto 0);
  in2 : in unsigned (BITSIZE_in2-1 downto 0);
  -- OUT
  out1 : out unsigned (BITSIZE_out1-1 downto 0)

);
end ui_pointer_plus_expr_FU;

architecture ui_pointer_plus_expr_FU_arch of ui_pointer_plus_expr_FU is
  begin
    out1 <= resize(in1, BITSIZE_out1) + resize(in2, BITSIZE_out1);
end ui_pointer_plus_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2013-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity bus_merger is 
generic(
 BITSIZE_in1: integer;
 PORTSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in std_logic_vector((PORTSIZE_in1*BITSIZE_in1)+(-1) downto 0) ;
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end bus_merger;

architecture bus_merger_arch of bus_merger is
  begin
  process(in1)
  variable temp_out1 : std_logic_vector(BITSIZE_out1-1 downto 0);
  begin
    temp_out1 := (others => '0');
    for I in 0 to PORTSIZE_in1-1 loop
      temp_out1 := temp_out1 or in1(((I+1)*BITSIZE_in1)-1 downto (I*BITSIZE_in1));
    end loop;  out1 <= temp_out1;
  end process;

end bus_merger_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity join_signal is 
generic(
 BITSIZE_in1: integer;
 PORTSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in std_logic_vector((PORTSIZE_in1*BITSIZE_in1)+(-1) downto 0) ;
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end join_signal;

architecture join_signal_arch of join_signal is
  
  begin
    process(in1)
    begin
      for i1 in 0 to PORTSIZE_in1-1 loop
      out1((i1+1)*(BITSIZE_out1/PORTSIZE_in1)-1 downto i1*(BITSIZE_out1/PORTSIZE_in1)) <= in1((i1+1)*BITSIZE_in1-1 downto i1*BITSIZE_in1);
       end loop;
    end process;

end join_signal_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity split_signal is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_out1: integer;
 PORTSIZE_out1: integer);
port (
  -- IN
  in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
  -- OUT
  out1 : out std_logic_vector((PORTSIZE_out1*BITSIZE_out1)+(-1) downto 0) 

);
end split_signal;

architecture split_signal_arch of split_signal is
  begin
    out1 <= in1;
end split_signal_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ASSIGN_UNSIGNED_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in unsigned (BITSIZE_in1-1 downto 0);
  -- OUT
  out1 : out unsigned (BITSIZE_out1-1 downto 0)

);
end ASSIGN_UNSIGNED_FU;

architecture ASSIGN_UNSIGNED_FU_arch of ASSIGN_UNSIGNED_FU is
  begin
    out1 <= resize(in1, BITSIZE_out1);
end ASSIGN_UNSIGNED_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ASSIGN_VECTOR_BOOL_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end ASSIGN_VECTOR_BOOL_FU;

architecture ASSIGN_VECTOR_BOOL_FU_arch of ASSIGN_VECTOR_BOOL_FU is
  begin
    out1 <= in1;
end ASSIGN_VECTOR_BOOL_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Christian Pilato <christian.pilato@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity MUX_GATE is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  sel : in std_logic;
  in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
  in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end MUX_GATE;

architecture MUX_GATE_arch of MUX_GATE is
  begin
  out1 <= in1 when sel='1' else in2;
end MUX_GATE_arch;

-- Datapath RTL description for astar
-- This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
-- Author(s): Component automatically generated by bambu
-- License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity datapath_astar is 
generic(
  MEM_var_28861_28878: integer := 32;
  MEM_var_28864_28877: integer := 128;
  MEM_var_28866_28877: integer := 160;
  MEM_var_28867_28877: integer := 192;
  MEM_var_28868_28878: integer := 64);
port (
  -- IN
  clock : in std_logic;
  reset : in std_logic;
  in_port_size : in unsigned (7 downto 0);
  in_port_a : in std_logic_vector(31 downto 0) ;
  in_port_goal : in unsigned (7 downto 0);
  S_oe_ram : in std_logic_vector (1 downto 0);
  S_we_ram : in std_logic_vector (1 downto 0);
  S_addr_ram : in std_logic_vector(15 downto 0) ;
  S_Wdata_ram : in std_logic_vector(15 downto 0) ;
  S_data_ram_size : in std_logic_vector(7 downto 0) ;
  Sin_Rdata_ram : in std_logic_vector(15 downto 0) ;
  Sin_DataRdy : in std_logic_vector (1 downto 0);
  proxy_out1_28861 : in std_logic_vector(15 downto 0) ;
  proxy_out1_28868 : in std_logic_vector(15 downto 0) ;
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD : in std_logic;
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE : in std_logic;
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD : in std_logic;
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE : in std_logic;
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_LOAD : in std_logic;
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_STORE : in std_logic;
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_LOAD : in std_logic;
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_STORE : in std_logic;
  fuselector_DPROXY_CTRLN_3_i0_LOAD : in std_logic;
  fuselector_DPROXY_CTRLN_3_i0_STORE : in std_logic;
  fuselector_DPROXY_CTRLN_4_i0_LOAD : in std_logic;
  fuselector_DPROXY_CTRLN_4_i0_STORE : in std_logic;
  fuselector_DPROXY_CTRLN_4_i1_LOAD : in std_logic;
  fuselector_DPROXY_CTRLN_4_i1_STORE : in std_logic;
  selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0 : in std_logic;
  selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_1_0_0 : in std_logic;
  selector_MUX_16_DPROXY_CTRLN_3_i0_0_0_0 : in std_logic;
  selector_MUX_17_DPROXY_CTRLN_3_i0_1_0_0 : in std_logic;
  selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0 : in std_logic;
  selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0 : in std_logic;
  selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_1 : in std_logic;
  selector_MUX_55_reg_5_0_0_0 : in std_logic;
  selector_MUX_56_reg_6_0_0_0 : in std_logic;
  selector_MUX_57_reg_7_0_0_0 : in std_logic;
  selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0 : in std_logic;
  selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0 : in std_logic;
  wrenable_reg_0 : in std_logic;
  wrenable_reg_1 : in std_logic;
  wrenable_reg_10 : in std_logic;
  wrenable_reg_11 : in std_logic;
  wrenable_reg_2 : in std_logic;
  wrenable_reg_3 : in std_logic;
  wrenable_reg_4 : in std_logic;
  wrenable_reg_5 : in std_logic;
  wrenable_reg_6 : in std_logic;
  wrenable_reg_7 : in std_logic;
  wrenable_reg_8 : in std_logic;
  wrenable_reg_9 : in std_logic;
  -- OUT
  Sout_Rdata_ram : out std_logic_vector(15 downto 0) ;
  Sout_DataRdy : out std_logic_vector (1 downto 0);
  proxy_in1_28861 : out std_logic_vector(15 downto 0) ;
  proxy_in2_28861 : out std_logic_vector(15 downto 0) ;
  proxy_in3_28861 : out std_logic_vector(7 downto 0) ;
  proxy_sel_LOAD_28861 : out std_logic_vector (1 downto 0);
  proxy_sel_STORE_28861 : out std_logic_vector (1 downto 0);
  proxy_in1_28868 : out std_logic_vector(15 downto 0) ;
  proxy_in2_28868 : out std_logic_vector(15 downto 0) ;
  proxy_in3_28868 : out std_logic_vector(7 downto 0) ;
  proxy_sel_LOAD_28868 : out std_logic_vector (1 downto 0);
  proxy_sel_STORE_28868 : out std_logic_vector (1 downto 0);
  OUT_CONDITION_astar_28877_29310 : out std_logic;
  OUT_CONDITION_astar_28877_29381 : out std_logic

);
end datapath_astar;

architecture datapath_astar_arch of datapath_astar is
  -- Component and signal declarations
  
  component constant_value
  generic(
   BITSIZE_out1: integer;
   value: std_logic_vector);
  port (
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component register_SE
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    wenable : in std_logic;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component register_STD
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    wenable : in std_logic;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component ARRAY_1D_STD_DISTRAM_NN_SDS
  generic(
   BITSIZE_in1: integer;
   PORTSIZE_in1: integer;
   BITSIZE_in2: integer;
   PORTSIZE_in2: integer;
   BITSIZE_in3: integer;
   PORTSIZE_in3: integer;
   BITSIZE_in4: integer;
   PORTSIZE_in4: integer;
   BITSIZE_sel_LOAD: integer;
   PORTSIZE_sel_LOAD: integer;
   BITSIZE_sel_STORE: integer;
   PORTSIZE_sel_STORE: integer;
   BITSIZE_S_oe_ram: integer;
   PORTSIZE_S_oe_ram: integer;
   BITSIZE_S_we_ram: integer;
   PORTSIZE_S_we_ram: integer;
   BITSIZE_out1: integer;
   PORTSIZE_out1: integer;
   BITSIZE_S_addr_ram: integer;
   PORTSIZE_S_addr_ram: integer;
   BITSIZE_S_Wdata_ram: integer;
   PORTSIZE_S_Wdata_ram: integer;
   BITSIZE_Sin_Rdata_ram: integer;
   PORTSIZE_Sin_Rdata_ram: integer;
   BITSIZE_Sout_Rdata_ram: integer;
   PORTSIZE_Sout_Rdata_ram: integer;
   BITSIZE_S_data_ram_size: integer;
   PORTSIZE_S_data_ram_size: integer;
   BITSIZE_Sin_DataRdy: integer;
   PORTSIZE_Sin_DataRdy: integer;
   BITSIZE_Sout_DataRdy: integer;
   PORTSIZE_Sout_DataRdy: integer;
   MEMORY_INIT_file: string;
   n_elements: integer;
   data_size: integer;
   address_space_begin: integer;
   address_space_rangesize: integer;
   BUS_PIPELINED: integer;
   BRAM_BITSIZE: integer;
   PRIVATE_MEMORY: integer;
   READ_ONLY_MEMORY: integer;
   USE_SPARSE_MEMORY: integer;
   BITSIZE_proxy_in1: integer;
   PORTSIZE_proxy_in1: integer;
   BITSIZE_proxy_in2: integer;
   PORTSIZE_proxy_in2: integer;
   BITSIZE_proxy_in3: integer;
   PORTSIZE_proxy_in3: integer;
   BITSIZE_proxy_sel_LOAD: integer;
   PORTSIZE_proxy_sel_LOAD: integer;
   BITSIZE_proxy_sel_STORE: integer;
   PORTSIZE_proxy_sel_STORE: integer;
   BITSIZE_proxy_out1: integer;
   PORTSIZE_proxy_out1: integer);
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    in1 : in std_logic_vector((PORTSIZE_in1*BITSIZE_in1)+(-1) downto 0) ;
    in2 : in std_logic_vector((PORTSIZE_in2*BITSIZE_in2)+(-1) downto 0) ;
    in3 : in std_logic_vector((PORTSIZE_in3*BITSIZE_in3)+(-1) downto 0) ;
    in4 : in std_logic_vector((PORTSIZE_in4*BITSIZE_in4)-1 downto 0) ;
    sel_LOAD : in std_logic_vector((PORTSIZE_sel_LOAD*BITSIZE_sel_LOAD)-1 downto 0) ;
    sel_STORE : in std_logic_vector((PORTSIZE_sel_STORE*BITSIZE_sel_STORE)-1 downto 0) ;
    S_oe_ram : in std_logic_vector((PORTSIZE_S_oe_ram*BITSIZE_S_oe_ram)-1 downto 0) ;
    S_we_ram : in std_logic_vector((PORTSIZE_S_we_ram*BITSIZE_S_we_ram)-1 downto 0) ;
    S_addr_ram : in std_logic_vector((PORTSIZE_S_addr_ram*BITSIZE_S_addr_ram)+(-1) downto 0) ;
    S_Wdata_ram : in std_logic_vector((PORTSIZE_S_Wdata_ram*BITSIZE_S_Wdata_ram)+(-1) downto 0) ;
    Sin_Rdata_ram : in std_logic_vector((PORTSIZE_Sin_Rdata_ram*BITSIZE_Sin_Rdata_ram)+(-1) downto 0) ;
    S_data_ram_size : in std_logic_vector((PORTSIZE_S_data_ram_size*BITSIZE_S_data_ram_size)+(-1) downto 0) ;
    Sin_DataRdy : in std_logic_vector((PORTSIZE_Sin_DataRdy*BITSIZE_Sin_DataRdy)-1 downto 0) ;
    proxy_in1 : in std_logic_vector((PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1) downto 0) ;
    proxy_in2 : in std_logic_vector((PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1) downto 0) ;
    proxy_in3 : in std_logic_vector((PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1) downto 0) ;
    proxy_sel_LOAD : in std_logic_vector((PORTSIZE_proxy_sel_LOAD*BITSIZE_proxy_sel_LOAD)-1 downto 0) ;
    proxy_sel_STORE : in std_logic_vector((PORTSIZE_proxy_sel_STORE*BITSIZE_proxy_sel_STORE)-1 downto 0) ;
    -- OUT
    out1 : out std_logic_vector((PORTSIZE_out1*BITSIZE_out1)+(-1) downto 0) ;
    Sout_Rdata_ram : out std_logic_vector((PORTSIZE_Sout_Rdata_ram*BITSIZE_Sout_Rdata_ram)+(-1) downto 0) ;
    Sout_DataRdy : out std_logic_vector((PORTSIZE_Sout_DataRdy*BITSIZE_Sout_DataRdy)-1 downto 0) ;
    proxy_out1 : out std_logic_vector((PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1) downto 0) 
  
  );
  end component;
  
  component DPROXY_CTRLN
  generic(
   BITSIZE_in1: integer;
   PORTSIZE_in1: integer;
   BITSIZE_in2: integer;
   PORTSIZE_in2: integer;
   BITSIZE_in3: integer;
   PORTSIZE_in3: integer;
   BITSIZE_in4: integer;
   PORTSIZE_in4: integer;
   BITSIZE_sel_LOAD: integer;
   PORTSIZE_sel_LOAD: integer;
   BITSIZE_sel_STORE: integer;
   PORTSIZE_sel_STORE: integer;
   BITSIZE_out1: integer;
   PORTSIZE_out1: integer;
   BITSIZE_proxy_in1: integer;
   PORTSIZE_proxy_in1: integer;
   BITSIZE_proxy_in2: integer;
   PORTSIZE_proxy_in2: integer;
   BITSIZE_proxy_in3: integer;
   PORTSIZE_proxy_in3: integer;
   BITSIZE_proxy_sel_LOAD: integer;
   PORTSIZE_proxy_sel_LOAD: integer;
   BITSIZE_proxy_sel_STORE: integer;
   PORTSIZE_proxy_sel_STORE: integer;
   BITSIZE_proxy_out1: integer;
   PORTSIZE_proxy_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector((PORTSIZE_in1*BITSIZE_in1)+(-1) downto 0) ;
    in2 : in std_logic_vector((PORTSIZE_in2*BITSIZE_in2)+(-1) downto 0) ;
    in3 : in std_logic_vector((PORTSIZE_in3*BITSIZE_in3)+(-1) downto 0) ;
    in4 : in std_logic_vector((PORTSIZE_in4*BITSIZE_in4)-1 downto 0) ;
    sel_LOAD : in std_logic_vector((PORTSIZE_sel_LOAD*BITSIZE_sel_LOAD)-1 downto 0) ;
    sel_STORE : in std_logic_vector((PORTSIZE_sel_STORE*BITSIZE_sel_STORE)-1 downto 0) ;
    proxy_out1 : in std_logic_vector((PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1) downto 0) ;
    -- OUT
    out1 : out std_logic_vector((PORTSIZE_out1*BITSIZE_out1)+(-1) downto 0) ;
    proxy_in1 : out std_logic_vector((PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1) downto 0) ;
    proxy_in2 : out std_logic_vector((PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1) downto 0) ;
    proxy_in3 : out std_logic_vector((PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1) downto 0) ;
    proxy_sel_LOAD : out std_logic_vector((PORTSIZE_proxy_sel_LOAD*BITSIZE_proxy_sel_LOAD)-1 downto 0) ;
    proxy_sel_STORE : out std_logic_vector((PORTSIZE_proxy_sel_STORE*BITSIZE_proxy_sel_STORE)-1 downto 0) 
  
  );
  end component;
  
  component addr_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component UUdata_converter_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component UIdata_converter_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    -- OUT
    out1 : out signed (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component IUdata_converter_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in signed (BITSIZE_in1-1 downto 0);
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component read_cond_FU
  generic(
   BITSIZE_in1: integer);
  port (
    -- IN
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    -- OUT
    out1 : out std_logic
  
  );
  end component;
  
  component gt_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in signed (BITSIZE_in1-1 downto 0);
    in2 : in signed (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component ui_bit_and_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component ui_cond_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_in3: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    in3 : in unsigned (BITSIZE_in3-1 downto 0);
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component ui_eq_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component ui_ge_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component ui_ne_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component ui_plus_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component ui_pointer_plus_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer;
   LSB_PARAMETER: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component bus_merger
  generic(
   BITSIZE_in1: integer;
   PORTSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector((PORTSIZE_in1*BITSIZE_in1)+(-1) downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component join_signal
  generic(
   BITSIZE_in1: integer;
   PORTSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector((PORTSIZE_in1*BITSIZE_in1)+(-1) downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component split_signal
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer;
   PORTSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    -- OUT
    out1 : out std_logic_vector((PORTSIZE_out1*BITSIZE_out1)+(-1) downto 0) 
  
  );
  end component;
  
  component ASSIGN_UNSIGNED_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component ASSIGN_VECTOR_BOOL_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component MUX_GATE
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    sel : in std_logic;
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  signal null_out_signal_DPROXY_CTRLN_3_i0_out1_1 : std_logic_vector(7 downto 0) ;
  signal null_out_signal_DPROXY_CTRLN_4_i0_out1_0 : std_logic_vector(7 downto 0) ;
  signal null_out_signal_DPROXY_CTRLN_4_i0_out1_1 : std_logic_vector(7 downto 0) ;
  signal null_out_signal_array_28864_0_out1_1 : std_logic_vector(7 downto 0) ;
  signal null_out_signal_array_28864_0_proxy_out1_0 : std_logic_vector(7 downto 0) ;
  signal null_out_signal_array_28864_0_proxy_out1_1 : std_logic_vector(7 downto 0) ;
  signal null_out_signal_array_28866_0_out1_1 : std_logic_vector(7 downto 0) ;
  signal null_out_signal_array_28866_0_proxy_out1_0 : std_logic_vector(7 downto 0) ;
  signal null_out_signal_array_28866_0_proxy_out1_1 : std_logic_vector(7 downto 0) ;
  signal null_out_signal_array_28867_0_proxy_out1_0 : std_logic_vector(7 downto 0) ;
  signal null_out_signal_array_28867_0_proxy_out1_1 : std_logic_vector(7 downto 0) ;
  signal out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_28864_0 : std_logic_vector(7 downto 0) ;
  signal out_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_array_28866_0 : std_logic_vector(7 downto 0) ;
  signal out_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_array_28867_0 : std_logic_vector(7 downto 0) ;
  signal out_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_array_28867_0 : std_logic_vector(7 downto 0) ;
  signal out_DPROXY_CTRLN_3_i0_DPROXY_CTRLN_3_i0 : std_logic_vector(7 downto 0) ;
  signal out_IUdata_converter_FU_19_i0_fu_astar_28877_29556 : unsigned (7 downto 0);
  signal out_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0 : std_logic_vector(7 downto 0) ;
  signal out_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_1_0_0 : std_logic_vector(7 downto 0) ;
  signal out_MUX_16_DPROXY_CTRLN_3_i0_0_0_0 : std_logic_vector(7 downto 0) ;
  signal out_MUX_17_DPROXY_CTRLN_3_i0_1_0_0 : std_logic_vector(7 downto 0) ;
  signal out_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0 : std_logic_vector(7 downto 0) ;
  signal out_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0 : std_logic_vector(7 downto 0) ;
  signal out_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_1 : std_logic_vector(7 downto 0) ;
  signal out_MUX_55_reg_5_0_0_0 : std_logic_vector(7 downto 0) ;
  signal out_MUX_56_reg_6_0_0_0 : std_logic_vector(7 downto 0) ;
  signal out_MUX_57_reg_7_0_0_0 : std_logic_vector(7 downto 0) ;
  signal out_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0 : std_logic_vector(7 downto 0) ;
  signal out_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0 : std_logic_vector(7 downto 0) ;
  signal out_UIdata_converter_FU_17_i0_fu_astar_28877_29298 : signed (7 downto 0);
  signal out_UIdata_converter_FU_18_i0_fu_astar_28877_29308 : signed (8 downto 0);
  signal out_UUdata_converter_FU_10_i0_fu_astar_28877_29411 : std_logic_vector(6 downto 0) ;
  signal out_UUdata_converter_FU_11_i0_fu_astar_28877_29426 : std_logic_vector(7 downto 0) ;
  signal out_UUdata_converter_FU_13_i0_fu_astar_28877_29441 : std_logic_vector(7 downto 0) ;
  signal out_UUdata_converter_FU_9_i0_fu_astar_28877_29473 : std_logic_vector(7 downto 0) ;
  signal out_addr_expr_FU_12_i0_fu_astar_28877_29511 : std_logic_vector(7 downto 0) ;
  signal out_addr_expr_FU_14_i0_fu_astar_28877_29455 : std_logic_vector(7 downto 0) ;
  signal out_addr_expr_FU_15_i0_fu_astar_28877_29463 : std_logic_vector(7 downto 0) ;
  signal out_addr_expr_FU_7_i0_fu_astar_28877_29404 : std_logic_vector(5 downto 0) ;
  signal out_addr_expr_FU_8_i0_fu_astar_28877_29517 : std_logic_vector(7 downto 0) ;
  signal out_const_0 : std_logic_vector(0 downto 0);
  signal out_const_1 : std_logic_vector(7 downto 0) ;
  signal out_const_10 : std_logic_vector(7 downto 0) ;
  signal out_const_11 : std_logic_vector(7 downto 0) ;
  signal out_const_12 : std_logic_vector(5 downto 0) ;
  signal out_const_13 : std_logic_vector(6 downto 0) ;
  signal out_const_2 : std_logic_vector(7 downto 0) ;
  signal out_const_3 : std_logic_vector(4 downto 0) ;
  signal out_const_4 : std_logic_vector(7 downto 0) ;
  signal out_const_5 : std_logic_vector(0 downto 0);
  signal out_const_6 : std_logic_vector(1 downto 0) ;
  signal out_const_7 : std_logic_vector(6 downto 0) ;
  signal out_const_8 : std_logic_vector(7 downto 0) ;
  signal out_const_9 : std_logic_vector(7 downto 0) ;
  signal out_conv_in_port_goal_8_3 : std_logic_vector(2 downto 0) ;
  signal out_conv_in_port_size_8_2 : std_logic_vector(1 downto 0) ;
  signal out_conv_out_UUdata_converter_FU_10_i0_fu_astar_28877_29411_7_8 : std_logic_vector(7 downto 0) ;
  signal out_conv_out_addr_expr_FU_7_i0_fu_astar_28877_29404_6_8 : std_logic_vector(7 downto 0) ;
  signal out_conv_out_const_10_8_32 : std_logic_vector(31 downto 0) ;
  signal out_conv_out_const_11_8_32 : std_logic_vector(31 downto 0) ;
  signal out_conv_out_const_12_6_32 : std_logic_vector(31 downto 0) ;
  signal out_conv_out_const_13_7_32 : std_logic_vector(31 downto 0) ;
  signal out_conv_out_const_3_5_4 : std_logic_vector(3 downto 0) ;
  signal out_conv_out_const_9_8_32 : std_logic_vector(31 downto 0) ;
  signal out_conv_out_reg_0_reg_0_6_8 : std_logic_vector(7 downto 0) ;
  signal out_conv_out_u_assign_conn_obj_7_ASSIGN_UNSIGNED_FU_u_assign_2_2_8 : std_logic_vector(7 downto 0) ;
  signal out_conv_out_ui_pointer_plus_expr_FU_8_0_8_35_i0_fu_astar_28877_29435_7_8 : std_logic_vector(7 downto 0) ;
  signal out_gt_expr_FU_8_0_8_26_i0_fu_astar_28877_29299 : std_logic_vector(0 downto 0);
  signal out_iu_conv_conn_obj_1_IUdata_converter_FU_iu_conv_0 : unsigned (7 downto 0);
  signal out_iu_conv_conn_obj_2_IUdata_converter_FU_iu_conv_1 : unsigned (7 downto 0);
  signal out_read_cond_FU_20_i0_fu_astar_28877_29310 : std_logic;
  signal out_read_cond_FU_25_i0_fu_astar_28877_29381 : std_logic;
  signal out_reg_0_reg_0 : std_logic_vector(5 downto 0) ;
  signal out_reg_10_reg_10 : std_logic_vector(0 downto 0);
  signal out_reg_11_reg_11 : std_logic_vector(7 downto 0) ;
  signal out_reg_1_reg_1 : std_logic_vector(7 downto 0) ;
  signal out_reg_2_reg_2 : std_logic_vector(7 downto 0) ;
  signal out_reg_3_reg_3 : std_logic_vector(7 downto 0) ;
  signal out_reg_4_reg_4 : std_logic_vector(7 downto 0) ;
  signal out_reg_5_reg_5 : std_logic_vector(7 downto 0) ;
  signal out_reg_6_reg_6 : std_logic_vector(7 downto 0) ;
  signal out_reg_7_reg_7 : std_logic_vector(7 downto 0) ;
  signal out_reg_8_reg_8 : std_logic_vector(7 downto 0) ;
  signal out_reg_9_reg_9 : std_logic_vector(7 downto 0) ;
  signal out_u_assign_conn_obj_7_ASSIGN_UNSIGNED_FU_u_assign_2 : unsigned (1 downto 0);
  signal out_ui_bit_and_expr_FU_1_1_1_27_i0_fu_astar_28877_29305 : unsigned (0 downto 0);
  signal out_ui_cond_expr_FU_8_8_8_8_28_i0_fu_astar_28877_29300 : unsigned (6 downto 0);
  signal out_ui_cond_expr_FU_8_8_8_8_28_i1_fu_astar_28877_29301 : unsigned (7 downto 0);
  signal out_ui_cond_expr_FU_8_8_8_8_28_i2_fu_astar_28877_29306 : unsigned (7 downto 0);
  signal out_ui_eq_expr_FU_8_8_8_29_i0_fu_astar_28877_29706 : std_logic_vector(0 downto 0);
  signal out_ui_ge_expr_FU_8_8_8_30_i0_fu_astar_28877_29304 : std_logic_vector(0 downto 0);
  signal out_ui_ne_expr_FU_8_0_8_31_i0_fu_astar_28877_29303 : std_logic_vector(0 downto 0);
  signal out_ui_ne_expr_FU_8_0_8_32_i0_fu_astar_28877_29708 : std_logic_vector(0 downto 0);
  signal out_ui_plus_expr_FU_8_0_8_33_i0_fu_astar_28877_29272 : unsigned (7 downto 0);
  signal out_ui_plus_expr_FU_8_0_8_34_i0_fu_astar_28877_29307 : unsigned (7 downto 0);
  signal out_ui_pointer_plus_expr_FU_8_0_8_35_i0_fu_astar_28877_29435 : unsigned (6 downto 0);
  signal out_ui_pointer_plus_expr_FU_8_0_8_35_i1_fu_astar_28877_29549 : unsigned (7 downto 0);
  signal out_ui_pointer_plus_expr_FU_8_0_8_36_i0_fu_astar_28877_29501 : unsigned (7 downto 0);
  signal out_ui_pointer_plus_expr_FU_8_8_8_37_i0_fu_astar_28877_29562 : unsigned (7 downto 0);
  signal out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_3 : std_logic_vector(7 downto 0) ;
  signal out_vb_assign_conn_obj_3_ASSIGN_VECTOR_BOOL_FU_vb_assign_4 : std_logic_vector(7 downto 0) ;
  signal out_vb_assign_conn_obj_4_ASSIGN_VECTOR_BOOL_FU_vb_assign_5 : std_logic_vector(7 downto 0) ;
  signal out_vb_assign_conn_obj_5_ASSIGN_VECTOR_BOOL_FU_vb_assign_6 : std_logic_vector(7 downto 0) ;
  signal out_vb_assign_conn_obj_6_ASSIGN_VECTOR_BOOL_FU_vb_assign_7 : std_logic_vector(7 downto 0) ;
  signal out_vb_assign_conn_obj_8_ASSIGN_VECTOR_BOOL_FU_vb_assign_8 : std_logic_vector(7 downto 0) ;
  signal out_vb_assign_conn_obj_9_ASSIGN_VECTOR_BOOL_FU_vb_assign_9 : std_logic_vector(7 downto 0) ;
  signal sig_in_bus_mergerSout_DataRdy0_0 : std_logic_vector(1 downto 0) ;
  signal sig_in_bus_mergerSout_DataRdy0_1 : std_logic_vector(1 downto 0) ;
  signal sig_in_bus_mergerSout_DataRdy0_2 : std_logic_vector(1 downto 0) ;
  signal sig_in_bus_mergerSout_Rdata_ram1_0 : std_logic_vector(15 downto 0) ;
  signal sig_in_bus_mergerSout_Rdata_ram1_1 : std_logic_vector(15 downto 0) ;
  signal sig_in_bus_mergerSout_Rdata_ram1_2 : std_logic_vector(15 downto 0) ;
  signal sig_in_bus_mergerproxy_in1_288612_0 : std_logic_vector(15 downto 0) ;
  signal sig_in_bus_mergerproxy_in1_288683_0 : std_logic_vector(15 downto 0) ;
  signal sig_in_bus_mergerproxy_in2_288614_0 : std_logic_vector(15 downto 0) ;
  signal sig_in_bus_mergerproxy_in2_288685_0 : std_logic_vector(15 downto 0) ;
  signal sig_in_bus_mergerproxy_in3_288616_0 : std_logic_vector(7 downto 0) ;
  signal sig_in_bus_mergerproxy_in3_288687_0 : std_logic_vector(7 downto 0) ;
  signal sig_in_bus_mergerproxy_sel_LOAD_288618_0 : std_logic_vector(1 downto 0) ;
  signal sig_in_bus_mergerproxy_sel_LOAD_288689_0 : std_logic_vector(1 downto 0) ;
  signal sig_in_bus_mergerproxy_sel_STORE_2886110_0 : std_logic_vector(1 downto 0) ;
  signal sig_in_bus_mergerproxy_sel_STORE_2886811_0 : std_logic_vector(1 downto 0) ;
  signal sig_in_vector_bus_mergerSout_DataRdy0_0 : std_logic_vector (1 downto 0);
  signal sig_in_vector_bus_mergerSout_DataRdy0_1 : std_logic_vector (1 downto 0);
  signal sig_in_vector_bus_mergerSout_DataRdy0_2 : std_logic_vector (1 downto 0);
  signal sig_in_vector_bus_mergerSout_Rdata_ram1_0 : std_logic_vector (15 downto 0);
  signal sig_in_vector_bus_mergerSout_Rdata_ram1_1 : std_logic_vector (15 downto 0);
  signal sig_in_vector_bus_mergerSout_Rdata_ram1_2 : std_logic_vector (15 downto 0);
  signal sig_in_vector_bus_mergerproxy_in1_288612_0 : std_logic_vector (15 downto 0);
  signal sig_in_vector_bus_mergerproxy_in1_288683_0 : std_logic_vector (15 downto 0);
  signal sig_in_vector_bus_mergerproxy_in2_288614_0 : std_logic_vector (15 downto 0);
  signal sig_in_vector_bus_mergerproxy_in2_288685_0 : std_logic_vector (15 downto 0);
  signal sig_in_vector_bus_mergerproxy_in3_288616_0 : std_logic_vector (7 downto 0);
  signal sig_in_vector_bus_mergerproxy_in3_288687_0 : std_logic_vector (7 downto 0);
  signal sig_in_vector_bus_mergerproxy_sel_LOAD_288618_0 : std_logic_vector (1 downto 0);
  signal sig_in_vector_bus_mergerproxy_sel_LOAD_288689_0 : std_logic_vector (1 downto 0);
  signal sig_in_vector_bus_mergerproxy_sel_STORE_2886110_0 : std_logic_vector (1 downto 0);
  signal sig_in_vector_bus_mergerproxy_sel_STORE_2886811_0 : std_logic_vector (1 downto 0);
  signal \sig_out_bus_mergerSout_DataRdy0_\ : std_logic_vector(1 downto 0) ;
  signal \sig_out_bus_mergerSout_Rdata_ram1_\ : std_logic_vector(15 downto 0) ;
  signal \sig_out_bus_mergerproxy_in1_288612_\ : std_logic_vector(15 downto 0) ;
  signal \sig_out_bus_mergerproxy_in1_288683_\ : std_logic_vector(15 downto 0) ;
  signal \sig_out_bus_mergerproxy_in2_288614_\ : std_logic_vector(15 downto 0) ;
  signal \sig_out_bus_mergerproxy_in2_288685_\ : std_logic_vector(15 downto 0) ;
  signal \sig_out_bus_mergerproxy_in3_288616_\ : std_logic_vector(7 downto 0) ;
  signal \sig_out_bus_mergerproxy_in3_288687_\ : std_logic_vector(7 downto 0) ;
  signal \sig_out_bus_mergerproxy_sel_LOAD_288618_\ : std_logic_vector(1 downto 0) ;
  signal \sig_out_bus_mergerproxy_sel_LOAD_288689_\ : std_logic_vector(1 downto 0) ;
  signal \sig_out_bus_mergerproxy_sel_STORE_2886110_\ : std_logic_vector(1 downto 0) ;
  signal \sig_out_bus_mergerproxy_sel_STORE_2886811_\ : std_logic_vector(1 downto 0) ;
begin
  ASSIGN_UNSIGNED_FU_u_assign_2 : ASSIGN_UNSIGNED_FU generic map(BITSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => out_u_assign_conn_obj_7_ASSIGN_UNSIGNED_FU_u_assign_2, in1 => unsigned(out_conv_in_port_size_8_2));
  ASSIGN_VECTOR_BOOL_FU_vb_assign_3 : ASSIGN_VECTOR_BOOL_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_3, in1 => out_const_2);
  ASSIGN_VECTOR_BOOL_FU_vb_assign_4 : ASSIGN_VECTOR_BOOL_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_vb_assign_conn_obj_3_ASSIGN_VECTOR_BOOL_FU_vb_assign_4, in1 => out_const_1);
  ASSIGN_VECTOR_BOOL_FU_vb_assign_5 : ASSIGN_VECTOR_BOOL_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_vb_assign_conn_obj_4_ASSIGN_VECTOR_BOOL_FU_vb_assign_5, in1 => out_reg_6_reg_6);
  ASSIGN_VECTOR_BOOL_FU_vb_assign_6 : ASSIGN_VECTOR_BOOL_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_vb_assign_conn_obj_5_ASSIGN_VECTOR_BOOL_FU_vb_assign_6, in1 => out_reg_11_reg_11);
  ASSIGN_VECTOR_BOOL_FU_vb_assign_7 : ASSIGN_VECTOR_BOOL_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_vb_assign_conn_obj_6_ASSIGN_VECTOR_BOOL_FU_vb_assign_7, in1 => out_reg_8_reg_8);
  ASSIGN_VECTOR_BOOL_FU_vb_assign_8 : ASSIGN_VECTOR_BOOL_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_vb_assign_conn_obj_8_ASSIGN_VECTOR_BOOL_FU_vb_assign_8, in1 => out_reg_7_reg_7);
  ASSIGN_VECTOR_BOOL_FU_vb_assign_9 : ASSIGN_VECTOR_BOOL_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_vb_assign_conn_obj_9_ASSIGN_VECTOR_BOOL_FU_vb_assign_9, in1 => out_reg_5_reg_5);
  DPROXY_CTRLN_3_i0 : DPROXY_CTRLN generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_in2=>8, PORTSIZE_in2=>2, BITSIZE_in3=>4, PORTSIZE_in3=>2, BITSIZE_in4=>1, PORTSIZE_in4=>2, BITSIZE_sel_LOAD=>1, PORTSIZE_sel_LOAD=>2, BITSIZE_sel_STORE=>1, PORTSIZE_sel_STORE=>2, BITSIZE_out1=>8, PORTSIZE_out1=>2, BITSIZE_proxy_in1=>8, PORTSIZE_proxy_in1=>2, BITSIZE_proxy_in2=>8, PORTSIZE_proxy_in2=>2, BITSIZE_proxy_in3=>4, PORTSIZE_proxy_in3=>2, BITSIZE_proxy_sel_LOAD=>1, PORTSIZE_proxy_sel_LOAD=>2, BITSIZE_proxy_sel_STORE=>1, PORTSIZE_proxy_sel_STORE=>2, BITSIZE_proxy_out1=>8, PORTSIZE_proxy_out1=>2) port map (out1(15 downto 8) => null_out_signal_DPROXY_CTRLN_3_i0_out1_1, out1(7 downto 0) => out_DPROXY_CTRLN_3_i0_DPROXY_CTRLN_3_i0, proxy_in1 => sig_in_vector_bus_mergerproxy_in1_288612_0, proxy_in2 => sig_in_vector_bus_mergerproxy_in2_288614_0, proxy_in3 => sig_in_vector_bus_mergerproxy_in3_288616_0, proxy_sel_LOAD => sig_in_vector_bus_mergerproxy_sel_LOAD_288618_0, proxy_sel_STORE => sig_in_vector_bus_mergerproxy_sel_STORE_2886110_0, in1(15 downto 8) => "00000000", in1(7 downto 0) => out_MUX_16_DPROXY_CTRLN_3_i0_0_0_0, in2(15 downto 8) => "00000000", in2(7 downto 0) => out_MUX_17_DPROXY_CTRLN_3_i0_1_0_0, in3(7 downto 4) => "0000", in3(3 downto 0) => out_conv_out_const_3_5_4, in4(1 downto 1) => "0", in4(0 downto 0) => out_const_5, sel_LOAD(1 downto 1) => "0", sel_LOAD(0) => fuselector_DPROXY_CTRLN_3_i0_LOAD, sel_STORE(1 downto 1) => "0", sel_STORE(0) => fuselector_DPROXY_CTRLN_3_i0_STORE, proxy_out1 => proxy_out1_28861);
  DPROXY_CTRLN_4_i0 : DPROXY_CTRLN generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_in2=>8, PORTSIZE_in2=>2, BITSIZE_in3=>4, PORTSIZE_in3=>2, BITSIZE_in4=>1, PORTSIZE_in4=>2, BITSIZE_sel_LOAD=>1, PORTSIZE_sel_LOAD=>2, BITSIZE_sel_STORE=>1, PORTSIZE_sel_STORE=>2, BITSIZE_out1=>8, PORTSIZE_out1=>2, BITSIZE_proxy_in1=>8, PORTSIZE_proxy_in1=>2, BITSIZE_proxy_in2=>8, PORTSIZE_proxy_in2=>2, BITSIZE_proxy_in3=>4, PORTSIZE_proxy_in3=>2, BITSIZE_proxy_sel_LOAD=>1, PORTSIZE_proxy_sel_LOAD=>2, BITSIZE_proxy_sel_STORE=>1, PORTSIZE_proxy_sel_STORE=>2, BITSIZE_proxy_out1=>8, PORTSIZE_proxy_out1=>2) port map (out1(15 downto 8) => null_out_signal_DPROXY_CTRLN_4_i0_out1_1, out1(7 downto 0) => null_out_signal_DPROXY_CTRLN_4_i0_out1_0, proxy_in1 => sig_in_vector_bus_mergerproxy_in1_288683_0, proxy_in2 => sig_in_vector_bus_mergerproxy_in2_288685_0, proxy_in3 => sig_in_vector_bus_mergerproxy_in3_288687_0, proxy_sel_LOAD => sig_in_vector_bus_mergerproxy_sel_LOAD_288689_0, proxy_sel_STORE => sig_in_vector_bus_mergerproxy_sel_STORE_2886811_0, in1(15 downto 8) => std_logic_vector(out_iu_conv_conn_obj_2_IUdata_converter_FU_iu_conv_1), in1(7 downto 0) => std_logic_vector(out_iu_conv_conn_obj_1_IUdata_converter_FU_iu_conv_0), in2(15 downto 8) => out_conv_out_ui_pointer_plus_expr_FU_8_0_8_35_i0_fu_astar_28877_29435_7_8, in2(7 downto 0) => out_conv_out_UUdata_converter_FU_10_i0_fu_astar_28877_29411_7_8, in3(7 downto 4) => out_conv_out_const_3_5_4, in3(3 downto 0) => out_conv_out_const_3_5_4, in4(1 downto 1) => out_const_5, in4(0 downto 0) => out_const_5, sel_LOAD(1) => fuselector_DPROXY_CTRLN_4_i1_LOAD, sel_LOAD(0) => fuselector_DPROXY_CTRLN_4_i0_LOAD, sel_STORE(1) => fuselector_DPROXY_CTRLN_4_i1_STORE, sel_STORE(0) => fuselector_DPROXY_CTRLN_4_i0_STORE, proxy_out1 => proxy_out1_28868);
  IUdata_converter_FU_iu_conv_0 : IUdata_converter_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_iu_conv_conn_obj_1_IUdata_converter_FU_iu_conv_0, in1 => signed(out_const_1));
  IUdata_converter_FU_iu_conv_1 : IUdata_converter_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_iu_conv_conn_obj_2_IUdata_converter_FU_iu_conv_1, in1 => signed(out_const_4));
  MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0 : MUX_GATE generic map(BITSIZE_in1=>8, BITSIZE_in2=>8, BITSIZE_out1=>8) port map (out1 => out_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0, sel => selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0, in1 => out_vb_assign_conn_obj_5_ASSIGN_VECTOR_BOOL_FU_vb_assign_6, in2 => out_vb_assign_conn_obj_9_ASSIGN_VECTOR_BOOL_FU_vb_assign_9);
  MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_1_0_0 : MUX_GATE generic map(BITSIZE_in1=>8, BITSIZE_in2=>8, BITSIZE_out1=>8) port map (out1 => out_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_1_0_0, sel => selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_1_0_0, in1 => out_reg_4_reg_4, in2 => out_UUdata_converter_FU_13_i0_fu_astar_28877_29441);
  MUX_16_DPROXY_CTRLN_3_i0_0_0_0 : MUX_GATE generic map(BITSIZE_in1=>8, BITSIZE_in2=>8, BITSIZE_out1=>8) port map (out1 => out_MUX_16_DPROXY_CTRLN_3_i0_0_0_0, sel => selector_MUX_16_DPROXY_CTRLN_3_i0_0_0_0, in1 => out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_3, in2 => out_vb_assign_conn_obj_8_ASSIGN_VECTOR_BOOL_FU_vb_assign_8);
  MUX_17_DPROXY_CTRLN_3_i0_1_0_0 : MUX_GATE generic map(BITSIZE_in1=>8, BITSIZE_in2=>8, BITSIZE_out1=>8) port map (out1 => out_MUX_17_DPROXY_CTRLN_3_i0_1_0_0, sel => selector_MUX_17_DPROXY_CTRLN_3_i0_1_0_0, in1 => out_conv_out_reg_0_reg_0_6_8, in2 => out_conv_out_addr_expr_FU_7_i0_fu_astar_28877_29404_6_8);
  MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0 : MUX_GATE generic map(BITSIZE_in1=>8, BITSIZE_in2=>8, BITSIZE_out1=>8) port map (out1 => out_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0, sel => selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0, in1 => out_reg_3_reg_3, in2 => out_addr_expr_FU_15_i0_fu_astar_28877_29463);
  MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0 : MUX_GATE generic map(BITSIZE_in1=>8, BITSIZE_in2=>8, BITSIZE_out1=>8) port map (out1 => out_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0, sel => selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0, in1 => out_vb_assign_conn_obj_3_ASSIGN_VECTOR_BOOL_FU_vb_assign_4, in2 => out_vb_assign_conn_obj_4_ASSIGN_VECTOR_BOOL_FU_vb_assign_5);
  MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_1 : MUX_GATE generic map(BITSIZE_in1=>8, BITSIZE_in2=>8, BITSIZE_out1=>8) port map (out1 => out_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_1, sel => selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_1, in1 => out_vb_assign_conn_obj_6_ASSIGN_VECTOR_BOOL_FU_vb_assign_7, in2 => out_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0);
  MUX_55_reg_5_0_0_0 : MUX_GATE generic map(BITSIZE_in1=>8, BITSIZE_in2=>8, BITSIZE_out1=>8) port map (out1 => out_MUX_55_reg_5_0_0_0, sel => selector_MUX_55_reg_5_0_0_0, in1 => out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_28864_0, in2 => std_logic_vector(out_ui_cond_expr_FU_8_8_8_8_28_i2_fu_astar_28877_29306));
  MUX_56_reg_6_0_0_0 : MUX_GATE generic map(BITSIZE_in1=>8, BITSIZE_in2=>8, BITSIZE_out1=>8) port map (out1 => out_MUX_56_reg_6_0_0_0, sel => selector_MUX_56_reg_6_0_0_0, in1 => out_reg_8_reg_8, in2 => std_logic_vector(out_ui_plus_expr_FU_8_0_8_33_i0_fu_astar_28877_29272));
  MUX_57_reg_7_0_0_0 : MUX_GATE generic map(BITSIZE_in1=>8, BITSIZE_in2=>8, BITSIZE_out1=>8) port map (out1 => out_MUX_57_reg_7_0_0_0, sel => selector_MUX_57_reg_7_0_0_0, in1 => out_DPROXY_CTRLN_3_i0_DPROXY_CTRLN_3_i0, in2 => out_conv_out_u_assign_conn_obj_7_ASSIGN_UNSIGNED_FU_u_assign_2_2_8);
  MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0 : MUX_GATE generic map(BITSIZE_in1=>8, BITSIZE_in2=>8, BITSIZE_out1=>8) port map (out1 => out_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0, sel => selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0, in1 => out_reg_2_reg_2, in2 => out_addr_expr_FU_14_i0_fu_astar_28877_29455);
  MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0 : MUX_GATE generic map(BITSIZE_in1=>8, BITSIZE_in2=>8, BITSIZE_out1=>8) port map (out1 => out_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0, sel => selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0, in1 => out_reg_1_reg_1, in2 => std_logic_vector(out_ui_pointer_plus_expr_FU_8_8_8_37_i0_fu_astar_28877_29562));
  array_28864_0 : ARRAY_1D_STD_DISTRAM_NN_SDS generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_in2=>8, PORTSIZE_in2=>2, BITSIZE_in3=>4, PORTSIZE_in3=>2, BITSIZE_in4=>1, PORTSIZE_in4=>2, BITSIZE_sel_LOAD=>1, PORTSIZE_sel_LOAD=>2, BITSIZE_sel_STORE=>1, PORTSIZE_sel_STORE=>2, BITSIZE_S_oe_ram=>1, PORTSIZE_S_oe_ram=>2, BITSIZE_S_we_ram=>1, PORTSIZE_S_we_ram=>2, BITSIZE_out1=>8, PORTSIZE_out1=>2, BITSIZE_S_addr_ram=>8, PORTSIZE_S_addr_ram=>2, BITSIZE_S_Wdata_ram=>8, PORTSIZE_S_Wdata_ram=>2, BITSIZE_Sin_Rdata_ram=>8, PORTSIZE_Sin_Rdata_ram=>2, BITSIZE_Sout_Rdata_ram=>8, PORTSIZE_Sout_Rdata_ram=>2, BITSIZE_S_data_ram_size=>4, PORTSIZE_S_data_ram_size=>2, BITSIZE_Sin_DataRdy=>1, PORTSIZE_Sin_DataRdy=>2, BITSIZE_Sout_DataRdy=>1, PORTSIZE_Sout_DataRdy=>2, MEMORY_INIT_file=>"array_ref_28864.mem", n_elements=>1, data_size=>8, address_space_begin=>MEM_var_28864_28877, address_space_rangesize=>32, BUS_PIPELINED=>1, BRAM_BITSIZE=>8, PRIVATE_MEMORY=>0, READ_ONLY_MEMORY=>0, USE_SPARSE_MEMORY=>1, BITSIZE_proxy_in1=>8, PORTSIZE_proxy_in1=>2, BITSIZE_proxy_in2=>8, PORTSIZE_proxy_in2=>2, BITSIZE_proxy_in3=>4, PORTSIZE_proxy_in3=>2, BITSIZE_proxy_sel_LOAD=>1, PORTSIZE_proxy_sel_LOAD=>2, BITSIZE_proxy_sel_STORE=>1, PORTSIZE_proxy_sel_STORE=>2, BITSIZE_proxy_out1=>8, PORTSIZE_proxy_out1=>2) port map (out1(15 downto 8) => null_out_signal_array_28864_0_out1_1, out1(7 downto 0) => out_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_array_28864_0, Sout_Rdata_ram => sig_in_vector_bus_mergerSout_Rdata_ram1_0, Sout_DataRdy => sig_in_vector_bus_mergerSout_DataRdy0_0, proxy_out1(15 downto 8) => null_out_signal_array_28864_0_proxy_out1_1, proxy_out1(7 downto 0) => null_out_signal_array_28864_0_proxy_out1_0, clock => clock, reset => reset, in1(15 downto 8) => "00000000", in1(7 downto 0) => out_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0, in2(15 downto 8) => "00000000", in2(7 downto 0) => out_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0, in3(7 downto 4) => "0000", in3(3 downto 0) => out_conv_out_const_3_5_4, in4(1 downto 1) => "0", in4(0 downto 0) => out_const_5, sel_LOAD(1 downto 1) => "0", sel_LOAD(0) => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD, sel_STORE(1 downto 1) => "0", sel_STORE(0) => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE, S_oe_ram => S_oe_ram, S_we_ram => S_we_ram, S_addr_ram => S_addr_ram, S_Wdata_ram => S_Wdata_ram, Sin_Rdata_ram => Sin_Rdata_ram, S_data_ram_size => S_data_ram_size, Sin_DataRdy => Sin_DataRdy, proxy_in1(15 downto 8) => "00000000", proxy_in1(7 downto 0) => "00000000", proxy_in2(15 downto 8) => "00000000", proxy_in2(7 downto 0) => "00000000", proxy_in3(7 downto 4) => "0000", proxy_in3(3 downto 0) => "0000", proxy_sel_LOAD(1 downto 1) => "0", proxy_sel_LOAD(0 downto 0) => "0", proxy_sel_STORE(1 downto 1) => "0", proxy_sel_STORE(0 downto 0) => "0");
  array_28866_0 : ARRAY_1D_STD_DISTRAM_NN_SDS generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_in2=>8, PORTSIZE_in2=>2, BITSIZE_in3=>4, PORTSIZE_in3=>2, BITSIZE_in4=>1, PORTSIZE_in4=>2, BITSIZE_sel_LOAD=>1, PORTSIZE_sel_LOAD=>2, BITSIZE_sel_STORE=>1, PORTSIZE_sel_STORE=>2, BITSIZE_S_oe_ram=>1, PORTSIZE_S_oe_ram=>2, BITSIZE_S_we_ram=>1, PORTSIZE_S_we_ram=>2, BITSIZE_out1=>8, PORTSIZE_out1=>2, BITSIZE_S_addr_ram=>8, PORTSIZE_S_addr_ram=>2, BITSIZE_S_Wdata_ram=>8, PORTSIZE_S_Wdata_ram=>2, BITSIZE_Sin_Rdata_ram=>8, PORTSIZE_Sin_Rdata_ram=>2, BITSIZE_Sout_Rdata_ram=>8, PORTSIZE_Sout_Rdata_ram=>2, BITSIZE_S_data_ram_size=>4, PORTSIZE_S_data_ram_size=>2, BITSIZE_Sin_DataRdy=>1, PORTSIZE_Sin_DataRdy=>2, BITSIZE_Sout_DataRdy=>1, PORTSIZE_Sout_DataRdy=>2, MEMORY_INIT_file=>"array_ref_28866.mem", n_elements=>1, data_size=>8, address_space_begin=>MEM_var_28866_28877, address_space_rangesize=>32, BUS_PIPELINED=>1, BRAM_BITSIZE=>8, PRIVATE_MEMORY=>0, READ_ONLY_MEMORY=>0, USE_SPARSE_MEMORY=>1, BITSIZE_proxy_in1=>8, PORTSIZE_proxy_in1=>2, BITSIZE_proxy_in2=>8, PORTSIZE_proxy_in2=>2, BITSIZE_proxy_in3=>4, PORTSIZE_proxy_in3=>2, BITSIZE_proxy_sel_LOAD=>1, PORTSIZE_proxy_sel_LOAD=>2, BITSIZE_proxy_sel_STORE=>1, PORTSIZE_proxy_sel_STORE=>2, BITSIZE_proxy_out1=>8, PORTSIZE_proxy_out1=>2) port map (out1(15 downto 8) => null_out_signal_array_28866_0_out1_1, out1(7 downto 0) => out_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_array_28866_0, Sout_Rdata_ram => sig_in_vector_bus_mergerSout_Rdata_ram1_1, Sout_DataRdy => sig_in_vector_bus_mergerSout_DataRdy0_1, proxy_out1(15 downto 8) => null_out_signal_array_28866_0_proxy_out1_1, proxy_out1(7 downto 0) => null_out_signal_array_28866_0_proxy_out1_0, clock => clock, reset => reset, in1(15 downto 8) => "00000000", in1(7 downto 0) => out_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_1, in2(15 downto 8) => "00000000", in2(7 downto 0) => out_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0, in3(7 downto 4) => "0000", in3(3 downto 0) => out_conv_out_const_3_5_4, in4(1 downto 1) => "0", in4(0 downto 0) => out_const_5, sel_LOAD(1 downto 1) => "0", sel_LOAD(0) => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD, sel_STORE(1 downto 1) => "0", sel_STORE(0) => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE, S_oe_ram => S_oe_ram, S_we_ram => S_we_ram, S_addr_ram => S_addr_ram, S_Wdata_ram => S_Wdata_ram, Sin_Rdata_ram => Sin_Rdata_ram, S_data_ram_size => S_data_ram_size, Sin_DataRdy => Sin_DataRdy, proxy_in1(15 downto 8) => "00000000", proxy_in1(7 downto 0) => "00000000", proxy_in2(15 downto 8) => "00000000", proxy_in2(7 downto 0) => "00000000", proxy_in3(7 downto 4) => "0000", proxy_in3(3 downto 0) => "0000", proxy_sel_LOAD(1 downto 1) => "0", proxy_sel_LOAD(0 downto 0) => "0", proxy_sel_STORE(1 downto 1) => "0", proxy_sel_STORE(0 downto 0) => "0");
  array_28867_0 : ARRAY_1D_STD_DISTRAM_NN_SDS generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_in2=>8, PORTSIZE_in2=>2, BITSIZE_in3=>4, PORTSIZE_in3=>2, BITSIZE_in4=>1, PORTSIZE_in4=>2, BITSIZE_sel_LOAD=>1, PORTSIZE_sel_LOAD=>2, BITSIZE_sel_STORE=>1, PORTSIZE_sel_STORE=>2, BITSIZE_S_oe_ram=>1, PORTSIZE_S_oe_ram=>2, BITSIZE_S_we_ram=>1, PORTSIZE_S_we_ram=>2, BITSIZE_out1=>8, PORTSIZE_out1=>2, BITSIZE_S_addr_ram=>8, PORTSIZE_S_addr_ram=>2, BITSIZE_S_Wdata_ram=>8, PORTSIZE_S_Wdata_ram=>2, BITSIZE_Sin_Rdata_ram=>8, PORTSIZE_Sin_Rdata_ram=>2, BITSIZE_Sout_Rdata_ram=>8, PORTSIZE_Sout_Rdata_ram=>2, BITSIZE_S_data_ram_size=>4, PORTSIZE_S_data_ram_size=>2, BITSIZE_Sin_DataRdy=>1, PORTSIZE_Sin_DataRdy=>2, BITSIZE_Sout_DataRdy=>1, PORTSIZE_Sout_DataRdy=>2, MEMORY_INIT_file=>"array_ref_28867.mem", n_elements=>2, data_size=>8, address_space_begin=>MEM_var_28867_28877, address_space_rangesize=>32, BUS_PIPELINED=>1, BRAM_BITSIZE=>8, PRIVATE_MEMORY=>0, READ_ONLY_MEMORY=>0, USE_SPARSE_MEMORY=>1, BITSIZE_proxy_in1=>8, PORTSIZE_proxy_in1=>2, BITSIZE_proxy_in2=>8, PORTSIZE_proxy_in2=>2, BITSIZE_proxy_in3=>4, PORTSIZE_proxy_in3=>2, BITSIZE_proxy_sel_LOAD=>1, PORTSIZE_proxy_sel_LOAD=>2, BITSIZE_proxy_sel_STORE=>1, PORTSIZE_proxy_sel_STORE=>2, BITSIZE_proxy_out1=>8, PORTSIZE_proxy_out1=>2) port map (out1(15 downto 8) => out_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_array_28867_0, out1(7 downto 0) => out_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_array_28867_0, Sout_Rdata_ram => sig_in_vector_bus_mergerSout_Rdata_ram1_2, Sout_DataRdy => sig_in_vector_bus_mergerSout_DataRdy0_2, proxy_out1(15 downto 8) => null_out_signal_array_28867_0_proxy_out1_1, proxy_out1(7 downto 0) => null_out_signal_array_28867_0_proxy_out1_0, clock => clock, reset => reset, in1(15 downto 8) => out_vb_assign_conn_obj_3_ASSIGN_VECTOR_BOOL_FU_vb_assign_4, in1(7 downto 0) => out_vb_assign_conn_obj_3_ASSIGN_VECTOR_BOOL_FU_vb_assign_4, in2(15 downto 8) => out_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_1_0_0, in2(7 downto 0) => out_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0, in3(7 downto 4) => out_conv_out_const_3_5_4, in3(3 downto 0) => out_conv_out_const_3_5_4, in4(1 downto 1) => out_const_5, in4(0 downto 0) => out_const_5, sel_LOAD(1) => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_LOAD, sel_LOAD(0) => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_LOAD, sel_STORE(1) => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_STORE, sel_STORE(0) => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_STORE, S_oe_ram => S_oe_ram, S_we_ram => S_we_ram, S_addr_ram => S_addr_ram, S_Wdata_ram => S_Wdata_ram, Sin_Rdata_ram => Sin_Rdata_ram, S_data_ram_size => S_data_ram_size, Sin_DataRdy => Sin_DataRdy, proxy_in1(15 downto 8) => "00000000", proxy_in1(7 downto 0) => "00000000", proxy_in2(15 downto 8) => "00000000", proxy_in2(7 downto 0) => "00000000", proxy_in3(7 downto 4) => "0000", proxy_in3(3 downto 0) => "0000", proxy_sel_LOAD(1 downto 1) => "0", proxy_sel_LOAD(0 downto 0) => "0", proxy_sel_STORE(1 downto 1) => "0", proxy_sel_STORE(0 downto 0) => "0");
  \bus_mergerSout_DataRdy0_\ : bus_merger generic map(BITSIZE_in1=>2, PORTSIZE_in1=>3, BITSIZE_out1=>2) port map (out1 => \sig_out_bus_mergerSout_DataRdy0_\, in1(5 downto 4) => sig_in_bus_mergerSout_DataRdy0_2, in1(3 downto 2) => sig_in_bus_mergerSout_DataRdy0_1, in1(1 downto 0) => sig_in_bus_mergerSout_DataRdy0_0);
  \bus_mergerSout_Rdata_ram1_\ : bus_merger generic map(BITSIZE_in1=>16, PORTSIZE_in1=>3, BITSIZE_out1=>16) port map (out1 => \sig_out_bus_mergerSout_Rdata_ram1_\, in1(47 downto 32) => sig_in_bus_mergerSout_Rdata_ram1_2, in1(31 downto 16) => sig_in_bus_mergerSout_Rdata_ram1_1, in1(15 downto 0) => sig_in_bus_mergerSout_Rdata_ram1_0);
  \bus_mergerproxy_in1_288612_\ : bus_merger generic map(BITSIZE_in1=>16, PORTSIZE_in1=>1, BITSIZE_out1=>16) port map (out1 => \sig_out_bus_mergerproxy_in1_288612_\, in1(15 downto 0) => sig_in_bus_mergerproxy_in1_288612_0);
  \bus_mergerproxy_in1_288683_\ : bus_merger generic map(BITSIZE_in1=>16, PORTSIZE_in1=>1, BITSIZE_out1=>16) port map (out1 => \sig_out_bus_mergerproxy_in1_288683_\, in1(15 downto 0) => sig_in_bus_mergerproxy_in1_288683_0);
  \bus_mergerproxy_in2_288614_\ : bus_merger generic map(BITSIZE_in1=>16, PORTSIZE_in1=>1, BITSIZE_out1=>16) port map (out1 => \sig_out_bus_mergerproxy_in2_288614_\, in1(15 downto 0) => sig_in_bus_mergerproxy_in2_288614_0);
  \bus_mergerproxy_in2_288685_\ : bus_merger generic map(BITSIZE_in1=>16, PORTSIZE_in1=>1, BITSIZE_out1=>16) port map (out1 => \sig_out_bus_mergerproxy_in2_288685_\, in1(15 downto 0) => sig_in_bus_mergerproxy_in2_288685_0);
  \bus_mergerproxy_in3_288616_\ : bus_merger generic map(BITSIZE_in1=>8, PORTSIZE_in1=>1, BITSIZE_out1=>8) port map (out1 => \sig_out_bus_mergerproxy_in3_288616_\, in1(7 downto 0) => sig_in_bus_mergerproxy_in3_288616_0);
  \bus_mergerproxy_in3_288687_\ : bus_merger generic map(BITSIZE_in1=>8, PORTSIZE_in1=>1, BITSIZE_out1=>8) port map (out1 => \sig_out_bus_mergerproxy_in3_288687_\, in1(7 downto 0) => sig_in_bus_mergerproxy_in3_288687_0);
  \bus_mergerproxy_sel_LOAD_288618_\ : bus_merger generic map(BITSIZE_in1=>2, PORTSIZE_in1=>1, BITSIZE_out1=>2) port map (out1 => \sig_out_bus_mergerproxy_sel_LOAD_288618_\, in1(1 downto 0) => sig_in_bus_mergerproxy_sel_LOAD_288618_0);
  \bus_mergerproxy_sel_LOAD_288689_\ : bus_merger generic map(BITSIZE_in1=>2, PORTSIZE_in1=>1, BITSIZE_out1=>2) port map (out1 => \sig_out_bus_mergerproxy_sel_LOAD_288689_\, in1(1 downto 0) => sig_in_bus_mergerproxy_sel_LOAD_288689_0);
  \bus_mergerproxy_sel_STORE_2886110_\ : bus_merger generic map(BITSIZE_in1=>2, PORTSIZE_in1=>1, BITSIZE_out1=>2) port map (out1 => \sig_out_bus_mergerproxy_sel_STORE_2886110_\, in1(1 downto 0) => sig_in_bus_mergerproxy_sel_STORE_2886110_0);
  \bus_mergerproxy_sel_STORE_2886811_\ : bus_merger generic map(BITSIZE_in1=>2, PORTSIZE_in1=>1, BITSIZE_out1=>2) port map (out1 => \sig_out_bus_mergerproxy_sel_STORE_2886811_\, in1(1 downto 0) => sig_in_bus_mergerproxy_sel_STORE_2886811_0);
  const_0 : constant_value generic map(BITSIZE_out1=>1, value=>"0") port map (out1 => out_const_0);
  const_1 : constant_value generic map(BITSIZE_out1=>8, value=>"00000000") port map (out1 => out_const_1);
  const_10 : constant_value generic map(BITSIZE_out1=>8, value=> std_logic_vector(to_unsigned(MEM_var_28866_28877, 8))) port map (out1 => out_const_10);
  const_11 : constant_value generic map(BITSIZE_out1=>8, value=> std_logic_vector(to_unsigned(MEM_var_28867_28877, 8))) port map (out1 => out_const_11);
  const_12 : constant_value generic map(BITSIZE_out1=>6, value=> std_logic_vector(to_unsigned(MEM_var_28861_28878, 6))) port map (out1 => out_const_12);
  const_13 : constant_value generic map(BITSIZE_out1=>7, value=> std_logic_vector(to_unsigned(MEM_var_28868_28878, 7))) port map (out1 => out_const_13);
  const_2 : constant_value generic map(BITSIZE_out1=>8, value=>"00000010") port map (out1 => out_const_2);
  const_3 : constant_value generic map(BITSIZE_out1=>5, value=>"01000") port map (out1 => out_const_3);
  const_4 : constant_value generic map(BITSIZE_out1=>8, value=>"01111111") port map (out1 => out_const_4);
  const_5 : constant_value generic map(BITSIZE_out1=>1, value=>"1") port map (out1 => out_const_5);
  const_6 : constant_value generic map(BITSIZE_out1=>2, value=>"10") port map (out1 => out_const_6);
  const_7 : constant_value generic map(BITSIZE_out1=>7, value=>"1111111") port map (out1 => out_const_7);
  const_8 : constant_value generic map(BITSIZE_out1=>8, value=>"11111111") port map (out1 => out_const_8);
  const_9 : constant_value generic map(BITSIZE_out1=>8, value=> std_logic_vector(to_unsigned(MEM_var_28864_28877, 8))) port map (out1 => out_const_9);
  conv_in_port_goal_8_3 : UUdata_converter_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>3) port map (out1 => out_conv_in_port_goal_8_3, in1 => std_logic_vector(in_port_goal));
  conv_in_port_size_8_2 : UUdata_converter_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>2) port map (out1 => out_conv_in_port_size_8_2, in1 => std_logic_vector(in_port_size));
  conv_out_UUdata_converter_FU_10_i0_fu_astar_28877_29411_7_8 : UUdata_converter_FU generic map(BITSIZE_in1=>7, BITSIZE_out1=>8) port map (out1 => out_conv_out_UUdata_converter_FU_10_i0_fu_astar_28877_29411_7_8, in1 => out_UUdata_converter_FU_10_i0_fu_astar_28877_29411);
  conv_out_addr_expr_FU_7_i0_fu_astar_28877_29404_6_8 : UUdata_converter_FU generic map(BITSIZE_in1=>6, BITSIZE_out1=>8) port map (out1 => out_conv_out_addr_expr_FU_7_i0_fu_astar_28877_29404_6_8, in1 => out_addr_expr_FU_7_i0_fu_astar_28877_29404);
  conv_out_const_10_8_32 : UUdata_converter_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>32) port map (out1 => out_conv_out_const_10_8_32, in1 => out_const_10);
  conv_out_const_11_8_32 : UUdata_converter_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>32) port map (out1 => out_conv_out_const_11_8_32, in1 => out_const_11);
  conv_out_const_12_6_32 : UUdata_converter_FU generic map(BITSIZE_in1=>6, BITSIZE_out1=>32) port map (out1 => out_conv_out_const_12_6_32, in1 => out_const_12);
  conv_out_const_13_7_32 : UUdata_converter_FU generic map(BITSIZE_in1=>7, BITSIZE_out1=>32) port map (out1 => out_conv_out_const_13_7_32, in1 => out_const_13);
  conv_out_const_3_5_4 : UUdata_converter_FU generic map(BITSIZE_in1=>5, BITSIZE_out1=>4) port map (out1 => out_conv_out_const_3_5_4, in1 => out_const_3);
  conv_out_const_9_8_32 : UUdata_converter_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>32) port map (out1 => out_conv_out_const_9_8_32, in1 => out_const_9);
  conv_out_reg_0_reg_0_6_8 : UUdata_converter_FU generic map(BITSIZE_in1=>6, BITSIZE_out1=>8) port map (out1 => out_conv_out_reg_0_reg_0_6_8, in1 => out_reg_0_reg_0);
  conv_out_u_assign_conn_obj_7_ASSIGN_UNSIGNED_FU_u_assign_2_2_8 : UUdata_converter_FU generic map(BITSIZE_in1=>2, BITSIZE_out1=>8) port map (out1 => out_conv_out_u_assign_conn_obj_7_ASSIGN_UNSIGNED_FU_u_assign_2_2_8, in1 => std_logic_vector(out_u_assign_conn_obj_7_ASSIGN_UNSIGNED_FU_u_assign_2));
  conv_out_ui_pointer_plus_expr_FU_8_0_8_35_i0_fu_astar_28877_29435_7_8 : UUdata_converter_FU generic map(BITSIZE_in1=>7, BITSIZE_out1=>8) port map (out1 => out_conv_out_ui_pointer_plus_expr_FU_8_0_8_35_i0_fu_astar_28877_29435_7_8, in1 => std_logic_vector(out_ui_pointer_plus_expr_FU_8_0_8_35_i0_fu_astar_28877_29435));
  fu_astar_28877_29272 : ui_plus_expr_FU generic map(BITSIZE_in1=>8, BITSIZE_in2=>1, BITSIZE_out1=>8) port map (out1 => out_ui_plus_expr_FU_8_0_8_33_i0_fu_astar_28877_29272, in1 => unsigned(out_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_array_28866_0), in2 => unsigned(out_const_5));
  fu_astar_28877_29298 : UIdata_converter_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_UIdata_converter_FU_17_i0_fu_astar_28877_29298, in1 => unsigned(out_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_array_28867_0));
  fu_astar_28877_29299 : gt_expr_FU generic map(BITSIZE_in1=>8, BITSIZE_in2=>1, BITSIZE_out1=>1) port map (out1 => out_gt_expr_FU_8_0_8_26_i0_fu_astar_28877_29299, in1 => out_UIdata_converter_FU_17_i0_fu_astar_28877_29298, in2 => signed(out_const_0));
  fu_astar_28877_29300 : ui_cond_expr_FU generic map(BITSIZE_in1=>1, BITSIZE_in2=>8, BITSIZE_in3=>7, BITSIZE_out1=>7) port map (out1 => out_ui_cond_expr_FU_8_8_8_8_28_i0_fu_astar_28877_29300, in1 => out_gt_expr_FU_8_0_8_26_i0_fu_astar_28877_29299, in2 => unsigned(out_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_array_28867_0), in3 => unsigned(out_const_7));
  fu_astar_28877_29301 : ui_cond_expr_FU generic map(BITSIZE_in1=>1, BITSIZE_in2=>1, BITSIZE_in3=>8, BITSIZE_out1=>8) port map (out1 => out_ui_cond_expr_FU_8_8_8_8_28_i1_fu_astar_28877_29301, in1 => out_gt_expr_FU_8_0_8_26_i0_fu_astar_28877_29299, in2 => unsigned(out_const_0), in3 => unsigned(out_reg_5_reg_5));
  fu_astar_28877_29303 : ui_ne_expr_FU generic map(BITSIZE_in1=>8, BITSIZE_in2=>1, BITSIZE_out1=>1) port map (out1 => out_ui_ne_expr_FU_8_0_8_31_i0_fu_astar_28877_29303, in1 => unsigned(out_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_array_28867_0), in2 => unsigned(out_const_0));
  fu_astar_28877_29304 : ui_ge_expr_FU generic map(BITSIZE_in1=>7, BITSIZE_in2=>8, BITSIZE_out1=>1) port map (out1 => out_ui_ge_expr_FU_8_8_8_30_i0_fu_astar_28877_29304, in1 => out_ui_cond_expr_FU_8_8_8_8_28_i0_fu_astar_28877_29300, in2 => unsigned(out_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_array_28867_0));
  fu_astar_28877_29305 : ui_bit_and_expr_FU generic map(BITSIZE_in1=>1, BITSIZE_in2=>1, BITSIZE_out1=>1) port map (out1 => out_ui_bit_and_expr_FU_1_1_1_27_i0_fu_astar_28877_29305, in1 => unsigned(out_ui_ge_expr_FU_8_8_8_30_i0_fu_astar_28877_29304), in2 => unsigned(out_ui_ne_expr_FU_8_0_8_31_i0_fu_astar_28877_29303));
  fu_astar_28877_29306 : ui_cond_expr_FU generic map(BITSIZE_in1=>1, BITSIZE_in2=>1, BITSIZE_in3=>8, BITSIZE_out1=>8) port map (out1 => out_ui_cond_expr_FU_8_8_8_8_28_i2_fu_astar_28877_29306, in1 => out_reg_10_reg_10, in2 => unsigned(out_const_5), in3 => unsigned(out_reg_9_reg_9));
  fu_astar_28877_29307 : ui_plus_expr_FU generic map(BITSIZE_in1=>8, BITSIZE_in2=>8, BITSIZE_out1=>8) port map (out1 => out_ui_plus_expr_FU_8_0_8_34_i0_fu_astar_28877_29307, in1 => unsigned(out_reg_6_reg_6), in2 => unsigned(out_const_8));
  fu_astar_28877_29308 : UIdata_converter_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>9) port map (out1 => out_UIdata_converter_FU_18_i0_fu_astar_28877_29308, in1 => out_ui_cond_expr_FU_8_8_8_8_28_i2_fu_astar_28877_29306);
  fu_astar_28877_29310 : read_cond_FU generic map(BITSIZE_in1=>1) port map (out1 => out_read_cond_FU_20_i0_fu_astar_28877_29310, in1 => out_ui_eq_expr_FU_8_8_8_29_i0_fu_astar_28877_29706);
  fu_astar_28877_29381 : read_cond_FU generic map(BITSIZE_in1=>1) port map (out1 => out_read_cond_FU_25_i0_fu_astar_28877_29381, in1 => out_ui_ne_expr_FU_8_0_8_32_i0_fu_astar_28877_29708);
  fu_astar_28877_29404 : addr_expr_FU generic map(BITSIZE_in1=>32, BITSIZE_out1=>6) port map (out1 => out_addr_expr_FU_7_i0_fu_astar_28877_29404, in1 => out_conv_out_const_12_6_32);
  fu_astar_28877_29411 : UUdata_converter_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>7) port map (out1 => out_UUdata_converter_FU_10_i0_fu_astar_28877_29411, in1 => out_UUdata_converter_FU_9_i0_fu_astar_28877_29473);
  fu_astar_28877_29426 : UUdata_converter_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_UUdata_converter_FU_11_i0_fu_astar_28877_29426, in1 => std_logic_vector(out_ui_pointer_plus_expr_FU_8_0_8_36_i0_fu_astar_28877_29501));
  fu_astar_28877_29435 : ui_pointer_plus_expr_FU generic map(BITSIZE_in1=>8, BITSIZE_in2=>1, BITSIZE_out1=>7, LSB_PARAMETER=>0) port map (out1 => out_ui_pointer_plus_expr_FU_8_0_8_35_i0_fu_astar_28877_29435, in1 => unsigned(out_UUdata_converter_FU_11_i0_fu_astar_28877_29426), in2 => unsigned(out_const_5));
  fu_astar_28877_29441 : UUdata_converter_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_UUdata_converter_FU_13_i0_fu_astar_28877_29441, in1 => out_addr_expr_FU_12_i0_fu_astar_28877_29511);
  fu_astar_28877_29455 : addr_expr_FU generic map(BITSIZE_in1=>32, BITSIZE_out1=>8) port map (out1 => out_addr_expr_FU_14_i0_fu_astar_28877_29455, in1 => out_conv_out_const_10_8_32);
  fu_astar_28877_29463 : addr_expr_FU generic map(BITSIZE_in1=>32, BITSIZE_out1=>8) port map (out1 => out_addr_expr_FU_15_i0_fu_astar_28877_29463, in1 => out_conv_out_const_9_8_32);
  fu_astar_28877_29473 : UUdata_converter_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_UUdata_converter_FU_9_i0_fu_astar_28877_29473, in1 => out_addr_expr_FU_8_i0_fu_astar_28877_29517);
  fu_astar_28877_29501 : ui_pointer_plus_expr_FU generic map(BITSIZE_in1=>8, BITSIZE_in2=>2, BITSIZE_out1=>8, LSB_PARAMETER=>0) port map (out1 => out_ui_pointer_plus_expr_FU_8_0_8_36_i0_fu_astar_28877_29501, in1 => unsigned(out_UUdata_converter_FU_9_i0_fu_astar_28877_29473), in2 => unsigned(out_const_6));
  fu_astar_28877_29511 : addr_expr_FU generic map(BITSIZE_in1=>32, BITSIZE_out1=>8) port map (out1 => out_addr_expr_FU_12_i0_fu_astar_28877_29511, in1 => out_conv_out_const_11_8_32);
  fu_astar_28877_29517 : addr_expr_FU generic map(BITSIZE_in1=>32, BITSIZE_out1=>8) port map (out1 => out_addr_expr_FU_8_i0_fu_astar_28877_29517, in1 => out_conv_out_const_13_7_32);
  fu_astar_28877_29549 : ui_pointer_plus_expr_FU generic map(BITSIZE_in1=>8, BITSIZE_in2=>1, BITSIZE_out1=>8, LSB_PARAMETER=>0) port map (out1 => out_ui_pointer_plus_expr_FU_8_0_8_35_i1_fu_astar_28877_29549, in1 => unsigned(out_UUdata_converter_FU_13_i0_fu_astar_28877_29441), in2 => unsigned(out_const_5));
  fu_astar_28877_29556 : IUdata_converter_FU generic map(BITSIZE_in1=>9, BITSIZE_out1=>8) port map (out1 => out_IUdata_converter_FU_19_i0_fu_astar_28877_29556, in1 => out_UIdata_converter_FU_18_i0_fu_astar_28877_29308);
  fu_astar_28877_29562 : ui_pointer_plus_expr_FU generic map(BITSIZE_in1=>8, BITSIZE_in2=>8, BITSIZE_out1=>8, LSB_PARAMETER=>0) port map (out1 => out_ui_pointer_plus_expr_FU_8_8_8_37_i0_fu_astar_28877_29562, in1 => unsigned(out_reg_1_reg_1), in2 => out_IUdata_converter_FU_19_i0_fu_astar_28877_29556);
  fu_astar_28877_29706 : ui_eq_expr_FU generic map(BITSIZE_in1=>3, BITSIZE_in2=>8, BITSIZE_out1=>1) port map (out1 => out_ui_eq_expr_FU_8_8_8_29_i0_fu_astar_28877_29706, in1 => unsigned(out_conv_in_port_goal_8_3), in2 => out_ui_cond_expr_FU_8_8_8_8_28_i2_fu_astar_28877_29306);
  fu_astar_28877_29708 : ui_ne_expr_FU generic map(BITSIZE_in1=>8, BITSIZE_in2=>1, BITSIZE_out1=>1) port map (out1 => out_ui_ne_expr_FU_8_0_8_32_i0_fu_astar_28877_29708, in1 => unsigned(out_reg_6_reg_6), in2 => unsigned(out_const_0));
  join_signalbus_mergerSout_DataRdy0_0 : join_signal generic map(BITSIZE_in1=>1, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => sig_in_bus_mergerSout_DataRdy0_0, in1 => sig_in_vector_bus_mergerSout_DataRdy0_0);
  join_signalbus_mergerSout_DataRdy0_1 : join_signal generic map(BITSIZE_in1=>1, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => sig_in_bus_mergerSout_DataRdy0_1, in1 => sig_in_vector_bus_mergerSout_DataRdy0_1);
  join_signalbus_mergerSout_DataRdy0_2 : join_signal generic map(BITSIZE_in1=>1, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => sig_in_bus_mergerSout_DataRdy0_2, in1 => sig_in_vector_bus_mergerSout_DataRdy0_2);
  join_signalbus_mergerSout_Rdata_ram1_0 : join_signal generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => sig_in_bus_mergerSout_Rdata_ram1_0, in1 => sig_in_vector_bus_mergerSout_Rdata_ram1_0);
  join_signalbus_mergerSout_Rdata_ram1_1 : join_signal generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => sig_in_bus_mergerSout_Rdata_ram1_1, in1 => sig_in_vector_bus_mergerSout_Rdata_ram1_1);
  join_signalbus_mergerSout_Rdata_ram1_2 : join_signal generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => sig_in_bus_mergerSout_Rdata_ram1_2, in1 => sig_in_vector_bus_mergerSout_Rdata_ram1_2);
  join_signalbus_mergerproxy_in1_288612_0 : join_signal generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => sig_in_bus_mergerproxy_in1_288612_0, in1 => sig_in_vector_bus_mergerproxy_in1_288612_0);
  join_signalbus_mergerproxy_in1_288683_0 : join_signal generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => sig_in_bus_mergerproxy_in1_288683_0, in1 => sig_in_vector_bus_mergerproxy_in1_288683_0);
  join_signalbus_mergerproxy_in2_288614_0 : join_signal generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => sig_in_bus_mergerproxy_in2_288614_0, in1 => sig_in_vector_bus_mergerproxy_in2_288614_0);
  join_signalbus_mergerproxy_in2_288685_0 : join_signal generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => sig_in_bus_mergerproxy_in2_288685_0, in1 => sig_in_vector_bus_mergerproxy_in2_288685_0);
  join_signalbus_mergerproxy_in3_288616_0 : join_signal generic map(BITSIZE_in1=>4, PORTSIZE_in1=>2, BITSIZE_out1=>8) port map (out1 => sig_in_bus_mergerproxy_in3_288616_0, in1 => sig_in_vector_bus_mergerproxy_in3_288616_0);
  join_signalbus_mergerproxy_in3_288687_0 : join_signal generic map(BITSIZE_in1=>4, PORTSIZE_in1=>2, BITSIZE_out1=>8) port map (out1 => sig_in_bus_mergerproxy_in3_288687_0, in1 => sig_in_vector_bus_mergerproxy_in3_288687_0);
  join_signalbus_mergerproxy_sel_LOAD_288618_0 : join_signal generic map(BITSIZE_in1=>1, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => sig_in_bus_mergerproxy_sel_LOAD_288618_0, in1 => sig_in_vector_bus_mergerproxy_sel_LOAD_288618_0);
  join_signalbus_mergerproxy_sel_LOAD_288689_0 : join_signal generic map(BITSIZE_in1=>1, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => sig_in_bus_mergerproxy_sel_LOAD_288689_0, in1 => sig_in_vector_bus_mergerproxy_sel_LOAD_288689_0);
  join_signalbus_mergerproxy_sel_STORE_2886110_0 : join_signal generic map(BITSIZE_in1=>1, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => sig_in_bus_mergerproxy_sel_STORE_2886110_0, in1 => sig_in_vector_bus_mergerproxy_sel_STORE_2886110_0);
  join_signalbus_mergerproxy_sel_STORE_2886811_0 : join_signal generic map(BITSIZE_in1=>1, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => sig_in_bus_mergerproxy_sel_STORE_2886811_0, in1 => sig_in_vector_bus_mergerproxy_sel_STORE_2886811_0);
  reg_0 : register_SE generic map(BITSIZE_in1=>6, BITSIZE_out1=>6) port map (out1 => out_reg_0_reg_0, clock => clock, reset => reset, in1 => out_addr_expr_FU_7_i0_fu_astar_28877_29404, wenable => wrenable_reg_0);
  reg_1 : register_SE generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_reg_1_reg_1, clock => clock, reset => reset, in1 => out_UUdata_converter_FU_13_i0_fu_astar_28877_29441, wenable => wrenable_reg_1);
  reg_10 : register_STD generic map(BITSIZE_in1=>1, BITSIZE_out1=>1) port map (out1 => out_reg_10_reg_10, clock => clock, reset => reset, in1 => std_logic_vector(out_ui_bit_and_expr_FU_1_1_1_27_i0_fu_astar_28877_29305), wenable => wrenable_reg_10);
  reg_11 : register_STD generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_reg_11_reg_11, clock => clock, reset => reset, in1 => std_logic_vector(out_ui_cond_expr_FU_8_8_8_8_28_i2_fu_astar_28877_29306), wenable => wrenable_reg_11);
  reg_2 : register_SE generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_reg_2_reg_2, clock => clock, reset => reset, in1 => out_addr_expr_FU_14_i0_fu_astar_28877_29455, wenable => wrenable_reg_2);
  reg_3 : register_SE generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_reg_3_reg_3, clock => clock, reset => reset, in1 => out_addr_expr_FU_15_i0_fu_astar_28877_29463, wenable => wrenable_reg_3);
  reg_4 : register_SE generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_reg_4_reg_4, clock => clock, reset => reset, in1 => std_logic_vector(out_ui_pointer_plus_expr_FU_8_0_8_35_i1_fu_astar_28877_29549), wenable => wrenable_reg_4);
  reg_5 : register_SE generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_reg_5_reg_5, clock => clock, reset => reset, in1 => out_MUX_55_reg_5_0_0_0, wenable => wrenable_reg_5);
  reg_6 : register_SE generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_reg_6_reg_6, clock => clock, reset => reset, in1 => out_MUX_56_reg_6_0_0_0, wenable => wrenable_reg_6);
  reg_7 : register_SE generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_reg_7_reg_7, clock => clock, reset => reset, in1 => out_MUX_57_reg_7_0_0_0, wenable => wrenable_reg_7);
  reg_8 : register_SE generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_reg_8_reg_8, clock => clock, reset => reset, in1 => std_logic_vector(out_ui_plus_expr_FU_8_0_8_34_i0_fu_astar_28877_29307), wenable => wrenable_reg_8);
  reg_9 : register_STD generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_reg_9_reg_9, clock => clock, reset => reset, in1 => std_logic_vector(out_ui_cond_expr_FU_8_8_8_8_28_i1_fu_astar_28877_29301), wenable => wrenable_reg_9);
  \split_signalbus_mergerSout_DataRdy0_\ : split_signal generic map(BITSIZE_in1=>2, BITSIZE_out1=>1, PORTSIZE_out1=>2) port map (out1 => Sout_DataRdy, in1 => \sig_out_bus_mergerSout_DataRdy0_\);
  \split_signalbus_mergerSout_Rdata_ram1_\ : split_signal generic map(BITSIZE_in1=>16, BITSIZE_out1=>8, PORTSIZE_out1=>2) port map (out1 => Sout_Rdata_ram, in1 => \sig_out_bus_mergerSout_Rdata_ram1_\);
  \split_signalbus_mergerproxy_in1_288612_\ : split_signal generic map(BITSIZE_in1=>16, BITSIZE_out1=>8, PORTSIZE_out1=>2) port map (out1 => proxy_in1_28861, in1 => \sig_out_bus_mergerproxy_in1_288612_\);
  \split_signalbus_mergerproxy_in1_288683_\ : split_signal generic map(BITSIZE_in1=>16, BITSIZE_out1=>8, PORTSIZE_out1=>2) port map (out1 => proxy_in1_28868, in1 => \sig_out_bus_mergerproxy_in1_288683_\);
  \split_signalbus_mergerproxy_in2_288614_\ : split_signal generic map(BITSIZE_in1=>16, BITSIZE_out1=>8, PORTSIZE_out1=>2) port map (out1 => proxy_in2_28861, in1 => \sig_out_bus_mergerproxy_in2_288614_\);
  \split_signalbus_mergerproxy_in2_288685_\ : split_signal generic map(BITSIZE_in1=>16, BITSIZE_out1=>8, PORTSIZE_out1=>2) port map (out1 => proxy_in2_28868, in1 => \sig_out_bus_mergerproxy_in2_288685_\);
  \split_signalbus_mergerproxy_in3_288616_\ : split_signal generic map(BITSIZE_in1=>8, BITSIZE_out1=>4, PORTSIZE_out1=>2) port map (out1 => proxy_in3_28861, in1 => \sig_out_bus_mergerproxy_in3_288616_\);
  \split_signalbus_mergerproxy_in3_288687_\ : split_signal generic map(BITSIZE_in1=>8, BITSIZE_out1=>4, PORTSIZE_out1=>2) port map (out1 => proxy_in3_28868, in1 => \sig_out_bus_mergerproxy_in3_288687_\);
  \split_signalbus_mergerproxy_sel_LOAD_288618_\ : split_signal generic map(BITSIZE_in1=>2, BITSIZE_out1=>1, PORTSIZE_out1=>2) port map (out1 => proxy_sel_LOAD_28861, in1 => \sig_out_bus_mergerproxy_sel_LOAD_288618_\);
  \split_signalbus_mergerproxy_sel_LOAD_288689_\ : split_signal generic map(BITSIZE_in1=>2, BITSIZE_out1=>1, PORTSIZE_out1=>2) port map (out1 => proxy_sel_LOAD_28868, in1 => \sig_out_bus_mergerproxy_sel_LOAD_288689_\);
  \split_signalbus_mergerproxy_sel_STORE_2886110_\ : split_signal generic map(BITSIZE_in1=>2, BITSIZE_out1=>1, PORTSIZE_out1=>2) port map (out1 => proxy_sel_STORE_28861, in1 => \sig_out_bus_mergerproxy_sel_STORE_2886110_\);
  \split_signalbus_mergerproxy_sel_STORE_2886811_\ : split_signal generic map(BITSIZE_in1=>2, BITSIZE_out1=>1, PORTSIZE_out1=>2) port map (out1 => proxy_sel_STORE_28868, in1 => \sig_out_bus_mergerproxy_sel_STORE_2886811_\);
  -- io-signal post fix
  OUT_CONDITION_astar_28877_29310 <= out_read_cond_FU_20_i0_fu_astar_28877_29310;
  OUT_CONDITION_astar_28877_29381 <= out_read_cond_FU_25_i0_fu_astar_28877_29381;

end datapath_astar_arch;

-- FSM based controller description for astar
-- This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
-- Author(s): Component automatically generated by bambu
-- License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity controller_astar is 
port (
  -- IN
  OUT_CONDITION_astar_28877_29310 : in std_logic;
  OUT_CONDITION_astar_28877_29381 : in std_logic;
  clock : in std_logic;
  reset : in std_logic;
  start_port : in std_logic;
  -- OUT
  done_port : out std_logic;
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD : out std_logic;
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE : out std_logic;
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD : out std_logic;
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE : out std_logic;
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_LOAD : out std_logic;
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_STORE : out std_logic;
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_LOAD : out std_logic;
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_STORE : out std_logic;
  fuselector_DPROXY_CTRLN_3_i0_LOAD : out std_logic;
  fuselector_DPROXY_CTRLN_3_i0_STORE : out std_logic;
  fuselector_DPROXY_CTRLN_4_i0_LOAD : out std_logic;
  fuselector_DPROXY_CTRLN_4_i0_STORE : out std_logic;
  fuselector_DPROXY_CTRLN_4_i1_LOAD : out std_logic;
  fuselector_DPROXY_CTRLN_4_i1_STORE : out std_logic;
  selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0 : out std_logic;
  selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_1_0_0 : out std_logic;
  selector_MUX_16_DPROXY_CTRLN_3_i0_0_0_0 : out std_logic;
  selector_MUX_17_DPROXY_CTRLN_3_i0_1_0_0 : out std_logic;
  selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0 : out std_logic;
  selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0 : out std_logic;
  selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_1 : out std_logic;
  selector_MUX_55_reg_5_0_0_0 : out std_logic;
  selector_MUX_56_reg_6_0_0_0 : out std_logic;
  selector_MUX_57_reg_7_0_0_0 : out std_logic;
  selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0 : out std_logic;
  selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0 : out std_logic;
  wrenable_reg_0 : out std_logic;
  wrenable_reg_1 : out std_logic;
  wrenable_reg_10 : out std_logic;
  wrenable_reg_11 : out std_logic;
  wrenable_reg_2 : out std_logic;
  wrenable_reg_3 : out std_logic;
  wrenable_reg_4 : out std_logic;
  wrenable_reg_5 : out std_logic;
  wrenable_reg_6 : out std_logic;
  wrenable_reg_7 : out std_logic;
  wrenable_reg_8 : out std_logic;
  wrenable_reg_9 : out std_logic

);
end controller_astar;

architecture controller_astar_arch of controller_astar is
  -- define the states of FSM model
  constant S_0: std_logic_vector(6 downto 0) := "0000001";
  constant S_1: std_logic_vector(6 downto 0) := "0000010";
  constant S_5: std_logic_vector(6 downto 0) := "0100000";
  constant S_6: std_logic_vector(6 downto 0) := "1000000";
  constant S_2: std_logic_vector(6 downto 0) := "0000100";
  constant S_3: std_logic_vector(6 downto 0) := "0001000";
  constant S_4: std_logic_vector(6 downto 0) := "0010000";
  signal present_state, next_state : std_logic_vector(6 downto 0);
begin
  -- concurrent process#1: state registers
  state_reg: process(clock)
  begin
    if (clock'event and clock='1') then
      if (reset='0') then
        present_state <= S_0;
      else
        present_state <= next_state;
      end if;
    end if;
  end process;
  -- concurrent process#0: combinational logic
  comb_logic0: process(present_state, OUT_CONDITION_astar_28877_29310, OUT_CONDITION_astar_28877_29381, start_port)
  begin
    done_port <= '0';
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD <= '0';
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE <= '0';
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD <= '0';
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE <= '0';
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_LOAD <= '0';
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_STORE <= '0';
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_LOAD <= '0';
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_STORE <= '0';
    fuselector_DPROXY_CTRLN_3_i0_LOAD <= '0';
    fuselector_DPROXY_CTRLN_3_i0_STORE <= '0';
    fuselector_DPROXY_CTRLN_4_i0_LOAD <= '0';
    fuselector_DPROXY_CTRLN_4_i0_STORE <= '0';
    fuselector_DPROXY_CTRLN_4_i1_LOAD <= '0';
    fuselector_DPROXY_CTRLN_4_i1_STORE <= '0';
    selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0 <= '0';
    selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_1_0_0 <= '0';
    selector_MUX_16_DPROXY_CTRLN_3_i0_0_0_0 <= '0';
    selector_MUX_17_DPROXY_CTRLN_3_i0_1_0_0 <= '0';
    selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0 <= '0';
    selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0 <= '0';
    selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_1 <= '0';
    selector_MUX_55_reg_5_0_0_0 <= '0';
    selector_MUX_56_reg_6_0_0_0 <= '0';
    selector_MUX_57_reg_7_0_0_0 <= '0';
    selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0 <= '0';
    selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0 <= '0';
    wrenable_reg_0 <= '0';
    wrenable_reg_1 <= '0';
    wrenable_reg_10 <= '0';
    wrenable_reg_11 <= '0';
    wrenable_reg_2 <= '0';
    wrenable_reg_3 <= '0';
    wrenable_reg_4 <= '0';
    wrenable_reg_5 <= '0';
    wrenable_reg_6 <= '0';
    wrenable_reg_7 <= '0';
    wrenable_reg_8 <= '0';
    wrenable_reg_9 <= '0';
    next_state <= S_0;
    case present_state is
      when S_0 =>
        if(start_port /= '1') then
          selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0 <= 'X';
          selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_1_0_0 <= 'X';
          selector_MUX_16_DPROXY_CTRLN_3_i0_0_0_0 <= 'X';
          selector_MUX_17_DPROXY_CTRLN_3_i0_1_0_0 <= 'X';
          selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0 <= 'X';
          selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0 <= 'X';
          selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_1 <= 'X';
          selector_MUX_55_reg_5_0_0_0 <= 'X';
          selector_MUX_56_reg_6_0_0_0 <= 'X';
          selector_MUX_57_reg_7_0_0_0 <= 'X';
          selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0 <= 'X';
          selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0 <= 'X';
          wrenable_reg_0 <= 'X';
          wrenable_reg_1 <= 'X';
          wrenable_reg_10 <= 'X';
          wrenable_reg_11 <= 'X';
          wrenable_reg_2 <= 'X';
          wrenable_reg_3 <= 'X';
          wrenable_reg_4 <= 'X';
          wrenable_reg_5 <= 'X';
          wrenable_reg_6 <= 'X';
          wrenable_reg_7 <= 'X';
          wrenable_reg_8 <= 'X';
          wrenable_reg_9 <= 'X';
          next_state <= S_0;
        else
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD <= '1';
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD <= '1';
          fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_STORE <= '1';
          fuselector_DPROXY_CTRLN_3_i0_STORE <= '1';
          fuselector_DPROXY_CTRLN_4_i0_STORE <= '1';
          fuselector_DPROXY_CTRLN_4_i1_STORE <= '1';
          selector_MUX_16_DPROXY_CTRLN_3_i0_0_0_0 <= '1';
          selector_MUX_55_reg_5_0_0_0 <= '1';
          wrenable_reg_0 <= '1';
          wrenable_reg_1 <= '1';
          wrenable_reg_2 <= '1';
          wrenable_reg_3 <= '1';
          wrenable_reg_4 <= '1';
          wrenable_reg_5 <= '1';
          wrenable_reg_6 <= '1';
          next_state <= S_1;
        end if;
      when S_1 =>
        fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE <= '1';
        fuselector_DPROXY_CTRLN_3_i0_LOAD <= '1';
        selector_MUX_17_DPROXY_CTRLN_3_i0_1_0_0 <= '1';
        selector_MUX_57_reg_7_0_0_0 <= '1';
        selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0 <= '1';
        wrenable_reg_7 <= '1';
        next_state <= S_5;
      when S_5 =>
        wrenable_reg_8 <= '1';
        if (OUT_CONDITION_astar_28877_29381 = '1') then
          next_state <= S_2;
        else
          next_state <= S_6;
          done_port <= '1';
          wrenable_reg_8 <= '0';
        end if;
      when S_6 =>
        fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE <= '1';
        fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE <= '1';
        fuselector_DPROXY_CTRLN_3_i0_STORE <= '1';
        selector_MUX_17_DPROXY_CTRLN_3_i0_1_0_0 <= '1';
        selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0 <= '1';
        selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0 <= '1';
        selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0 <= '1';
        next_state <= S_0;
      when S_2 =>
        fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_LOAD <= '1';
        fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_LOAD <= '1';
        selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_1_0_0 <= '1';
        selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0 <= '1';
        wrenable_reg_10 <= '1';
        wrenable_reg_9 <= '1';
        next_state <= S_3;
      when S_3 =>
        fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_STORE <= '1';
        selector_MUX_56_reg_6_0_0_0 <= '1';
        wrenable_reg_11 <= '1';
        wrenable_reg_5 <= '1';
        wrenable_reg_6 <= '1';
        wrenable_reg_7 <= '1';
        if (OUT_CONDITION_astar_28877_29310 = '1') then
          next_state <= S_4;
          done_port <= '1';
          selector_MUX_56_reg_6_0_0_0 <= '0';
          wrenable_reg_5 <= '0';
          wrenable_reg_6 <= '0';
          wrenable_reg_7 <= '0';
        else
          next_state <= S_5;
          wrenable_reg_11 <= '0';
        end if;
      when S_4 =>
        fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE <= '1';
        fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE <= '1';
        fuselector_DPROXY_CTRLN_3_i0_STORE <= '1';
        selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0 <= '1';
        selector_MUX_16_DPROXY_CTRLN_3_i0_0_0_0 <= '1';
        selector_MUX_17_DPROXY_CTRLN_3_i0_1_0_0 <= '1';
        selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0 <= '1';
        selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_1 <= '1';
        selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0 <= '1';
        next_state <= S_0;
      when others =>
        selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0 <= 'X';
        selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_1_0_0 <= 'X';
        selector_MUX_16_DPROXY_CTRLN_3_i0_0_0_0 <= 'X';
        selector_MUX_17_DPROXY_CTRLN_3_i0_1_0_0 <= 'X';
        selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0 <= 'X';
        selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0 <= 'X';
        selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_1 <= 'X';
        selector_MUX_55_reg_5_0_0_0 <= 'X';
        selector_MUX_56_reg_6_0_0_0 <= 'X';
        selector_MUX_57_reg_7_0_0_0 <= 'X';
        selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0 <= 'X';
        selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0 <= 'X';
        wrenable_reg_0 <= 'X';
        wrenable_reg_1 <= 'X';
        wrenable_reg_10 <= 'X';
        wrenable_reg_11 <= 'X';
        wrenable_reg_2 <= 'X';
        wrenable_reg_3 <= 'X';
        wrenable_reg_4 <= 'X';
        wrenable_reg_5 <= 'X';
        wrenable_reg_6 <= 'X';
        wrenable_reg_7 <= 'X';
        wrenable_reg_8 <= 'X';
        wrenable_reg_9 <= 'X';
    end case;
  end process;

end controller_astar_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Marco Lattuada <marco.lattuada@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity flipflop_AR is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  clock : in std_logic;
  reset : in std_logic;
  in1 : in std_logic;
  -- OUT
  out1 : out std_logic

);
end flipflop_AR;

architecture flipflop_AR_arch of flipflop_AR is
  
  signal reg_out1 : std_logic := '0';
  begin
    process(clock,reset)
    begin
      if(reset = '0') then
        reg_out1 <= '0';
      elsif(clock'event and clock = '1') then
        reg_out1 <= in1;
      end if;
    end process;
    out1 <= reg_out1;

end flipflop_AR_arch;

-- Top component for astar
-- This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
-- Author(s): Component automatically generated by bambu
-- License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity astar is 
generic(
  MEM_var_28861_28878: integer := 32;
  MEM_var_28864_28877: integer := 128;
  MEM_var_28866_28877: integer := 160;
  MEM_var_28867_28877: integer := 192;
  MEM_var_28868_28878: integer := 64);
port (
  -- IN
  clock : in std_logic;
  reset : in std_logic;
  start_port : in std_logic;
  size : in unsigned (7 downto 0);
  a : in std_logic_vector(31 downto 0) ;
  goal : in unsigned (7 downto 0);
  S_oe_ram : in std_logic_vector (1 downto 0);
  S_we_ram : in std_logic_vector (1 downto 0);
  S_addr_ram : in std_logic_vector(15 downto 0) ;
  S_Wdata_ram : in std_logic_vector(15 downto 0) ;
  S_data_ram_size : in std_logic_vector(7 downto 0) ;
  Sin_Rdata_ram : in std_logic_vector(15 downto 0) ;
  Sin_DataRdy : in std_logic_vector (1 downto 0);
  proxy_out1_28861 : in std_logic_vector(15 downto 0) ;
  proxy_out1_28868 : in std_logic_vector(15 downto 0) ;
  -- OUT
  done_port : out std_logic;
  Sout_Rdata_ram : out std_logic_vector(15 downto 0) ;
  Sout_DataRdy : out std_logic_vector (1 downto 0);
  proxy_in1_28861 : out std_logic_vector(15 downto 0) ;
  proxy_in2_28861 : out std_logic_vector(15 downto 0) ;
  proxy_in3_28861 : out std_logic_vector(7 downto 0) ;
  proxy_sel_LOAD_28861 : out std_logic_vector (1 downto 0);
  proxy_sel_STORE_28861 : out std_logic_vector (1 downto 0);
  proxy_in1_28868 : out std_logic_vector(15 downto 0) ;
  proxy_in2_28868 : out std_logic_vector(15 downto 0) ;
  proxy_in3_28868 : out std_logic_vector(7 downto 0) ;
  proxy_sel_LOAD_28868 : out std_logic_vector (1 downto 0);
  proxy_sel_STORE_28868 : out std_logic_vector (1 downto 0)

);
end astar;

architecture astar_arch of astar is
  -- Component and signal declarations
  
  component datapath_astar
  generic(
    MEM_var_28861_28878: integer := 32;
    MEM_var_28864_28877: integer := 128;
    MEM_var_28866_28877: integer := 160;
    MEM_var_28867_28877: integer := 192;
    MEM_var_28868_28878: integer := 64);
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    in_port_size : in unsigned (7 downto 0);
    in_port_a : in std_logic_vector(31 downto 0) ;
    in_port_goal : in unsigned (7 downto 0);
    S_oe_ram : in std_logic_vector (1 downto 0);
    S_we_ram : in std_logic_vector (1 downto 0);
    S_addr_ram : in std_logic_vector(15 downto 0) ;
    S_Wdata_ram : in std_logic_vector(15 downto 0) ;
    S_data_ram_size : in std_logic_vector(7 downto 0) ;
    Sin_Rdata_ram : in std_logic_vector(15 downto 0) ;
    Sin_DataRdy : in std_logic_vector (1 downto 0);
    proxy_out1_28861 : in std_logic_vector(15 downto 0) ;
    proxy_out1_28868 : in std_logic_vector(15 downto 0) ;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD : in std_logic;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE : in std_logic;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD : in std_logic;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE : in std_logic;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_LOAD : in std_logic;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_STORE : in std_logic;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_LOAD : in std_logic;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_STORE : in std_logic;
    fuselector_DPROXY_CTRLN_3_i0_LOAD : in std_logic;
    fuselector_DPROXY_CTRLN_3_i0_STORE : in std_logic;
    fuselector_DPROXY_CTRLN_4_i0_LOAD : in std_logic;
    fuselector_DPROXY_CTRLN_4_i0_STORE : in std_logic;
    fuselector_DPROXY_CTRLN_4_i1_LOAD : in std_logic;
    fuselector_DPROXY_CTRLN_4_i1_STORE : in std_logic;
    selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0 : in std_logic;
    selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_1_0_0 : in std_logic;
    selector_MUX_16_DPROXY_CTRLN_3_i0_0_0_0 : in std_logic;
    selector_MUX_17_DPROXY_CTRLN_3_i0_1_0_0 : in std_logic;
    selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0 : in std_logic;
    selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0 : in std_logic;
    selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_1 : in std_logic;
    selector_MUX_55_reg_5_0_0_0 : in std_logic;
    selector_MUX_56_reg_6_0_0_0 : in std_logic;
    selector_MUX_57_reg_7_0_0_0 : in std_logic;
    selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0 : in std_logic;
    selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0 : in std_logic;
    wrenable_reg_0 : in std_logic;
    wrenable_reg_1 : in std_logic;
    wrenable_reg_10 : in std_logic;
    wrenable_reg_11 : in std_logic;
    wrenable_reg_2 : in std_logic;
    wrenable_reg_3 : in std_logic;
    wrenable_reg_4 : in std_logic;
    wrenable_reg_5 : in std_logic;
    wrenable_reg_6 : in std_logic;
    wrenable_reg_7 : in std_logic;
    wrenable_reg_8 : in std_logic;
    wrenable_reg_9 : in std_logic;
    -- OUT
    Sout_Rdata_ram : out std_logic_vector(15 downto 0) ;
    Sout_DataRdy : out std_logic_vector (1 downto 0);
    proxy_in1_28861 : out std_logic_vector(15 downto 0) ;
    proxy_in2_28861 : out std_logic_vector(15 downto 0) ;
    proxy_in3_28861 : out std_logic_vector(7 downto 0) ;
    proxy_sel_LOAD_28861 : out std_logic_vector (1 downto 0);
    proxy_sel_STORE_28861 : out std_logic_vector (1 downto 0);
    proxy_in1_28868 : out std_logic_vector(15 downto 0) ;
    proxy_in2_28868 : out std_logic_vector(15 downto 0) ;
    proxy_in3_28868 : out std_logic_vector(7 downto 0) ;
    proxy_sel_LOAD_28868 : out std_logic_vector (1 downto 0);
    proxy_sel_STORE_28868 : out std_logic_vector (1 downto 0);
    OUT_CONDITION_astar_28877_29310 : out std_logic;
    OUT_CONDITION_astar_28877_29381 : out std_logic
  
  );
  end component;
  
  component controller_astar
  port (
    -- IN
    OUT_CONDITION_astar_28877_29310 : in std_logic;
    OUT_CONDITION_astar_28877_29381 : in std_logic;
    clock : in std_logic;
    reset : in std_logic;
    start_port : in std_logic;
    -- OUT
    done_port : out std_logic;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD : out std_logic;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE : out std_logic;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD : out std_logic;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE : out std_logic;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_LOAD : out std_logic;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_STORE : out std_logic;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_LOAD : out std_logic;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_STORE : out std_logic;
    fuselector_DPROXY_CTRLN_3_i0_LOAD : out std_logic;
    fuselector_DPROXY_CTRLN_3_i0_STORE : out std_logic;
    fuselector_DPROXY_CTRLN_4_i0_LOAD : out std_logic;
    fuselector_DPROXY_CTRLN_4_i0_STORE : out std_logic;
    fuselector_DPROXY_CTRLN_4_i1_LOAD : out std_logic;
    fuselector_DPROXY_CTRLN_4_i1_STORE : out std_logic;
    selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0 : out std_logic;
    selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_1_0_0 : out std_logic;
    selector_MUX_16_DPROXY_CTRLN_3_i0_0_0_0 : out std_logic;
    selector_MUX_17_DPROXY_CTRLN_3_i0_1_0_0 : out std_logic;
    selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0 : out std_logic;
    selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0 : out std_logic;
    selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_1 : out std_logic;
    selector_MUX_55_reg_5_0_0_0 : out std_logic;
    selector_MUX_56_reg_6_0_0_0 : out std_logic;
    selector_MUX_57_reg_7_0_0_0 : out std_logic;
    selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0 : out std_logic;
    selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0 : out std_logic;
    wrenable_reg_0 : out std_logic;
    wrenable_reg_1 : out std_logic;
    wrenable_reg_10 : out std_logic;
    wrenable_reg_11 : out std_logic;
    wrenable_reg_2 : out std_logic;
    wrenable_reg_3 : out std_logic;
    wrenable_reg_4 : out std_logic;
    wrenable_reg_5 : out std_logic;
    wrenable_reg_6 : out std_logic;
    wrenable_reg_7 : out std_logic;
    wrenable_reg_8 : out std_logic;
    wrenable_reg_9 : out std_logic
  
  );
  end component;
  
  component flipflop_AR
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    in1 : in std_logic;
    -- OUT
    out1 : out std_logic
  
  );
  end component;
  signal OUT_CONDITION_astar_28877_29310 : std_logic;
  signal OUT_CONDITION_astar_28877_29381 : std_logic;
  signal done_delayed_REG_signal_in : std_logic;
  signal done_delayed_REG_signal_out : std_logic;
  signal fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD : std_logic;
  signal fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE : std_logic;
  signal fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD : std_logic;
  signal fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE : std_logic;
  signal fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_LOAD : std_logic;
  signal fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_STORE : std_logic;
  signal fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_LOAD : std_logic;
  signal fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_STORE : std_logic;
  signal fuselector_DPROXY_CTRLN_3_i0_LOAD : std_logic;
  signal fuselector_DPROXY_CTRLN_3_i0_STORE : std_logic;
  signal fuselector_DPROXY_CTRLN_4_i0_LOAD : std_logic;
  signal fuselector_DPROXY_CTRLN_4_i0_STORE : std_logic;
  signal fuselector_DPROXY_CTRLN_4_i1_LOAD : std_logic;
  signal fuselector_DPROXY_CTRLN_4_i1_STORE : std_logic;
  signal selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0 : std_logic;
  signal selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_1_0_0 : std_logic;
  signal selector_MUX_16_DPROXY_CTRLN_3_i0_0_0_0 : std_logic;
  signal selector_MUX_17_DPROXY_CTRLN_3_i0_1_0_0 : std_logic;
  signal selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0 : std_logic;
  signal selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0 : std_logic;
  signal selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_1 : std_logic;
  signal selector_MUX_55_reg_5_0_0_0 : std_logic;
  signal selector_MUX_56_reg_6_0_0_0 : std_logic;
  signal selector_MUX_57_reg_7_0_0_0 : std_logic;
  signal selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0 : std_logic;
  signal selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0 : std_logic;
  signal wrenable_reg_0 : std_logic;
  signal wrenable_reg_1 : std_logic;
  signal wrenable_reg_10 : std_logic;
  signal wrenable_reg_11 : std_logic;
  signal wrenable_reg_2 : std_logic;
  signal wrenable_reg_3 : std_logic;
  signal wrenable_reg_4 : std_logic;
  signal wrenable_reg_5 : std_logic;
  signal wrenable_reg_6 : std_logic;
  signal wrenable_reg_7 : std_logic;
  signal wrenable_reg_8 : std_logic;
  signal wrenable_reg_9 : std_logic;
begin
  Controller_i : controller_astar port map (done_port => done_delayed_REG_signal_in, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_LOAD => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_STORE => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_STORE, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_LOAD => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_STORE => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_STORE, fuselector_DPROXY_CTRLN_3_i0_LOAD => fuselector_DPROXY_CTRLN_3_i0_LOAD, fuselector_DPROXY_CTRLN_3_i0_STORE => fuselector_DPROXY_CTRLN_3_i0_STORE, fuselector_DPROXY_CTRLN_4_i0_LOAD => fuselector_DPROXY_CTRLN_4_i0_LOAD, fuselector_DPROXY_CTRLN_4_i0_STORE => fuselector_DPROXY_CTRLN_4_i0_STORE, fuselector_DPROXY_CTRLN_4_i1_LOAD => fuselector_DPROXY_CTRLN_4_i1_LOAD, fuselector_DPROXY_CTRLN_4_i1_STORE => fuselector_DPROXY_CTRLN_4_i1_STORE, selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0 => selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0, selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_1_0_0 => selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_1_0_0, selector_MUX_16_DPROXY_CTRLN_3_i0_0_0_0 => selector_MUX_16_DPROXY_CTRLN_3_i0_0_0_0, selector_MUX_17_DPROXY_CTRLN_3_i0_1_0_0 => selector_MUX_17_DPROXY_CTRLN_3_i0_1_0_0, selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0 => selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0, selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0 => selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0, selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_1 => selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_1, selector_MUX_55_reg_5_0_0_0 => selector_MUX_55_reg_5_0_0_0, selector_MUX_56_reg_6_0_0_0 => selector_MUX_56_reg_6_0_0_0, selector_MUX_57_reg_7_0_0_0 => selector_MUX_57_reg_7_0_0_0, selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0 => selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0, selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0 => selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0, wrenable_reg_0 => wrenable_reg_0, wrenable_reg_1 => wrenable_reg_1, wrenable_reg_10 => wrenable_reg_10, wrenable_reg_11 => wrenable_reg_11, wrenable_reg_2 => wrenable_reg_2, wrenable_reg_3 => wrenable_reg_3, wrenable_reg_4 => wrenable_reg_4, wrenable_reg_5 => wrenable_reg_5, wrenable_reg_6 => wrenable_reg_6, wrenable_reg_7 => wrenable_reg_7, wrenable_reg_8 => wrenable_reg_8, wrenable_reg_9 => wrenable_reg_9, OUT_CONDITION_astar_28877_29310 => OUT_CONDITION_astar_28877_29310, OUT_CONDITION_astar_28877_29381 => OUT_CONDITION_astar_28877_29381, clock => clock, reset => reset, start_port => start_port);
  Datapath_i : datapath_astar generic map(MEM_var_28861_28878=>(MEM_var_28861_28878), MEM_var_28864_28877=>(MEM_var_28864_28877), MEM_var_28866_28877=>(MEM_var_28866_28877), MEM_var_28867_28877=>(MEM_var_28867_28877), MEM_var_28868_28878=>(MEM_var_28868_28878)) port map (Sout_Rdata_ram => Sout_Rdata_ram, Sout_DataRdy => Sout_DataRdy, proxy_in1_28861 => proxy_in1_28861, proxy_in2_28861 => proxy_in2_28861, proxy_in3_28861 => proxy_in3_28861, proxy_sel_LOAD_28861 => proxy_sel_LOAD_28861, proxy_sel_STORE_28861 => proxy_sel_STORE_28861, proxy_in1_28868 => proxy_in1_28868, proxy_in2_28868 => proxy_in2_28868, proxy_in3_28868 => proxy_in3_28868, proxy_sel_LOAD_28868 => proxy_sel_LOAD_28868, proxy_sel_STORE_28868 => proxy_sel_STORE_28868, OUT_CONDITION_astar_28877_29310 => OUT_CONDITION_astar_28877_29310, OUT_CONDITION_astar_28877_29381 => OUT_CONDITION_astar_28877_29381, clock => clock, reset => reset, in_port_size => size, in_port_a => a, in_port_goal => goal, S_oe_ram => S_oe_ram, S_we_ram => S_we_ram, S_addr_ram => S_addr_ram, S_Wdata_ram => S_Wdata_ram, S_data_ram_size => S_data_ram_size, Sin_Rdata_ram => Sin_Rdata_ram, Sin_DataRdy => Sin_DataRdy, proxy_out1_28861 => proxy_out1_28861, proxy_out1_28868 => proxy_out1_28868, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_STORE, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_LOAD => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_STORE => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_STORE, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_LOAD => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_STORE => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_STORE, fuselector_DPROXY_CTRLN_3_i0_LOAD => fuselector_DPROXY_CTRLN_3_i0_LOAD, fuselector_DPROXY_CTRLN_3_i0_STORE => fuselector_DPROXY_CTRLN_3_i0_STORE, fuselector_DPROXY_CTRLN_4_i0_LOAD => fuselector_DPROXY_CTRLN_4_i0_LOAD, fuselector_DPROXY_CTRLN_4_i0_STORE => fuselector_DPROXY_CTRLN_4_i0_STORE, fuselector_DPROXY_CTRLN_4_i1_LOAD => fuselector_DPROXY_CTRLN_4_i1_LOAD, fuselector_DPROXY_CTRLN_4_i1_STORE => fuselector_DPROXY_CTRLN_4_i1_STORE, selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0 => selector_MUX_0_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_0_0_0, selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_1_0_0 => selector_MUX_13_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i1_1_0_0, selector_MUX_16_DPROXY_CTRLN_3_i0_0_0_0 => selector_MUX_16_DPROXY_CTRLN_3_i0_0_0_0, selector_MUX_17_DPROXY_CTRLN_3_i0_1_0_0 => selector_MUX_17_DPROXY_CTRLN_3_i0_1_0_0, selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0 => selector_MUX_1_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_1_0_0, selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0 => selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_0, selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_1 => selector_MUX_4_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_0_0_1, selector_MUX_55_reg_5_0_0_0 => selector_MUX_55_reg_5_0_0_0, selector_MUX_56_reg_6_0_0_0 => selector_MUX_56_reg_6_0_0_0, selector_MUX_57_reg_7_0_0_0 => selector_MUX_57_reg_7_0_0_0, selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0 => selector_MUX_5_ARRAY_1D_STD_DISTRAM_NN_SDS_1_i0_1_0_0, selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0 => selector_MUX_9_ARRAY_1D_STD_DISTRAM_NN_SDS_2_i0_1_0_0, wrenable_reg_0 => wrenable_reg_0, wrenable_reg_1 => wrenable_reg_1, wrenable_reg_10 => wrenable_reg_10, wrenable_reg_11 => wrenable_reg_11, wrenable_reg_2 => wrenable_reg_2, wrenable_reg_3 => wrenable_reg_3, wrenable_reg_4 => wrenable_reg_4, wrenable_reg_5 => wrenable_reg_5, wrenable_reg_6 => wrenable_reg_6, wrenable_reg_7 => wrenable_reg_7, wrenable_reg_8 => wrenable_reg_8, wrenable_reg_9 => wrenable_reg_9);
  done_delayed_REG : flipflop_AR generic map(BITSIZE_in1=>1, BITSIZE_out1=>1) port map (out1 => done_delayed_REG_signal_out, clock => clock, reset => reset, in1 => done_delayed_REG_signal_in);
  -- io-signal post fix
  done_port <= done_delayed_REG_signal_out;

end astar_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ui_extract_bit_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer);
port (
  -- IN
  in1 : in unsigned (BITSIZE_in1-1 downto 0);
  in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
  -- OUT
  out1 : out std_logic

);
end ui_extract_bit_expr_FU;

architecture ui_extract_bit_expr_FU_arch of ui_extract_bit_expr_FU is
  begin
    process(in1, in2)
    begin
      out1 <= shift_right(unsigned(in1), to_integer(unsigned(in2)))(0);
    end process;

end ui_extract_bit_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity multi_read_cond_FU is 
generic(
 BITSIZE_in1: integer;
 PORTSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in std_logic_vector((PORTSIZE_in1*BITSIZE_in1)+(-1) downto 0) ;
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end multi_read_cond_FU;

architecture multi_read_cond_FU_arch of multi_read_cond_FU is
  begin
    out1 <= in1;
end multi_read_cond_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ge_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in signed (BITSIZE_in1-1 downto 0);
  in2 : in signed (BITSIZE_in2-1 downto 0);
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end ge_expr_FU;

architecture ge_expr_FU_arch of ge_expr_FU is
  begin
  out1(0) <= '1' when (signed(in1) >= signed(in2)) else '0';
end ge_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity lt_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in signed (BITSIZE_in1-1 downto 0);
  in2 : in signed (BITSIZE_in2-1 downto 0);
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end lt_expr_FU;

architecture lt_expr_FU_arch of lt_expr_FU is
  begin
    process(in1, in2)
       begin
      out1 <= (others => '0');
       if (signed(in1) < signed(in2)) then
        out1(0) <= '1';
      else
        out1(0) <= '0';
      end if;
  end process
  ;
end lt_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity truth_and_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
  in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end truth_and_expr_FU;

architecture truth_and_expr_FU_arch of truth_and_expr_FU is
  begin
  out1 <= std_logic_vector(resize(unsigned(in1), BITSIZE_out1) and resize(unsigned(in2), BITSIZE_out1));
end truth_and_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity truth_not_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end truth_not_expr_FU;

architecture truth_not_expr_FU_arch of truth_not_expr_FU is
  begin
  out1 <= std_logic_vector(resize(to_unsigned(1, BITSIZE_out1), BITSIZE_out1)) when (in1(0) = '0') else (others => '0');
end truth_not_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity truth_xor_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
  in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
  -- OUT
  out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 

);
end truth_xor_expr_FU;

architecture truth_xor_expr_FU_arch of truth_xor_expr_FU is
  begin
  out1 <= in1 xor in2;
end truth_xor_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2016-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ui_bit_ior_concat_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_in3: integer;
 BITSIZE_out1: integer;
 OFFSET_PARAMETER: integer);
port (
  -- IN
  in1 : in unsigned (BITSIZE_in1-1 downto 0);
  in2 : in unsigned (BITSIZE_in2-1 downto 0);
  in3 : in unsigned (BITSIZE_in3-1 downto 0);
  -- OUT
  out1 : out unsigned (BITSIZE_out1-1 downto 0)

);
end ui_bit_ior_concat_expr_FU;

architecture ui_bit_ior_concat_expr_FU_arch of ui_bit_ior_concat_expr_FU is
  function integer_ternary_operator(cond : boolean; op1 : integer; op2 : integer) return integer is
    begin
      if cond then
        return op1;
      else
        return op2;
      end if;
  end integer_ternary_operator;
    constant nbit_out : integer := integer_ternary_operator(BITSIZE_out1 > OFFSET_PARAMETER, BITSIZE_out1, 1+OFFSET_PARAMETER);
    signal tmp_in1 : unsigned(nbit_out-1 downto 0);
    signal tmp_in2 : unsigned(nbit_out-1 downto 0);
    begin
      tmp_in1 <= resize(in1, nbit_out);
      tmp_in2 <= resize(in2, nbit_out);
      out1 <= resize(tmp_in1(nbit_out-1 downto OFFSET_PARAMETER) & tmp_in2(OFFSET_PARAMETER-1 downto 0), BITSIZE_out1);
      
end ui_bit_ior_concat_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ui_lshift_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer;
 PRECISION: integer);
port (
  -- IN
  in1 : in unsigned (BITSIZE_in1-1 downto 0);
  in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
  -- OUT
  out1 : out unsigned (BITSIZE_out1-1 downto 0)

);
end ui_lshift_expr_FU;

architecture ui_lshift_expr_FU_arch of ui_lshift_expr_FU is
  begin
    process(in1, in2)
    begin
      out1 <= shift_left(resize(in1, BITSIZE_out1), to_integer(unsigned(in2) rem PRECISION));
    end process;

end ui_lshift_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ui_negate_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_out1: integer);
port (
  -- IN
  in1 : in unsigned (BITSIZE_in1-1 downto 0);
  -- OUT
  out1 : out unsigned (BITSIZE_out1-1 downto 0)

);
end ui_negate_expr_FU;

architecture ui_negate_expr_FU_arch of ui_negate_expr_FU is
  begin
    out1 <= unsigned(-signed(resize(in1, BITSIZE_out1)));

end ui_negate_expr_FU_arch;

-- This component is part of the BAMBU/PANDA IP LIBRARY
-- Copyright (C) 2004-2020 Politecnico di Milano
-- Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
-- License: PANDA_LGPLv3
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity ui_rshift_expr_FU is 
generic(
 BITSIZE_in1: integer;
 BITSIZE_in2: integer;
 BITSIZE_out1: integer;
 PRECISION: integer);
port (
  -- IN
  in1 : in unsigned (BITSIZE_in1-1 downto 0);
  in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
  -- OUT
  out1 : out unsigned (BITSIZE_out1-1 downto 0)

);
end ui_rshift_expr_FU;

architecture ui_rshift_expr_FU_arch of ui_rshift_expr_FU is
  begin
    process(in1, in2)
    begin
      out1 <= resize(shift_right(in1, to_integer(unsigned(in2) rem PRECISION)), BITSIZE_out1);
    end process;

end ui_rshift_expr_FU_arch;

-- Datapath RTL description for make_oriented
-- This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
-- Author(s): Component automatically generated by bambu
-- License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity datapath_make_oriented is 
generic(
  MEM_var_28859_28870: integer := 96;
  MEM_var_28861_28878: integer := 32;
  MEM_var_28868_28878: integer := 64);
port (
  -- IN
  clock : in std_logic;
  reset : in std_logic;
  S_oe_ram : in std_logic_vector (1 downto 0);
  S_we_ram : in std_logic_vector (1 downto 0);
  S_addr_ram : in std_logic_vector(15 downto 0) ;
  S_Wdata_ram : in std_logic_vector(15 downto 0) ;
  S_data_ram_size : in std_logic_vector(7 downto 0) ;
  Sin_Rdata_ram : in std_logic_vector(15 downto 0) ;
  Sin_DataRdy : in std_logic_vector (1 downto 0);
  proxy_out1_28861 : in std_logic_vector(15 downto 0) ;
  proxy_out1_28868 : in std_logic_vector(15 downto 0) ;
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD : in std_logic;
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE : in std_logic;
  fuselector_DPROXY_CTRLN_1_i0_LOAD : in std_logic;
  fuselector_DPROXY_CTRLN_1_i0_STORE : in std_logic;
  fuselector_DPROXY_CTRLN_2_i0_LOAD : in std_logic;
  fuselector_DPROXY_CTRLN_2_i0_STORE : in std_logic;
  selector_MUX_36_reg_10_0_0_0 : in std_logic;
  selector_MUX_4_DPROXY_CTRLN_1_i0_0_0_0 : in std_logic;
  selector_MUX_51_reg_9_0_0_0 : in std_logic;
  selector_MUX_51_reg_9_0_0_1 : in std_logic;
  selector_MUX_5_DPROXY_CTRLN_1_i0_1_0_0 : in std_logic;
  selector_MUX_8_DPROXY_CTRLN_2_i0_0_0_0 : in std_logic;
  selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0 : in std_logic;
  selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_1 : in std_logic;
  selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_2 : in std_logic;
  selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_0 : in std_logic;
  selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_1 : in std_logic;
  wrenable_reg_0 : in std_logic;
  wrenable_reg_1 : in std_logic;
  wrenable_reg_10 : in std_logic;
  wrenable_reg_11 : in std_logic;
  wrenable_reg_12 : in std_logic;
  wrenable_reg_13 : in std_logic;
  wrenable_reg_14 : in std_logic;
  wrenable_reg_15 : in std_logic;
  wrenable_reg_16 : in std_logic;
  wrenable_reg_17 : in std_logic;
  wrenable_reg_2 : in std_logic;
  wrenable_reg_3 : in std_logic;
  wrenable_reg_4 : in std_logic;
  wrenable_reg_5 : in std_logic;
  wrenable_reg_6 : in std_logic;
  wrenable_reg_7 : in std_logic;
  wrenable_reg_8 : in std_logic;
  wrenable_reg_9 : in std_logic;
  -- OUT
  Sout_Rdata_ram : out std_logic_vector(15 downto 0) ;
  Sout_DataRdy : out std_logic_vector (1 downto 0);
  proxy_in1_28861 : out std_logic_vector(15 downto 0) ;
  proxy_in2_28861 : out std_logic_vector(15 downto 0) ;
  proxy_in3_28861 : out std_logic_vector(7 downto 0) ;
  proxy_sel_LOAD_28861 : out std_logic_vector (1 downto 0);
  proxy_sel_STORE_28861 : out std_logic_vector (1 downto 0);
  proxy_in1_28868 : out std_logic_vector(15 downto 0) ;
  proxy_in2_28868 : out std_logic_vector(15 downto 0) ;
  proxy_in3_28868 : out std_logic_vector(7 downto 0) ;
  proxy_sel_LOAD_28868 : out std_logic_vector (1 downto 0);
  proxy_sel_STORE_28868 : out std_logic_vector (1 downto 0);
  OUT_CONDITION_make_oriented_28870_29025 : out std_logic;
  OUT_CONDITION_make_oriented_28870_29042 : out std_logic;
  OUT_MULTIIF_make_oriented_28870_29832 : out std_logic_vector(1 downto 0) 

);
end datapath_make_oriented;

architecture datapath_make_oriented_arch of datapath_make_oriented is
  -- Component and signal declarations
  
  component constant_value
  generic(
   BITSIZE_out1: integer;
   value: std_logic_vector);
  port (
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component register_SE
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    wenable : in std_logic;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component register_STD
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    wenable : in std_logic;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component ARRAY_1D_STD_DISTRAM_NN_SDS
  generic(
   BITSIZE_in1: integer;
   PORTSIZE_in1: integer;
   BITSIZE_in2: integer;
   PORTSIZE_in2: integer;
   BITSIZE_in3: integer;
   PORTSIZE_in3: integer;
   BITSIZE_in4: integer;
   PORTSIZE_in4: integer;
   BITSIZE_sel_LOAD: integer;
   PORTSIZE_sel_LOAD: integer;
   BITSIZE_sel_STORE: integer;
   PORTSIZE_sel_STORE: integer;
   BITSIZE_S_oe_ram: integer;
   PORTSIZE_S_oe_ram: integer;
   BITSIZE_S_we_ram: integer;
   PORTSIZE_S_we_ram: integer;
   BITSIZE_out1: integer;
   PORTSIZE_out1: integer;
   BITSIZE_S_addr_ram: integer;
   PORTSIZE_S_addr_ram: integer;
   BITSIZE_S_Wdata_ram: integer;
   PORTSIZE_S_Wdata_ram: integer;
   BITSIZE_Sin_Rdata_ram: integer;
   PORTSIZE_Sin_Rdata_ram: integer;
   BITSIZE_Sout_Rdata_ram: integer;
   PORTSIZE_Sout_Rdata_ram: integer;
   BITSIZE_S_data_ram_size: integer;
   PORTSIZE_S_data_ram_size: integer;
   BITSIZE_Sin_DataRdy: integer;
   PORTSIZE_Sin_DataRdy: integer;
   BITSIZE_Sout_DataRdy: integer;
   PORTSIZE_Sout_DataRdy: integer;
   MEMORY_INIT_file: string;
   n_elements: integer;
   data_size: integer;
   address_space_begin: integer;
   address_space_rangesize: integer;
   BUS_PIPELINED: integer;
   BRAM_BITSIZE: integer;
   PRIVATE_MEMORY: integer;
   READ_ONLY_MEMORY: integer;
   USE_SPARSE_MEMORY: integer;
   BITSIZE_proxy_in1: integer;
   PORTSIZE_proxy_in1: integer;
   BITSIZE_proxy_in2: integer;
   PORTSIZE_proxy_in2: integer;
   BITSIZE_proxy_in3: integer;
   PORTSIZE_proxy_in3: integer;
   BITSIZE_proxy_sel_LOAD: integer;
   PORTSIZE_proxy_sel_LOAD: integer;
   BITSIZE_proxy_sel_STORE: integer;
   PORTSIZE_proxy_sel_STORE: integer;
   BITSIZE_proxy_out1: integer;
   PORTSIZE_proxy_out1: integer);
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    in1 : in std_logic_vector((PORTSIZE_in1*BITSIZE_in1)+(-1) downto 0) ;
    in2 : in std_logic_vector((PORTSIZE_in2*BITSIZE_in2)+(-1) downto 0) ;
    in3 : in std_logic_vector((PORTSIZE_in3*BITSIZE_in3)+(-1) downto 0) ;
    in4 : in std_logic_vector((PORTSIZE_in4*BITSIZE_in4)-1 downto 0) ;
    sel_LOAD : in std_logic_vector((PORTSIZE_sel_LOAD*BITSIZE_sel_LOAD)-1 downto 0) ;
    sel_STORE : in std_logic_vector((PORTSIZE_sel_STORE*BITSIZE_sel_STORE)-1 downto 0) ;
    S_oe_ram : in std_logic_vector((PORTSIZE_S_oe_ram*BITSIZE_S_oe_ram)-1 downto 0) ;
    S_we_ram : in std_logic_vector((PORTSIZE_S_we_ram*BITSIZE_S_we_ram)-1 downto 0) ;
    S_addr_ram : in std_logic_vector((PORTSIZE_S_addr_ram*BITSIZE_S_addr_ram)+(-1) downto 0) ;
    S_Wdata_ram : in std_logic_vector((PORTSIZE_S_Wdata_ram*BITSIZE_S_Wdata_ram)+(-1) downto 0) ;
    Sin_Rdata_ram : in std_logic_vector((PORTSIZE_Sin_Rdata_ram*BITSIZE_Sin_Rdata_ram)+(-1) downto 0) ;
    S_data_ram_size : in std_logic_vector((PORTSIZE_S_data_ram_size*BITSIZE_S_data_ram_size)+(-1) downto 0) ;
    Sin_DataRdy : in std_logic_vector((PORTSIZE_Sin_DataRdy*BITSIZE_Sin_DataRdy)-1 downto 0) ;
    proxy_in1 : in std_logic_vector((PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1) downto 0) ;
    proxy_in2 : in std_logic_vector((PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1) downto 0) ;
    proxy_in3 : in std_logic_vector((PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1) downto 0) ;
    proxy_sel_LOAD : in std_logic_vector((PORTSIZE_proxy_sel_LOAD*BITSIZE_proxy_sel_LOAD)-1 downto 0) ;
    proxy_sel_STORE : in std_logic_vector((PORTSIZE_proxy_sel_STORE*BITSIZE_proxy_sel_STORE)-1 downto 0) ;
    -- OUT
    out1 : out std_logic_vector((PORTSIZE_out1*BITSIZE_out1)+(-1) downto 0) ;
    Sout_Rdata_ram : out std_logic_vector((PORTSIZE_Sout_Rdata_ram*BITSIZE_Sout_Rdata_ram)+(-1) downto 0) ;
    Sout_DataRdy : out std_logic_vector((PORTSIZE_Sout_DataRdy*BITSIZE_Sout_DataRdy)-1 downto 0) ;
    proxy_out1 : out std_logic_vector((PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1) downto 0) 
  
  );
  end component;
  
  component DPROXY_CTRLN
  generic(
   BITSIZE_in1: integer;
   PORTSIZE_in1: integer;
   BITSIZE_in2: integer;
   PORTSIZE_in2: integer;
   BITSIZE_in3: integer;
   PORTSIZE_in3: integer;
   BITSIZE_in4: integer;
   PORTSIZE_in4: integer;
   BITSIZE_sel_LOAD: integer;
   PORTSIZE_sel_LOAD: integer;
   BITSIZE_sel_STORE: integer;
   PORTSIZE_sel_STORE: integer;
   BITSIZE_out1: integer;
   PORTSIZE_out1: integer;
   BITSIZE_proxy_in1: integer;
   PORTSIZE_proxy_in1: integer;
   BITSIZE_proxy_in2: integer;
   PORTSIZE_proxy_in2: integer;
   BITSIZE_proxy_in3: integer;
   PORTSIZE_proxy_in3: integer;
   BITSIZE_proxy_sel_LOAD: integer;
   PORTSIZE_proxy_sel_LOAD: integer;
   BITSIZE_proxy_sel_STORE: integer;
   PORTSIZE_proxy_sel_STORE: integer;
   BITSIZE_proxy_out1: integer;
   PORTSIZE_proxy_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector((PORTSIZE_in1*BITSIZE_in1)+(-1) downto 0) ;
    in2 : in std_logic_vector((PORTSIZE_in2*BITSIZE_in2)+(-1) downto 0) ;
    in3 : in std_logic_vector((PORTSIZE_in3*BITSIZE_in3)+(-1) downto 0) ;
    in4 : in std_logic_vector((PORTSIZE_in4*BITSIZE_in4)-1 downto 0) ;
    sel_LOAD : in std_logic_vector((PORTSIZE_sel_LOAD*BITSIZE_sel_LOAD)-1 downto 0) ;
    sel_STORE : in std_logic_vector((PORTSIZE_sel_STORE*BITSIZE_sel_STORE)-1 downto 0) ;
    proxy_out1 : in std_logic_vector((PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1) downto 0) ;
    -- OUT
    out1 : out std_logic_vector((PORTSIZE_out1*BITSIZE_out1)+(-1) downto 0) ;
    proxy_in1 : out std_logic_vector((PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1) downto 0) ;
    proxy_in2 : out std_logic_vector((PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1) downto 0) ;
    proxy_in3 : out std_logic_vector((PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1) downto 0) ;
    proxy_sel_LOAD : out std_logic_vector((PORTSIZE_proxy_sel_LOAD*BITSIZE_proxy_sel_LOAD)-1 downto 0) ;
    proxy_sel_STORE : out std_logic_vector((PORTSIZE_proxy_sel_STORE*BITSIZE_proxy_sel_STORE)-1 downto 0) 
  
  );
  end component;
  
  component addr_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component UUdata_converter_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component ui_extract_bit_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
    -- OUT
    out1 : out std_logic
  
  );
  end component;
  
  component IUdata_converter_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in signed (BITSIZE_in1-1 downto 0);
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component UIdata_converter_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    -- OUT
    out1 : out signed (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component read_cond_FU
  generic(
   BITSIZE_in1: integer);
  port (
    -- IN
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    -- OUT
    out1 : out std_logic
  
  );
  end component;
  
  component multi_read_cond_FU
  generic(
   BITSIZE_in1: integer;
   PORTSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector((PORTSIZE_in1*BITSIZE_in1)+(-1) downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component ge_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in signed (BITSIZE_in1-1 downto 0);
    in2 : in signed (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component lt_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in signed (BITSIZE_in1-1 downto 0);
    in2 : in signed (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component truth_and_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component truth_not_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component truth_xor_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component ui_bit_and_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component ui_bit_ior_concat_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_in3: integer;
   BITSIZE_out1: integer;
   OFFSET_PARAMETER: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    in3 : in unsigned (BITSIZE_in3-1 downto 0);
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component ui_cond_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_in3: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    in3 : in unsigned (BITSIZE_in3-1 downto 0);
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component ui_lshift_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer;
   PRECISION: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component ui_ne_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component ui_negate_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component ui_plus_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component ui_pointer_plus_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer;
   LSB_PARAMETER: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in unsigned (BITSIZE_in2-1 downto 0);
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component ui_rshift_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer;
   PRECISION: integer);
  port (
    -- IN
    in1 : in unsigned (BITSIZE_in1-1 downto 0);
    in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
    -- OUT
    out1 : out unsigned (BITSIZE_out1-1 downto 0)
  
  );
  end component;
  
  component bus_merger
  generic(
   BITSIZE_in1: integer;
   PORTSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector((PORTSIZE_in1*BITSIZE_in1)+(-1) downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component join_signal
  generic(
   BITSIZE_in1: integer;
   PORTSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector((PORTSIZE_in1*BITSIZE_in1)+(-1) downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component split_signal
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer;
   PORTSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    -- OUT
    out1 : out std_logic_vector((PORTSIZE_out1*BITSIZE_out1)+(-1) downto 0) 
  
  );
  end component;
  
  component ASSIGN_VECTOR_BOOL_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component MUX_GATE
  generic(
   BITSIZE_in1: integer;
   BITSIZE_in2: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    sel : in std_logic;
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    in2 : in std_logic_vector(BITSIZE_in2-1 downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  signal null_out_signal_DPROXY_CTRLN_1_i0_out1_0 : std_logic_vector(7 downto 0) ;
  signal null_out_signal_DPROXY_CTRLN_1_i0_out1_1 : std_logic_vector(7 downto 0) ;
  signal null_out_signal_DPROXY_CTRLN_2_i0_out1_1 : std_logic_vector(7 downto 0) ;
  signal null_out_signal_array_28859_0_out1_0 : std_logic_vector(7 downto 0) ;
  signal null_out_signal_array_28859_0_out1_1 : std_logic_vector(7 downto 0) ;
  signal null_out_signal_array_28859_0_proxy_out1_0 : std_logic_vector(7 downto 0) ;
  signal null_out_signal_array_28859_0_proxy_out1_1 : std_logic_vector(7 downto 0) ;
  signal out_DPROXY_CTRLN_2_i0_DPROXY_CTRLN_2_i0 : std_logic_vector(7 downto 0) ;
  signal out_IUdata_converter_FU_25_i0_fu_make_oriented_28870_28987 : unsigned (7 downto 0);
  signal out_MUX_36_reg_10_0_0_0 : std_logic_vector(0 downto 0);
  signal out_MUX_4_DPROXY_CTRLN_1_i0_0_0_0 : std_logic_vector(7 downto 0) ;
  signal out_MUX_51_reg_9_0_0_0 : std_logic_vector(31 downto 0) ;
  signal out_MUX_51_reg_9_0_0_1 : std_logic_vector(31 downto 0) ;
  signal out_MUX_5_DPROXY_CTRLN_1_i0_1_0_0 : std_logic_vector(7 downto 0) ;
  signal out_MUX_8_DPROXY_CTRLN_2_i0_0_0_0 : std_logic_vector(7 downto 0) ;
  signal out_MUX_9_DPROXY_CTRLN_2_i0_1_0_0 : std_logic_vector(7 downto 0) ;
  signal out_MUX_9_DPROXY_CTRLN_2_i0_1_0_1 : std_logic_vector(7 downto 0) ;
  signal out_MUX_9_DPROXY_CTRLN_2_i0_1_0_2 : std_logic_vector(7 downto 0) ;
  signal out_MUX_9_DPROXY_CTRLN_2_i0_1_1_0 : std_logic_vector(7 downto 0) ;
  signal out_MUX_9_DPROXY_CTRLN_2_i0_1_1_1 : std_logic_vector(7 downto 0) ;
  signal out_UIdata_converter_FU_26_i0_fu_make_oriented_28870_28976 : signed (7 downto 0);
  signal out_UUdata_converter_FU_14_i0_fu_make_oriented_28870_29679 : std_logic_vector(0 downto 0);
  signal out_UUdata_converter_FU_15_i0_fu_make_oriented_28870_29657 : std_logic_vector(0 downto 0);
  signal out_UUdata_converter_FU_23_i0_fu_make_oriented_28870_28965 : std_logic_vector(6 downto 0) ;
  signal out_UUdata_converter_FU_7_i0_fu_make_oriented_28870_28927 : std_logic_vector(31 downto 0) ;
  signal out_addr_expr_FU_5_i0_fu_make_oriented_28870_29605 : std_logic_vector(5 downto 0) ;
  signal out_addr_expr_FU_6_i0_fu_make_oriented_28870_29608 : std_logic_vector(31 downto 0) ;
  signal out_addr_expr_FU_8_i0_fu_make_oriented_28870_29697 : std_logic_vector(6 downto 0) ;
  signal out_const_0 : std_logic_vector(0 downto 0);
  signal out_const_1 : std_logic_vector(7 downto 0) ;
  signal out_const_10 : std_logic_vector(6 downto 0) ;
  signal out_const_2 : std_logic_vector(7 downto 0) ;
  signal out_const_3 : std_logic_vector(4 downto 0) ;
  signal out_const_4 : std_logic_vector(0 downto 0);
  signal out_const_5 : std_logic_vector(1 downto 0) ;
  signal out_const_6 : std_logic_vector(1 downto 0) ;
  signal out_const_7 : std_logic_vector(7 downto 0) ;
  signal out_const_8 : std_logic_vector(5 downto 0) ;
  signal out_const_9 : std_logic_vector(7 downto 0) ;
  signal out_conv_out_UUdata_converter_FU_23_i0_fu_make_oriented_28870_28965_7_8 : std_logic_vector(7 downto 0) ;
  signal out_conv_out_addr_expr_FU_5_i0_fu_make_oriented_28870_29605_6_8 : std_logic_vector(7 downto 0) ;
  signal out_conv_out_const_10_7_32 : std_logic_vector(31 downto 0) ;
  signal out_conv_out_const_3_5_4 : std_logic_vector(3 downto 0) ;
  signal out_conv_out_const_8_6_32 : std_logic_vector(31 downto 0) ;
  signal out_conv_out_const_9_8_32 : std_logic_vector(31 downto 0) ;
  signal out_conv_out_reg_0_reg_0_6_8 : std_logic_vector(7 downto 0) ;
  signal out_conv_out_reg_11_reg_11_7_8 : std_logic_vector(7 downto 0) ;
  signal out_conv_out_reg_13_reg_13_7_8 : std_logic_vector(7 downto 0) ;
  signal out_conv_out_reg_17_reg_17_7_8 : std_logic_vector(7 downto 0) ;
  signal out_conv_out_reg_2_reg_2_7_8 : std_logic_vector(7 downto 0) ;
  signal out_conv_out_reg_4_reg_4_7_8 : std_logic_vector(7 downto 0) ;
  signal out_conv_out_ui_pointer_plus_expr_FU_8_8_8_52_i0_fu_make_oriented_28870_29622_7_8 : std_logic_vector(7 downto 0) ;
  signal out_ge_expr_FU_8_0_8_34_i0_fu_make_oriented_28870_29673 : std_logic_vector(0 downto 0);
  signal out_iu_conv_conn_obj_1_IUdata_converter_FU_iu_conv_0 : unsigned (7 downto 0);
  signal out_iu_conv_conn_obj_2_IUdata_converter_FU_iu_conv_1 : unsigned (7 downto 0);
  signal out_lt_expr_FU_8_0_8_35_i0_fu_make_oriented_28870_29023 : std_logic_vector(0 downto 0);
  signal out_multi_read_cond_FU_32_i0_fu_make_oriented_28870_29832 : std_logic_vector(1 downto 0) ;
  signal out_read_cond_FU_27_i0_fu_make_oriented_28870_29025 : std_logic;
  signal out_read_cond_FU_29_i0_fu_make_oriented_28870_29042 : std_logic;
  signal out_reg_0_reg_0 : std_logic_vector(5 downto 0) ;
  signal out_reg_10_reg_10 : std_logic_vector(0 downto 0);
  signal out_reg_11_reg_11 : std_logic_vector(6 downto 0) ;
  signal out_reg_12_reg_12 : std_logic_vector(31 downto 0) ;
  signal out_reg_13_reg_13 : std_logic_vector(6 downto 0) ;
  signal out_reg_14_reg_14 : std_logic_vector(0 downto 0);
  signal out_reg_15_reg_15 : std_logic_vector(0 downto 0);
  signal out_reg_16_reg_16 : std_logic_vector(7 downto 0) ;
  signal out_reg_17_reg_17 : std_logic_vector(6 downto 0) ;
  signal out_reg_1_reg_1 : std_logic_vector(31 downto 0) ;
  signal out_reg_2_reg_2 : std_logic_vector(6 downto 0) ;
  signal out_reg_3_reg_3 : std_logic_vector(31 downto 0) ;
  signal out_reg_4_reg_4 : std_logic_vector(6 downto 0) ;
  signal out_reg_5_reg_5 : std_logic_vector(0 downto 0);
  signal out_reg_6_reg_6 : std_logic_vector(0 downto 0);
  signal out_reg_7_reg_7 : std_logic_vector(0 downto 0);
  signal out_reg_8_reg_8 : std_logic_vector(0 downto 0);
  signal out_reg_9_reg_9 : std_logic_vector(31 downto 0) ;
  signal out_truth_and_expr_FU_1_1_1_36_i0_fu_make_oriented_28870_29838 : std_logic_vector(0 downto 0);
  signal out_truth_not_expr_FU_1_1_37_i0_fu_make_oriented_28870_29835 : std_logic_vector(0 downto 0);
  signal out_truth_xor_expr_FU_1_1_1_38_i0_fu_make_oriented_28870_29758 : std_logic_vector(0 downto 0);
  signal out_ui_bit_and_expr_FU_1_0_1_39_i0_fu_make_oriented_28870_29744 : unsigned (0 downto 0);
  signal out_ui_bit_and_expr_FU_1_0_1_39_i1_fu_make_oriented_28870_29797 : unsigned (0 downto 0);
  signal out_ui_bit_and_expr_FU_1_0_1_40_i0_fu_make_oriented_28870_29772 : unsigned (0 downto 0);
  signal out_ui_bit_and_expr_FU_1_0_1_40_i1_fu_make_oriented_28870_29784 : unsigned (0 downto 0);
  signal out_ui_bit_and_expr_FU_1_1_1_41_i0_fu_make_oriented_28870_29024 : unsigned (0 downto 0);
  signal out_ui_bit_ior_concat_expr_FU_42_i0_fu_make_oriented_28870_29006 : unsigned (31 downto 0);
  signal out_ui_bit_ior_concat_expr_FU_43_i0_fu_make_oriented_28870_29629 : unsigned (1 downto 0);
  signal out_ui_bit_ior_concat_expr_FU_44_i0_fu_make_oriented_28870_29660 : unsigned (1 downto 0);
  signal out_ui_bit_ior_concat_expr_FU_44_i1_fu_make_oriented_28870_29682 : unsigned (1 downto 0);
  signal out_ui_cond_expr_FU_8_8_8_8_45_i0_fu_make_oriented_28870_28944 : unsigned (1 downto 0);
  signal out_ui_extract_bit_expr_FU_13_i0_fu_make_oriented_28870_29826 : std_logic;
  signal out_ui_extract_bit_expr_FU_24_i0_fu_make_oriented_28870_29822 : std_logic;
  signal out_ui_lshift_expr_FU_32_0_32_46_i0_fu_make_oriented_28870_29794 : unsigned (31 downto 0);
  signal out_ui_lshift_expr_FU_8_0_8_47_i0_fu_make_oriented_28870_29676 : unsigned (1 downto 0);
  signal out_ui_lshift_expr_FU_8_0_8_47_i1_fu_make_oriented_28870_29781 : unsigned (1 downto 0);
  signal out_ui_ne_expr_FU_1_0_1_48_i0_ui_ne_expr_FU_1_0_1_48_i0 : std_logic_vector(0 downto 0);
  signal out_ui_negate_expr_FU_8_8_49_i0_fu_make_oriented_28870_28980 : unsigned (7 downto 0);
  signal out_ui_plus_expr_FU_32_0_32_50_i0_fu_make_oriented_28870_28973 : unsigned (31 downto 0);
  signal out_ui_plus_expr_FU_32_0_32_51_i0_fu_make_oriented_28870_29791 : unsigned (30 downto 0);
  signal out_ui_pointer_plus_expr_FU_8_8_8_52_i0_fu_make_oriented_28870_29622 : unsigned (6 downto 0);
  signal out_ui_pointer_plus_expr_FU_8_8_8_52_i1_fu_make_oriented_28870_29635 : unsigned (6 downto 0);
  signal out_ui_pointer_plus_expr_FU_8_8_8_52_i2_fu_make_oriented_28870_29666 : unsigned (6 downto 0);
  signal out_ui_pointer_plus_expr_FU_8_8_8_52_i3_fu_make_oriented_28870_29688 : unsigned (6 downto 0);
  signal out_ui_rshift_expr_FU_32_0_32_53_i0_fu_make_oriented_28870_29788 : unsigned (30 downto 0);
  signal out_ui_rshift_expr_FU_8_0_8_54_i0_fu_make_oriented_28870_29776 : unsigned (0 downto 0);
  signal out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_2 : std_logic_vector(7 downto 0) ;
  signal out_vb_assign_conn_obj_3_ASSIGN_VECTOR_BOOL_FU_vb_assign_3 : std_logic_vector(7 downto 0) ;
  signal sig_in_bus_mergerSout_DataRdy0_0 : std_logic_vector(1 downto 0) ;
  signal sig_in_bus_mergerSout_Rdata_ram1_0 : std_logic_vector(15 downto 0) ;
  signal sig_in_bus_mergerproxy_in1_288612_0 : std_logic_vector(15 downto 0) ;
  signal sig_in_bus_mergerproxy_in1_288683_0 : std_logic_vector(15 downto 0) ;
  signal sig_in_bus_mergerproxy_in2_288614_0 : std_logic_vector(15 downto 0) ;
  signal sig_in_bus_mergerproxy_in2_288685_0 : std_logic_vector(15 downto 0) ;
  signal sig_in_bus_mergerproxy_in3_288616_0 : std_logic_vector(7 downto 0) ;
  signal sig_in_bus_mergerproxy_in3_288687_0 : std_logic_vector(7 downto 0) ;
  signal sig_in_bus_mergerproxy_sel_LOAD_288618_0 : std_logic_vector(1 downto 0) ;
  signal sig_in_bus_mergerproxy_sel_LOAD_288689_0 : std_logic_vector(1 downto 0) ;
  signal sig_in_bus_mergerproxy_sel_STORE_2886110_0 : std_logic_vector(1 downto 0) ;
  signal sig_in_bus_mergerproxy_sel_STORE_2886811_0 : std_logic_vector(1 downto 0) ;
  signal sig_in_vector_bus_mergerSout_DataRdy0_0 : std_logic_vector (1 downto 0);
  signal sig_in_vector_bus_mergerSout_Rdata_ram1_0 : std_logic_vector (15 downto 0);
  signal sig_in_vector_bus_mergerproxy_in1_288612_0 : std_logic_vector (15 downto 0);
  signal sig_in_vector_bus_mergerproxy_in1_288683_0 : std_logic_vector (15 downto 0);
  signal sig_in_vector_bus_mergerproxy_in2_288614_0 : std_logic_vector (15 downto 0);
  signal sig_in_vector_bus_mergerproxy_in2_288685_0 : std_logic_vector (15 downto 0);
  signal sig_in_vector_bus_mergerproxy_in3_288616_0 : std_logic_vector (7 downto 0);
  signal sig_in_vector_bus_mergerproxy_in3_288687_0 : std_logic_vector (7 downto 0);
  signal sig_in_vector_bus_mergerproxy_sel_LOAD_288618_0 : std_logic_vector (1 downto 0);
  signal sig_in_vector_bus_mergerproxy_sel_LOAD_288689_0 : std_logic_vector (1 downto 0);
  signal sig_in_vector_bus_mergerproxy_sel_STORE_2886110_0 : std_logic_vector (1 downto 0);
  signal sig_in_vector_bus_mergerproxy_sel_STORE_2886811_0 : std_logic_vector (1 downto 0);
  signal \sig_out_bus_mergerSout_DataRdy0_\ : std_logic_vector(1 downto 0) ;
  signal \sig_out_bus_mergerSout_Rdata_ram1_\ : std_logic_vector(15 downto 0) ;
  signal \sig_out_bus_mergerproxy_in1_288612_\ : std_logic_vector(15 downto 0) ;
  signal \sig_out_bus_mergerproxy_in1_288683_\ : std_logic_vector(15 downto 0) ;
  signal \sig_out_bus_mergerproxy_in2_288614_\ : std_logic_vector(15 downto 0) ;
  signal \sig_out_bus_mergerproxy_in2_288685_\ : std_logic_vector(15 downto 0) ;
  signal \sig_out_bus_mergerproxy_in3_288616_\ : std_logic_vector(7 downto 0) ;
  signal \sig_out_bus_mergerproxy_in3_288687_\ : std_logic_vector(7 downto 0) ;
  signal \sig_out_bus_mergerproxy_sel_LOAD_288618_\ : std_logic_vector(1 downto 0) ;
  signal \sig_out_bus_mergerproxy_sel_LOAD_288689_\ : std_logic_vector(1 downto 0) ;
  signal \sig_out_bus_mergerproxy_sel_STORE_2886110_\ : std_logic_vector(1 downto 0) ;
  signal \sig_out_bus_mergerproxy_sel_STORE_2886811_\ : std_logic_vector(1 downto 0) ;
begin
  ASSIGN_VECTOR_BOOL_FU_vb_assign_2 : ASSIGN_VECTOR_BOOL_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_2, in1 => out_const_1);
  ASSIGN_VECTOR_BOOL_FU_vb_assign_3 : ASSIGN_VECTOR_BOOL_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_vb_assign_conn_obj_3_ASSIGN_VECTOR_BOOL_FU_vb_assign_3, in1 => out_const_2);
  DPROXY_CTRLN_1_i0 : DPROXY_CTRLN generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_in2=>8, PORTSIZE_in2=>2, BITSIZE_in3=>4, PORTSIZE_in3=>2, BITSIZE_in4=>1, PORTSIZE_in4=>2, BITSIZE_sel_LOAD=>1, PORTSIZE_sel_LOAD=>2, BITSIZE_sel_STORE=>1, PORTSIZE_sel_STORE=>2, BITSIZE_out1=>8, PORTSIZE_out1=>2, BITSIZE_proxy_in1=>8, PORTSIZE_proxy_in1=>2, BITSIZE_proxy_in2=>8, PORTSIZE_proxy_in2=>2, BITSIZE_proxy_in3=>4, PORTSIZE_proxy_in3=>2, BITSIZE_proxy_sel_LOAD=>1, PORTSIZE_proxy_sel_LOAD=>2, BITSIZE_proxy_sel_STORE=>1, PORTSIZE_proxy_sel_STORE=>2, BITSIZE_proxy_out1=>8, PORTSIZE_proxy_out1=>2) port map (out1(15 downto 8) => null_out_signal_DPROXY_CTRLN_1_i0_out1_1, out1(7 downto 0) => null_out_signal_DPROXY_CTRLN_1_i0_out1_0, proxy_in1 => sig_in_vector_bus_mergerproxy_in1_288612_0, proxy_in2 => sig_in_vector_bus_mergerproxy_in2_288614_0, proxy_in3 => sig_in_vector_bus_mergerproxy_in3_288616_0, proxy_sel_LOAD => sig_in_vector_bus_mergerproxy_sel_LOAD_288618_0, proxy_sel_STORE => sig_in_vector_bus_mergerproxy_sel_STORE_2886110_0, in1(15 downto 8) => "00000000", in1(7 downto 0) => out_MUX_4_DPROXY_CTRLN_1_i0_0_0_0, in2(15 downto 8) => "00000000", in2(7 downto 0) => out_MUX_5_DPROXY_CTRLN_1_i0_1_0_0, in3(7 downto 4) => "0000", in3(3 downto 0) => out_conv_out_const_3_5_4, in4(1 downto 1) => "0", in4(0 downto 0) => out_const_4, sel_LOAD(1 downto 1) => "0", sel_LOAD(0) => fuselector_DPROXY_CTRLN_1_i0_LOAD, sel_STORE(1 downto 1) => "0", sel_STORE(0) => fuselector_DPROXY_CTRLN_1_i0_STORE, proxy_out1 => proxy_out1_28861);
  DPROXY_CTRLN_2_i0 : DPROXY_CTRLN generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_in2=>8, PORTSIZE_in2=>2, BITSIZE_in3=>4, PORTSIZE_in3=>2, BITSIZE_in4=>1, PORTSIZE_in4=>2, BITSIZE_sel_LOAD=>1, PORTSIZE_sel_LOAD=>2, BITSIZE_sel_STORE=>1, PORTSIZE_sel_STORE=>2, BITSIZE_out1=>8, PORTSIZE_out1=>2, BITSIZE_proxy_in1=>8, PORTSIZE_proxy_in1=>2, BITSIZE_proxy_in2=>8, PORTSIZE_proxy_in2=>2, BITSIZE_proxy_in3=>4, PORTSIZE_proxy_in3=>2, BITSIZE_proxy_sel_LOAD=>1, PORTSIZE_proxy_sel_LOAD=>2, BITSIZE_proxy_sel_STORE=>1, PORTSIZE_proxy_sel_STORE=>2, BITSIZE_proxy_out1=>8, PORTSIZE_proxy_out1=>2) port map (out1(15 downto 8) => null_out_signal_DPROXY_CTRLN_2_i0_out1_1, out1(7 downto 0) => out_DPROXY_CTRLN_2_i0_DPROXY_CTRLN_2_i0, proxy_in1 => sig_in_vector_bus_mergerproxy_in1_288683_0, proxy_in2 => sig_in_vector_bus_mergerproxy_in2_288685_0, proxy_in3 => sig_in_vector_bus_mergerproxy_in3_288687_0, proxy_sel_LOAD => sig_in_vector_bus_mergerproxy_sel_LOAD_288689_0, proxy_sel_STORE => sig_in_vector_bus_mergerproxy_sel_STORE_2886811_0, in1(15 downto 8) => "00000000", in1(7 downto 0) => out_MUX_8_DPROXY_CTRLN_2_i0_0_0_0, in2(15 downto 8) => "00000000", in2(7 downto 0) => out_MUX_9_DPROXY_CTRLN_2_i0_1_1_1, in3(7 downto 4) => "0000", in3(3 downto 0) => out_conv_out_const_3_5_4, in4(1 downto 1) => "0", in4(0 downto 0) => out_const_4, sel_LOAD(1 downto 1) => "0", sel_LOAD(0) => fuselector_DPROXY_CTRLN_2_i0_LOAD, sel_STORE(1 downto 1) => "0", sel_STORE(0) => fuselector_DPROXY_CTRLN_2_i0_STORE, proxy_out1 => proxy_out1_28868);
  IUdata_converter_FU_iu_conv_0 : IUdata_converter_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_iu_conv_conn_obj_1_IUdata_converter_FU_iu_conv_0, in1 => signed(out_const_7));
  IUdata_converter_FU_iu_conv_1 : IUdata_converter_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_iu_conv_conn_obj_2_IUdata_converter_FU_iu_conv_1, in1 => signed(out_reg_16_reg_16));
  MUX_36_reg_10_0_0_0 : MUX_GATE generic map(BITSIZE_in1=>1, BITSIZE_in2=>1, BITSIZE_out1=>1) port map (out1 => out_MUX_36_reg_10_0_0_0, sel => selector_MUX_36_reg_10_0_0_0, in1 => out_const_0, in2 => out_const_4);
  MUX_4_DPROXY_CTRLN_1_i0_0_0_0 : MUX_GATE generic map(BITSIZE_in1=>8, BITSIZE_in2=>8, BITSIZE_out1=>8) port map (out1 => out_MUX_4_DPROXY_CTRLN_1_i0_0_0_0, sel => selector_MUX_4_DPROXY_CTRLN_1_i0_0_0_0, in1 => out_vb_assign_conn_obj_0_ASSIGN_VECTOR_BOOL_FU_vb_assign_2, in2 => out_vb_assign_conn_obj_3_ASSIGN_VECTOR_BOOL_FU_vb_assign_3);
  MUX_51_reg_9_0_0_0 : MUX_GATE generic map(BITSIZE_in1=>32, BITSIZE_in2=>32, BITSIZE_out1=>32) port map (out1 => out_MUX_51_reg_9_0_0_0, sel => selector_MUX_51_reg_9_0_0_0, in1 => out_reg_3_reg_3, in2 => out_reg_12_reg_12);
  MUX_51_reg_9_0_0_1 : MUX_GATE generic map(BITSIZE_in1=>32, BITSIZE_in2=>32, BITSIZE_out1=>32) port map (out1 => out_MUX_51_reg_9_0_0_1, sel => selector_MUX_51_reg_9_0_0_1, in1 => out_UUdata_converter_FU_7_i0_fu_make_oriented_28870_28927, in2 => out_MUX_51_reg_9_0_0_0);
  MUX_5_DPROXY_CTRLN_1_i0_1_0_0 : MUX_GATE generic map(BITSIZE_in1=>8, BITSIZE_in2=>8, BITSIZE_out1=>8) port map (out1 => out_MUX_5_DPROXY_CTRLN_1_i0_1_0_0, sel => selector_MUX_5_DPROXY_CTRLN_1_i0_1_0_0, in1 => out_conv_out_reg_0_reg_0_6_8, in2 => out_conv_out_addr_expr_FU_5_i0_fu_make_oriented_28870_29605_6_8);
  MUX_8_DPROXY_CTRLN_2_i0_0_0_0 : MUX_GATE generic map(BITSIZE_in1=>8, BITSIZE_in2=>8, BITSIZE_out1=>8) port map (out1 => out_MUX_8_DPROXY_CTRLN_2_i0_0_0_0, sel => selector_MUX_8_DPROXY_CTRLN_2_i0_0_0_0, in1 => std_logic_vector(out_iu_conv_conn_obj_1_IUdata_converter_FU_iu_conv_0), in2 => std_logic_vector(out_iu_conv_conn_obj_2_IUdata_converter_FU_iu_conv_1));
  MUX_9_DPROXY_CTRLN_2_i0_1_0_0 : MUX_GATE generic map(BITSIZE_in1=>8, BITSIZE_in2=>8, BITSIZE_out1=>8) port map (out1 => out_MUX_9_DPROXY_CTRLN_2_i0_1_0_0, sel => selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0, in1 => out_conv_out_reg_4_reg_4_7_8, in2 => out_conv_out_reg_17_reg_17_7_8);
  MUX_9_DPROXY_CTRLN_2_i0_1_0_1 : MUX_GATE generic map(BITSIZE_in1=>8, BITSIZE_in2=>8, BITSIZE_out1=>8) port map (out1 => out_MUX_9_DPROXY_CTRLN_2_i0_1_0_1, sel => selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_1, in1 => out_conv_out_reg_13_reg_13_7_8, in2 => out_conv_out_reg_11_reg_11_7_8);
  MUX_9_DPROXY_CTRLN_2_i0_1_0_2 : MUX_GATE generic map(BITSIZE_in1=>8, BITSIZE_in2=>8, BITSIZE_out1=>8) port map (out1 => out_MUX_9_DPROXY_CTRLN_2_i0_1_0_2, sel => selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_2, in1 => out_conv_out_UUdata_converter_FU_23_i0_fu_make_oriented_28870_28965_7_8, in2 => out_conv_out_ui_pointer_plus_expr_FU_8_8_8_52_i0_fu_make_oriented_28870_29622_7_8);
  MUX_9_DPROXY_CTRLN_2_i0_1_1_0 : MUX_GATE generic map(BITSIZE_in1=>8, BITSIZE_in2=>8, BITSIZE_out1=>8) port map (out1 => out_MUX_9_DPROXY_CTRLN_2_i0_1_1_0, sel => selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_0, in1 => out_MUX_9_DPROXY_CTRLN_2_i0_1_0_0, in2 => out_MUX_9_DPROXY_CTRLN_2_i0_1_0_1);
  MUX_9_DPROXY_CTRLN_2_i0_1_1_1 : MUX_GATE generic map(BITSIZE_in1=>8, BITSIZE_in2=>8, BITSIZE_out1=>8) port map (out1 => out_MUX_9_DPROXY_CTRLN_2_i0_1_1_1, sel => selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_1, in1 => out_MUX_9_DPROXY_CTRLN_2_i0_1_0_2, in2 => out_MUX_9_DPROXY_CTRLN_2_i0_1_1_0);
  array_28859_0 : ARRAY_1D_STD_DISTRAM_NN_SDS generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_in2=>8, PORTSIZE_in2=>2, BITSIZE_in3=>4, PORTSIZE_in3=>2, BITSIZE_in4=>1, PORTSIZE_in4=>2, BITSIZE_sel_LOAD=>1, PORTSIZE_sel_LOAD=>2, BITSIZE_sel_STORE=>1, PORTSIZE_sel_STORE=>2, BITSIZE_S_oe_ram=>1, PORTSIZE_S_oe_ram=>2, BITSIZE_S_we_ram=>1, PORTSIZE_S_we_ram=>2, BITSIZE_out1=>8, PORTSIZE_out1=>2, BITSIZE_S_addr_ram=>8, PORTSIZE_S_addr_ram=>2, BITSIZE_S_Wdata_ram=>8, PORTSIZE_S_Wdata_ram=>2, BITSIZE_Sin_Rdata_ram=>8, PORTSIZE_Sin_Rdata_ram=>2, BITSIZE_Sout_Rdata_ram=>8, PORTSIZE_Sout_Rdata_ram=>2, BITSIZE_S_data_ram_size=>4, PORTSIZE_S_data_ram_size=>2, BITSIZE_Sin_DataRdy=>1, PORTSIZE_Sin_DataRdy=>2, BITSIZE_Sout_DataRdy=>1, PORTSIZE_Sout_DataRdy=>2, MEMORY_INIT_file=>"array_ref_28859.mem", n_elements=>1, data_size=>8, address_space_begin=>MEM_var_28859_28870, address_space_rangesize=>32, BUS_PIPELINED=>1, BRAM_BITSIZE=>8, PRIVATE_MEMORY=>0, READ_ONLY_MEMORY=>0, USE_SPARSE_MEMORY=>1, BITSIZE_proxy_in1=>8, PORTSIZE_proxy_in1=>2, BITSIZE_proxy_in2=>8, PORTSIZE_proxy_in2=>2, BITSIZE_proxy_in3=>4, PORTSIZE_proxy_in3=>2, BITSIZE_proxy_sel_LOAD=>1, PORTSIZE_proxy_sel_LOAD=>2, BITSIZE_proxy_sel_STORE=>1, PORTSIZE_proxy_sel_STORE=>2, BITSIZE_proxy_out1=>8, PORTSIZE_proxy_out1=>2) port map (out1(15 downto 8) => null_out_signal_array_28859_0_out1_1, out1(7 downto 0) => null_out_signal_array_28859_0_out1_0, Sout_Rdata_ram => sig_in_vector_bus_mergerSout_Rdata_ram1_0, Sout_DataRdy => sig_in_vector_bus_mergerSout_DataRdy0_0, proxy_out1(15 downto 8) => null_out_signal_array_28859_0_proxy_out1_1, proxy_out1(7 downto 0) => null_out_signal_array_28859_0_proxy_out1_0, clock => clock, reset => reset, in1(15 downto 8) => "00000000", in1(7 downto 0) => out_vb_assign_conn_obj_3_ASSIGN_VECTOR_BOOL_FU_vb_assign_3, in2(15 downto 8) => "00000000", in2(7 downto 0) => out_conv_out_reg_2_reg_2_7_8, in3(7 downto 4) => "0000", in3(3 downto 0) => out_conv_out_const_3_5_4, in4(1 downto 1) => "0", in4(0 downto 0) => out_const_4, sel_LOAD(1 downto 1) => "0", sel_LOAD(0) => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD, sel_STORE(1 downto 1) => "0", sel_STORE(0) => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE, S_oe_ram => S_oe_ram, S_we_ram => S_we_ram, S_addr_ram => S_addr_ram, S_Wdata_ram => S_Wdata_ram, Sin_Rdata_ram => Sin_Rdata_ram, S_data_ram_size => S_data_ram_size, Sin_DataRdy => Sin_DataRdy, proxy_in1(15 downto 8) => "00000000", proxy_in1(7 downto 0) => "00000000", proxy_in2(15 downto 8) => "00000000", proxy_in2(7 downto 0) => "00000000", proxy_in3(7 downto 4) => "0000", proxy_in3(3 downto 0) => "0000", proxy_sel_LOAD(1 downto 1) => "0", proxy_sel_LOAD(0 downto 0) => "0", proxy_sel_STORE(1 downto 1) => "0", proxy_sel_STORE(0 downto 0) => "0");
  \bus_mergerSout_DataRdy0_\ : bus_merger generic map(BITSIZE_in1=>2, PORTSIZE_in1=>1, BITSIZE_out1=>2) port map (out1 => \sig_out_bus_mergerSout_DataRdy0_\, in1(1 downto 0) => sig_in_bus_mergerSout_DataRdy0_0);
  \bus_mergerSout_Rdata_ram1_\ : bus_merger generic map(BITSIZE_in1=>16, PORTSIZE_in1=>1, BITSIZE_out1=>16) port map (out1 => \sig_out_bus_mergerSout_Rdata_ram1_\, in1(15 downto 0) => sig_in_bus_mergerSout_Rdata_ram1_0);
  \bus_mergerproxy_in1_288612_\ : bus_merger generic map(BITSIZE_in1=>16, PORTSIZE_in1=>1, BITSIZE_out1=>16) port map (out1 => \sig_out_bus_mergerproxy_in1_288612_\, in1(15 downto 0) => sig_in_bus_mergerproxy_in1_288612_0);
  \bus_mergerproxy_in1_288683_\ : bus_merger generic map(BITSIZE_in1=>16, PORTSIZE_in1=>1, BITSIZE_out1=>16) port map (out1 => \sig_out_bus_mergerproxy_in1_288683_\, in1(15 downto 0) => sig_in_bus_mergerproxy_in1_288683_0);
  \bus_mergerproxy_in2_288614_\ : bus_merger generic map(BITSIZE_in1=>16, PORTSIZE_in1=>1, BITSIZE_out1=>16) port map (out1 => \sig_out_bus_mergerproxy_in2_288614_\, in1(15 downto 0) => sig_in_bus_mergerproxy_in2_288614_0);
  \bus_mergerproxy_in2_288685_\ : bus_merger generic map(BITSIZE_in1=>16, PORTSIZE_in1=>1, BITSIZE_out1=>16) port map (out1 => \sig_out_bus_mergerproxy_in2_288685_\, in1(15 downto 0) => sig_in_bus_mergerproxy_in2_288685_0);
  \bus_mergerproxy_in3_288616_\ : bus_merger generic map(BITSIZE_in1=>8, PORTSIZE_in1=>1, BITSIZE_out1=>8) port map (out1 => \sig_out_bus_mergerproxy_in3_288616_\, in1(7 downto 0) => sig_in_bus_mergerproxy_in3_288616_0);
  \bus_mergerproxy_in3_288687_\ : bus_merger generic map(BITSIZE_in1=>8, PORTSIZE_in1=>1, BITSIZE_out1=>8) port map (out1 => \sig_out_bus_mergerproxy_in3_288687_\, in1(7 downto 0) => sig_in_bus_mergerproxy_in3_288687_0);
  \bus_mergerproxy_sel_LOAD_288618_\ : bus_merger generic map(BITSIZE_in1=>2, PORTSIZE_in1=>1, BITSIZE_out1=>2) port map (out1 => \sig_out_bus_mergerproxy_sel_LOAD_288618_\, in1(1 downto 0) => sig_in_bus_mergerproxy_sel_LOAD_288618_0);
  \bus_mergerproxy_sel_LOAD_288689_\ : bus_merger generic map(BITSIZE_in1=>2, PORTSIZE_in1=>1, BITSIZE_out1=>2) port map (out1 => \sig_out_bus_mergerproxy_sel_LOAD_288689_\, in1(1 downto 0) => sig_in_bus_mergerproxy_sel_LOAD_288689_0);
  \bus_mergerproxy_sel_STORE_2886110_\ : bus_merger generic map(BITSIZE_in1=>2, PORTSIZE_in1=>1, BITSIZE_out1=>2) port map (out1 => \sig_out_bus_mergerproxy_sel_STORE_2886110_\, in1(1 downto 0) => sig_in_bus_mergerproxy_sel_STORE_2886110_0);
  \bus_mergerproxy_sel_STORE_2886811_\ : bus_merger generic map(BITSIZE_in1=>2, PORTSIZE_in1=>1, BITSIZE_out1=>2) port map (out1 => \sig_out_bus_mergerproxy_sel_STORE_2886811_\, in1(1 downto 0) => sig_in_bus_mergerproxy_sel_STORE_2886811_0);
  const_0 : constant_value generic map(BITSIZE_out1=>1, value=>"0") port map (out1 => out_const_0);
  const_1 : constant_value generic map(BITSIZE_out1=>8, value=>"00000000") port map (out1 => out_const_1);
  const_10 : constant_value generic map(BITSIZE_out1=>7, value=> std_logic_vector(to_unsigned(MEM_var_28859_28870, 7))) port map (out1 => out_const_10);
  const_2 : constant_value generic map(BITSIZE_out1=>8, value=>"00000010") port map (out1 => out_const_2);
  const_3 : constant_value generic map(BITSIZE_out1=>5, value=>"01000") port map (out1 => out_const_3);
  const_4 : constant_value generic map(BITSIZE_out1=>1, value=>"1") port map (out1 => out_const_4);
  const_5 : constant_value generic map(BITSIZE_out1=>2, value=>"10") port map (out1 => out_const_5);
  const_6 : constant_value generic map(BITSIZE_out1=>2, value=>"11") port map (out1 => out_const_6);
  const_7 : constant_value generic map(BITSIZE_out1=>8, value=>"11111111") port map (out1 => out_const_7);
  const_8 : constant_value generic map(BITSIZE_out1=>6, value=> std_logic_vector(to_unsigned(MEM_var_28861_28878, 6))) port map (out1 => out_const_8);
  const_9 : constant_value generic map(BITSIZE_out1=>8, value=> std_logic_vector(to_unsigned(MEM_var_28868_28878, 8))) port map (out1 => out_const_9);
  conv_out_UUdata_converter_FU_23_i0_fu_make_oriented_28870_28965_7_8 : UUdata_converter_FU generic map(BITSIZE_in1=>7, BITSIZE_out1=>8) port map (out1 => out_conv_out_UUdata_converter_FU_23_i0_fu_make_oriented_28870_28965_7_8, in1 => out_UUdata_converter_FU_23_i0_fu_make_oriented_28870_28965);
  conv_out_addr_expr_FU_5_i0_fu_make_oriented_28870_29605_6_8 : UUdata_converter_FU generic map(BITSIZE_in1=>6, BITSIZE_out1=>8) port map (out1 => out_conv_out_addr_expr_FU_5_i0_fu_make_oriented_28870_29605_6_8, in1 => out_addr_expr_FU_5_i0_fu_make_oriented_28870_29605);
  conv_out_const_10_7_32 : UUdata_converter_FU generic map(BITSIZE_in1=>7, BITSIZE_out1=>32) port map (out1 => out_conv_out_const_10_7_32, in1 => out_const_10);
  conv_out_const_3_5_4 : UUdata_converter_FU generic map(BITSIZE_in1=>5, BITSIZE_out1=>4) port map (out1 => out_conv_out_const_3_5_4, in1 => out_const_3);
  conv_out_const_8_6_32 : UUdata_converter_FU generic map(BITSIZE_in1=>6, BITSIZE_out1=>32) port map (out1 => out_conv_out_const_8_6_32, in1 => out_const_8);
  conv_out_const_9_8_32 : UUdata_converter_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>32) port map (out1 => out_conv_out_const_9_8_32, in1 => out_const_9);
  conv_out_reg_0_reg_0_6_8 : UUdata_converter_FU generic map(BITSIZE_in1=>6, BITSIZE_out1=>8) port map (out1 => out_conv_out_reg_0_reg_0_6_8, in1 => out_reg_0_reg_0);
  conv_out_reg_11_reg_11_7_8 : UUdata_converter_FU generic map(BITSIZE_in1=>7, BITSIZE_out1=>8) port map (out1 => out_conv_out_reg_11_reg_11_7_8, in1 => out_reg_11_reg_11);
  conv_out_reg_13_reg_13_7_8 : UUdata_converter_FU generic map(BITSIZE_in1=>7, BITSIZE_out1=>8) port map (out1 => out_conv_out_reg_13_reg_13_7_8, in1 => out_reg_13_reg_13);
  conv_out_reg_17_reg_17_7_8 : UUdata_converter_FU generic map(BITSIZE_in1=>7, BITSIZE_out1=>8) port map (out1 => out_conv_out_reg_17_reg_17_7_8, in1 => out_reg_17_reg_17);
  conv_out_reg_2_reg_2_7_8 : UUdata_converter_FU generic map(BITSIZE_in1=>7, BITSIZE_out1=>8) port map (out1 => out_conv_out_reg_2_reg_2_7_8, in1 => out_reg_2_reg_2);
  conv_out_reg_4_reg_4_7_8 : UUdata_converter_FU generic map(BITSIZE_in1=>7, BITSIZE_out1=>8) port map (out1 => out_conv_out_reg_4_reg_4_7_8, in1 => out_reg_4_reg_4);
  conv_out_ui_pointer_plus_expr_FU_8_8_8_52_i0_fu_make_oriented_28870_29622_7_8 : UUdata_converter_FU generic map(BITSIZE_in1=>7, BITSIZE_out1=>8) port map (out1 => out_conv_out_ui_pointer_plus_expr_FU_8_8_8_52_i0_fu_make_oriented_28870_29622_7_8, in1 => std_logic_vector(out_ui_pointer_plus_expr_FU_8_8_8_52_i0_fu_make_oriented_28870_29622));
  fu_make_oriented_28870_28927 : UUdata_converter_FU generic map(BITSIZE_in1=>32, BITSIZE_out1=>32) port map (out1 => out_UUdata_converter_FU_7_i0_fu_make_oriented_28870_28927, in1 => out_addr_expr_FU_6_i0_fu_make_oriented_28870_29608);
  fu_make_oriented_28870_28944 : ui_cond_expr_FU generic map(BITSIZE_in1=>1, BITSIZE_in2=>2, BITSIZE_in3=>1, BITSIZE_out1=>2) port map (out1 => out_ui_cond_expr_FU_8_8_8_8_45_i0_fu_make_oriented_28870_28944, in1(0) => out_ui_extract_bit_expr_FU_13_i0_fu_make_oriented_28870_29826, in2 => unsigned(out_const_6), in3 => unsigned(out_const_0));
  fu_make_oriented_28870_28965 : UUdata_converter_FU generic map(BITSIZE_in1=>32, BITSIZE_out1=>7) port map (out1 => out_UUdata_converter_FU_23_i0_fu_make_oriented_28870_28965, in1 => out_reg_9_reg_9);
  fu_make_oriented_28870_28973 : ui_plus_expr_FU generic map(BITSIZE_in1=>32, BITSIZE_in2=>1, BITSIZE_out1=>32) port map (out1 => out_ui_plus_expr_FU_32_0_32_50_i0_fu_make_oriented_28870_28973, in1 => unsigned(out_reg_9_reg_9), in2 => unsigned(out_const_4));
  fu_make_oriented_28870_28976 : UIdata_converter_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_UIdata_converter_FU_26_i0_fu_make_oriented_28870_28976, in1 => out_ui_negate_expr_FU_8_8_49_i0_fu_make_oriented_28870_28980);
  fu_make_oriented_28870_28980 : ui_negate_expr_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_ui_negate_expr_FU_8_8_49_i0_fu_make_oriented_28870_28980, in1 => out_IUdata_converter_FU_25_i0_fu_make_oriented_28870_28987);
  fu_make_oriented_28870_28987 : IUdata_converter_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_IUdata_converter_FU_25_i0_fu_make_oriented_28870_28987, in1 => signed(out_DPROXY_CTRLN_2_i0_DPROXY_CTRLN_2_i0));
  fu_make_oriented_28870_29006 : ui_bit_ior_concat_expr_FU generic map(BITSIZE_in1=>32, BITSIZE_in2=>1, BITSIZE_in3=>1, BITSIZE_out1=>32, OFFSET_PARAMETER=>1) port map (out1 => out_ui_bit_ior_concat_expr_FU_42_i0_fu_make_oriented_28870_29006, in1 => out_ui_lshift_expr_FU_32_0_32_46_i0_fu_make_oriented_28870_29794, in2 => out_ui_bit_and_expr_FU_1_0_1_39_i1_fu_make_oriented_28870_29797, in3 => unsigned(out_const_4));
  fu_make_oriented_28870_29023 : lt_expr_FU generic map(BITSIZE_in1=>8, BITSIZE_in2=>2, BITSIZE_out1=>1) port map (out1 => out_lt_expr_FU_8_0_8_35_i0_fu_make_oriented_28870_29023, in1 => signed(out_DPROXY_CTRLN_2_i0_DPROXY_CTRLN_2_i0), in2 => signed(out_const_6));
  fu_make_oriented_28870_29024 : ui_bit_and_expr_FU generic map(BITSIZE_in1=>1, BITSIZE_in2=>1, BITSIZE_out1=>1) port map (out1 => out_ui_bit_and_expr_FU_1_1_1_41_i0_fu_make_oriented_28870_29024, in1 => unsigned(out_lt_expr_FU_8_0_8_35_i0_fu_make_oriented_28870_29023), in2 => unsigned(out_truth_xor_expr_FU_1_1_1_38_i0_fu_make_oriented_28870_29758));
  fu_make_oriented_28870_29025 : read_cond_FU generic map(BITSIZE_in1=>1) port map (out1 => out_read_cond_FU_27_i0_fu_make_oriented_28870_29025, in1 => std_logic_vector(out_ui_bit_and_expr_FU_1_1_1_41_i0_fu_make_oriented_28870_29024));
  fu_make_oriented_28870_29042 : read_cond_FU generic map(BITSIZE_in1=>1) port map (out1 => out_read_cond_FU_29_i0_fu_make_oriented_28870_29042, in1 => out_ge_expr_FU_8_0_8_34_i0_fu_make_oriented_28870_29673);
  fu_make_oriented_28870_29605 : addr_expr_FU generic map(BITSIZE_in1=>32, BITSIZE_out1=>6) port map (out1 => out_addr_expr_FU_5_i0_fu_make_oriented_28870_29605, in1 => out_conv_out_const_8_6_32);
  fu_make_oriented_28870_29608 : addr_expr_FU generic map(BITSIZE_in1=>32, BITSIZE_out1=>32) port map (out1 => out_addr_expr_FU_6_i0_fu_make_oriented_28870_29608, in1 => out_conv_out_const_9_8_32);
  fu_make_oriented_28870_29622 : ui_pointer_plus_expr_FU generic map(BITSIZE_in1=>32, BITSIZE_in2=>2, BITSIZE_out1=>7, LSB_PARAMETER=>0) port map (out1 => out_ui_pointer_plus_expr_FU_8_8_8_52_i0_fu_make_oriented_28870_29622, in1 => unsigned(out_reg_1_reg_1), in2 => out_ui_cond_expr_FU_8_8_8_8_45_i0_fu_make_oriented_28870_28944);
  fu_make_oriented_28870_29629 : ui_bit_ior_concat_expr_FU generic map(BITSIZE_in1=>2, BITSIZE_in2=>1, BITSIZE_in3=>1, BITSIZE_out1=>2, OFFSET_PARAMETER=>1) port map (out1 => out_ui_bit_ior_concat_expr_FU_43_i0_fu_make_oriented_28870_29629, in1 => unsigned(out_const_5), in2 => out_ui_bit_and_expr_FU_1_0_1_39_i0_fu_make_oriented_28870_29744, in3 => unsigned(out_const_4));
  fu_make_oriented_28870_29635 : ui_pointer_plus_expr_FU generic map(BITSIZE_in1=>32, BITSIZE_in2=>2, BITSIZE_out1=>7, LSB_PARAMETER=>0) port map (out1 => out_ui_pointer_plus_expr_FU_8_8_8_52_i1_fu_make_oriented_28870_29635, in1 => unsigned(out_reg_1_reg_1), in2 => out_ui_bit_ior_concat_expr_FU_43_i0_fu_make_oriented_28870_29629);
  fu_make_oriented_28870_29657 : UUdata_converter_FU generic map(BITSIZE_in1=>1, BITSIZE_out1=>1) port map (out1 => out_UUdata_converter_FU_15_i0_fu_make_oriented_28870_29657, in1 => out_reg_10_reg_10);
  fu_make_oriented_28870_29660 : ui_bit_ior_concat_expr_FU generic map(BITSIZE_in1=>2, BITSIZE_in2=>1, BITSIZE_in3=>1, BITSIZE_out1=>2, OFFSET_PARAMETER=>1) port map (out1 => out_ui_bit_ior_concat_expr_FU_44_i0_fu_make_oriented_28870_29660, in1 => out_ui_lshift_expr_FU_8_0_8_47_i1_fu_make_oriented_28870_29781, in2 => unsigned(out_reg_6_reg_6), in3 => unsigned(out_const_4));
  fu_make_oriented_28870_29666 : ui_pointer_plus_expr_FU generic map(BITSIZE_in1=>32, BITSIZE_in2=>2, BITSIZE_out1=>7, LSB_PARAMETER=>0) port map (out1 => out_ui_pointer_plus_expr_FU_8_8_8_52_i2_fu_make_oriented_28870_29666, in1 => unsigned(out_reg_1_reg_1), in2 => out_ui_bit_ior_concat_expr_FU_44_i0_fu_make_oriented_28870_29660);
  fu_make_oriented_28870_29673 : ge_expr_FU generic map(BITSIZE_in1=>8, BITSIZE_in2=>1, BITSIZE_out1=>1) port map (out1 => out_ge_expr_FU_8_0_8_34_i0_fu_make_oriented_28870_29673, in1 => signed(out_DPROXY_CTRLN_2_i0_DPROXY_CTRLN_2_i0), in2 => signed(out_const_0));
  fu_make_oriented_28870_29676 : ui_lshift_expr_FU generic map(BITSIZE_in1=>1, BITSIZE_in2=>1, BITSIZE_out1=>2, PRECISION=>32) port map (out1 => out_ui_lshift_expr_FU_8_0_8_47_i0_fu_make_oriented_28870_29676, in1 => unsigned(out_reg_10_reg_10), in2 => out_const_4);
  fu_make_oriented_28870_29679 : UUdata_converter_FU generic map(BITSIZE_in1=>1, BITSIZE_out1=>1) port map (out1 => out_UUdata_converter_FU_14_i0_fu_make_oriented_28870_29679, in1 => out_reg_10_reg_10);
  fu_make_oriented_28870_29682 : ui_bit_ior_concat_expr_FU generic map(BITSIZE_in1=>2, BITSIZE_in2=>1, BITSIZE_in3=>1, BITSIZE_out1=>2, OFFSET_PARAMETER=>1) port map (out1 => out_ui_bit_ior_concat_expr_FU_44_i1_fu_make_oriented_28870_29682, in1 => out_ui_lshift_expr_FU_8_0_8_47_i1_fu_make_oriented_28870_29781, in2 => unsigned(out_reg_7_reg_7), in3 => unsigned(out_const_4));
  fu_make_oriented_28870_29688 : ui_pointer_plus_expr_FU generic map(BITSIZE_in1=>32, BITSIZE_in2=>2, BITSIZE_out1=>7, LSB_PARAMETER=>0) port map (out1 => out_ui_pointer_plus_expr_FU_8_8_8_52_i3_fu_make_oriented_28870_29688, in1 => unsigned(out_reg_1_reg_1), in2 => out_ui_bit_ior_concat_expr_FU_44_i1_fu_make_oriented_28870_29682);
  fu_make_oriented_28870_29697 : addr_expr_FU generic map(BITSIZE_in1=>32, BITSIZE_out1=>7) port map (out1 => out_addr_expr_FU_8_i0_fu_make_oriented_28870_29697, in1 => out_conv_out_const_10_7_32);
  fu_make_oriented_28870_29744 : ui_bit_and_expr_FU generic map(BITSIZE_in1=>1, BITSIZE_in2=>1, BITSIZE_out1=>1) port map (out1 => out_ui_bit_and_expr_FU_1_0_1_39_i0_fu_make_oriented_28870_29744, in1 => unsigned(out_reg_10_reg_10), in2 => unsigned(out_const_4));
  fu_make_oriented_28870_29758 : truth_xor_expr_FU generic map(BITSIZE_in1=>1, BITSIZE_in2=>1, BITSIZE_out1=>1) port map (out1 => out_truth_xor_expr_FU_1_1_1_38_i0_fu_make_oriented_28870_29758, in1 => out_reg_8_reg_8, in2(0) => out_ui_extract_bit_expr_FU_24_i0_fu_make_oriented_28870_29822);
  fu_make_oriented_28870_29772 : ui_bit_and_expr_FU generic map(BITSIZE_in1=>1, BITSIZE_in2=>1, BITSIZE_out1=>1) port map (out1 => out_ui_bit_and_expr_FU_1_0_1_40_i0_fu_make_oriented_28870_29772, in1 => unsigned(out_UUdata_converter_FU_15_i0_fu_make_oriented_28870_29657), in2 => unsigned(out_const_4));
  fu_make_oriented_28870_29776 : ui_rshift_expr_FU generic map(BITSIZE_in1=>2, BITSIZE_in2=>1, BITSIZE_out1=>1, PRECISION=>32) port map (out1 => out_ui_rshift_expr_FU_8_0_8_54_i0_fu_make_oriented_28870_29776, in1 => out_ui_lshift_expr_FU_8_0_8_47_i0_fu_make_oriented_28870_29676, in2 => out_const_4);
  fu_make_oriented_28870_29781 : ui_lshift_expr_FU generic map(BITSIZE_in1=>1, BITSIZE_in2=>1, BITSIZE_out1=>2, PRECISION=>32) port map (out1 => out_ui_lshift_expr_FU_8_0_8_47_i1_fu_make_oriented_28870_29781, in1 => out_ui_rshift_expr_FU_8_0_8_54_i0_fu_make_oriented_28870_29776, in2 => out_const_4);
  fu_make_oriented_28870_29784 : ui_bit_and_expr_FU generic map(BITSIZE_in1=>1, BITSIZE_in2=>1, BITSIZE_out1=>1) port map (out1 => out_ui_bit_and_expr_FU_1_0_1_40_i1_fu_make_oriented_28870_29784, in1 => unsigned(out_UUdata_converter_FU_14_i0_fu_make_oriented_28870_29679), in2 => unsigned(out_const_4));
  fu_make_oriented_28870_29788 : ui_rshift_expr_FU generic map(BITSIZE_in1=>32, BITSIZE_in2=>1, BITSIZE_out1=>31, PRECISION=>32) port map (out1 => out_ui_rshift_expr_FU_32_0_32_53_i0_fu_make_oriented_28870_29788, in1 => unsigned(out_reg_9_reg_9), in2 => out_const_4);
  fu_make_oriented_28870_29791 : ui_plus_expr_FU generic map(BITSIZE_in1=>31, BITSIZE_in2=>1, BITSIZE_out1=>31) port map (out1 => out_ui_plus_expr_FU_32_0_32_51_i0_fu_make_oriented_28870_29791, in1 => out_ui_rshift_expr_FU_32_0_32_53_i0_fu_make_oriented_28870_29788, in2 => unsigned(out_const_4));
  fu_make_oriented_28870_29794 : ui_lshift_expr_FU generic map(BITSIZE_in1=>31, BITSIZE_in2=>1, BITSIZE_out1=>32, PRECISION=>32) port map (out1 => out_ui_lshift_expr_FU_32_0_32_46_i0_fu_make_oriented_28870_29794, in1 => out_ui_plus_expr_FU_32_0_32_51_i0_fu_make_oriented_28870_29791, in2 => out_const_4);
  fu_make_oriented_28870_29797 : ui_bit_and_expr_FU generic map(BITSIZE_in1=>32, BITSIZE_in2=>1, BITSIZE_out1=>1) port map (out1 => out_ui_bit_and_expr_FU_1_0_1_39_i1_fu_make_oriented_28870_29797, in1 => unsigned(out_reg_9_reg_9), in2 => unsigned(out_const_4));
  fu_make_oriented_28870_29822 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>1, BITSIZE_in2=>1) port map (out1 => out_ui_extract_bit_expr_FU_24_i0_fu_make_oriented_28870_29822, in1 => unsigned(out_reg_10_reg_10), in2 => out_const_0);
  fu_make_oriented_28870_29826 : ui_extract_bit_expr_FU generic map(BITSIZE_in1=>1, BITSIZE_in2=>1) port map (out1 => out_ui_extract_bit_expr_FU_13_i0_fu_make_oriented_28870_29826, in1 => unsigned(out_reg_10_reg_10), in2 => out_const_0);
  fu_make_oriented_28870_29832 : multi_read_cond_FU generic map(BITSIZE_in1=>1, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => out_multi_read_cond_FU_32_i0_fu_make_oriented_28870_29832, in1(1 downto 1) => out_reg_15_reg_15, in1(0 downto 0) => out_reg_14_reg_14);
  fu_make_oriented_28870_29835 : truth_not_expr_FU generic map(BITSIZE_in1=>1, BITSIZE_out1=>1) port map (out1 => out_truth_not_expr_FU_1_1_37_i0_fu_make_oriented_28870_29835, in1 => out_ui_ne_expr_FU_1_0_1_48_i0_ui_ne_expr_FU_1_0_1_48_i0);
  fu_make_oriented_28870_29838 : truth_and_expr_FU generic map(BITSIZE_in1=>1, BITSIZE_in2=>1, BITSIZE_out1=>1) port map (out1 => out_truth_and_expr_FU_1_1_1_36_i0_fu_make_oriented_28870_29838, in1 => out_reg_5_reg_5, in2 => out_truth_not_expr_FU_1_1_37_i0_fu_make_oriented_28870_29835);
  join_signalbus_mergerSout_DataRdy0_0 : join_signal generic map(BITSIZE_in1=>1, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => sig_in_bus_mergerSout_DataRdy0_0, in1 => sig_in_vector_bus_mergerSout_DataRdy0_0);
  join_signalbus_mergerSout_Rdata_ram1_0 : join_signal generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => sig_in_bus_mergerSout_Rdata_ram1_0, in1 => sig_in_vector_bus_mergerSout_Rdata_ram1_0);
  join_signalbus_mergerproxy_in1_288612_0 : join_signal generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => sig_in_bus_mergerproxy_in1_288612_0, in1 => sig_in_vector_bus_mergerproxy_in1_288612_0);
  join_signalbus_mergerproxy_in1_288683_0 : join_signal generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => sig_in_bus_mergerproxy_in1_288683_0, in1 => sig_in_vector_bus_mergerproxy_in1_288683_0);
  join_signalbus_mergerproxy_in2_288614_0 : join_signal generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => sig_in_bus_mergerproxy_in2_288614_0, in1 => sig_in_vector_bus_mergerproxy_in2_288614_0);
  join_signalbus_mergerproxy_in2_288685_0 : join_signal generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => sig_in_bus_mergerproxy_in2_288685_0, in1 => sig_in_vector_bus_mergerproxy_in2_288685_0);
  join_signalbus_mergerproxy_in3_288616_0 : join_signal generic map(BITSIZE_in1=>4, PORTSIZE_in1=>2, BITSIZE_out1=>8) port map (out1 => sig_in_bus_mergerproxy_in3_288616_0, in1 => sig_in_vector_bus_mergerproxy_in3_288616_0);
  join_signalbus_mergerproxy_in3_288687_0 : join_signal generic map(BITSIZE_in1=>4, PORTSIZE_in1=>2, BITSIZE_out1=>8) port map (out1 => sig_in_bus_mergerproxy_in3_288687_0, in1 => sig_in_vector_bus_mergerproxy_in3_288687_0);
  join_signalbus_mergerproxy_sel_LOAD_288618_0 : join_signal generic map(BITSIZE_in1=>1, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => sig_in_bus_mergerproxy_sel_LOAD_288618_0, in1 => sig_in_vector_bus_mergerproxy_sel_LOAD_288618_0);
  join_signalbus_mergerproxy_sel_LOAD_288689_0 : join_signal generic map(BITSIZE_in1=>1, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => sig_in_bus_mergerproxy_sel_LOAD_288689_0, in1 => sig_in_vector_bus_mergerproxy_sel_LOAD_288689_0);
  join_signalbus_mergerproxy_sel_STORE_2886110_0 : join_signal generic map(BITSIZE_in1=>1, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => sig_in_bus_mergerproxy_sel_STORE_2886110_0, in1 => sig_in_vector_bus_mergerproxy_sel_STORE_2886110_0);
  join_signalbus_mergerproxy_sel_STORE_2886811_0 : join_signal generic map(BITSIZE_in1=>1, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => sig_in_bus_mergerproxy_sel_STORE_2886811_0, in1 => sig_in_vector_bus_mergerproxy_sel_STORE_2886811_0);
  reg_0 : register_SE generic map(BITSIZE_in1=>6, BITSIZE_out1=>6) port map (out1 => out_reg_0_reg_0, clock => clock, reset => reset, in1 => out_addr_expr_FU_5_i0_fu_make_oriented_28870_29605, wenable => wrenable_reg_0);
  reg_1 : register_SE generic map(BITSIZE_in1=>32, BITSIZE_out1=>32) port map (out1 => out_reg_1_reg_1, clock => clock, reset => reset, in1 => out_addr_expr_FU_6_i0_fu_make_oriented_28870_29608, wenable => wrenable_reg_1);
  reg_10 : register_SE generic map(BITSIZE_in1=>1, BITSIZE_out1=>1) port map (out1 => out_reg_10_reg_10, clock => clock, reset => reset, in1 => out_MUX_36_reg_10_0_0_0, wenable => wrenable_reg_10);
  reg_11 : register_SE generic map(BITSIZE_in1=>7, BITSIZE_out1=>7) port map (out1 => out_reg_11_reg_11, clock => clock, reset => reset, in1 => out_UUdata_converter_FU_23_i0_fu_make_oriented_28870_28965, wenable => wrenable_reg_11);
  reg_12 : register_SE generic map(BITSIZE_in1=>32, BITSIZE_out1=>32) port map (out1 => out_reg_12_reg_12, clock => clock, reset => reset, in1 => std_logic_vector(out_ui_plus_expr_FU_32_0_32_50_i0_fu_make_oriented_28870_28973), wenable => wrenable_reg_12);
  reg_13 : register_STD generic map(BITSIZE_in1=>7, BITSIZE_out1=>7) port map (out1 => out_reg_13_reg_13, clock => clock, reset => reset, in1 => std_logic_vector(out_ui_pointer_plus_expr_FU_8_8_8_52_i3_fu_make_oriented_28870_29688), wenable => wrenable_reg_13);
  reg_14 : register_SE generic map(BITSIZE_in1=>1, BITSIZE_out1=>1) port map (out1 => out_reg_14_reg_14, clock => clock, reset => reset, in1 => out_ui_ne_expr_FU_1_0_1_48_i0_ui_ne_expr_FU_1_0_1_48_i0, wenable => wrenable_reg_14);
  reg_15 : register_SE generic map(BITSIZE_in1=>1, BITSIZE_out1=>1) port map (out1 => out_reg_15_reg_15, clock => clock, reset => reset, in1 => out_truth_and_expr_FU_1_1_1_36_i0_fu_make_oriented_28870_29838, wenable => wrenable_reg_15);
  reg_16 : register_STD generic map(BITSIZE_in1=>8, BITSIZE_out1=>8) port map (out1 => out_reg_16_reg_16, clock => clock, reset => reset, in1 => std_logic_vector(out_UIdata_converter_FU_26_i0_fu_make_oriented_28870_28976), wenable => wrenable_reg_16);
  reg_17 : register_SE generic map(BITSIZE_in1=>7, BITSIZE_out1=>7) port map (out1 => out_reg_17_reg_17, clock => clock, reset => reset, in1 => std_logic_vector(out_ui_pointer_plus_expr_FU_8_8_8_52_i2_fu_make_oriented_28870_29666), wenable => wrenable_reg_17);
  reg_2 : register_SE generic map(BITSIZE_in1=>7, BITSIZE_out1=>7) port map (out1 => out_reg_2_reg_2, clock => clock, reset => reset, in1 => out_addr_expr_FU_8_i0_fu_make_oriented_28870_29697, wenable => wrenable_reg_2);
  reg_3 : register_SE generic map(BITSIZE_in1=>32, BITSIZE_out1=>32) port map (out1 => out_reg_3_reg_3, clock => clock, reset => reset, in1 => std_logic_vector(out_ui_bit_ior_concat_expr_FU_42_i0_fu_make_oriented_28870_29006), wenable => wrenable_reg_3);
  reg_4 : register_STD generic map(BITSIZE_in1=>7, BITSIZE_out1=>7) port map (out1 => out_reg_4_reg_4, clock => clock, reset => reset, in1 => std_logic_vector(out_ui_pointer_plus_expr_FU_8_8_8_52_i1_fu_make_oriented_28870_29635), wenable => wrenable_reg_4);
  reg_5 : register_SE generic map(BITSIZE_in1=>1, BITSIZE_out1=>1) port map (out1 => out_reg_5_reg_5, clock => clock, reset => reset, in1 => out_ui_ne_expr_FU_1_0_1_48_i0_ui_ne_expr_FU_1_0_1_48_i0, wenable => wrenable_reg_5);
  reg_6 : register_SE generic map(BITSIZE_in1=>1, BITSIZE_out1=>1) port map (out1 => out_reg_6_reg_6, clock => clock, reset => reset, in1 => std_logic_vector(out_ui_bit_and_expr_FU_1_0_1_40_i0_fu_make_oriented_28870_29772), wenable => wrenable_reg_6);
  reg_7 : register_SE generic map(BITSIZE_in1=>1, BITSIZE_out1=>1) port map (out1 => out_reg_7_reg_7, clock => clock, reset => reset, in1 => std_logic_vector(out_ui_bit_and_expr_FU_1_0_1_40_i1_fu_make_oriented_28870_29784), wenable => wrenable_reg_7);
  reg_8 : register_SE generic map(BITSIZE_in1=>1, BITSIZE_out1=>1) port map (out1 => out_reg_8_reg_8, clock => clock, reset => reset, in1(0) => out_ui_extract_bit_expr_FU_13_i0_fu_make_oriented_28870_29826, wenable => wrenable_reg_8);
  reg_9 : register_SE generic map(BITSIZE_in1=>32, BITSIZE_out1=>32) port map (out1 => out_reg_9_reg_9, clock => clock, reset => reset, in1 => out_MUX_51_reg_9_0_0_1, wenable => wrenable_reg_9);
  \split_signalbus_mergerSout_DataRdy0_\ : split_signal generic map(BITSIZE_in1=>2, BITSIZE_out1=>1, PORTSIZE_out1=>2) port map (out1 => Sout_DataRdy, in1 => \sig_out_bus_mergerSout_DataRdy0_\);
  \split_signalbus_mergerSout_Rdata_ram1_\ : split_signal generic map(BITSIZE_in1=>16, BITSIZE_out1=>8, PORTSIZE_out1=>2) port map (out1 => Sout_Rdata_ram, in1 => \sig_out_bus_mergerSout_Rdata_ram1_\);
  \split_signalbus_mergerproxy_in1_288612_\ : split_signal generic map(BITSIZE_in1=>16, BITSIZE_out1=>8, PORTSIZE_out1=>2) port map (out1 => proxy_in1_28861, in1 => \sig_out_bus_mergerproxy_in1_288612_\);
  \split_signalbus_mergerproxy_in1_288683_\ : split_signal generic map(BITSIZE_in1=>16, BITSIZE_out1=>8, PORTSIZE_out1=>2) port map (out1 => proxy_in1_28868, in1 => \sig_out_bus_mergerproxy_in1_288683_\);
  \split_signalbus_mergerproxy_in2_288614_\ : split_signal generic map(BITSIZE_in1=>16, BITSIZE_out1=>8, PORTSIZE_out1=>2) port map (out1 => proxy_in2_28861, in1 => \sig_out_bus_mergerproxy_in2_288614_\);
  \split_signalbus_mergerproxy_in2_288685_\ : split_signal generic map(BITSIZE_in1=>16, BITSIZE_out1=>8, PORTSIZE_out1=>2) port map (out1 => proxy_in2_28868, in1 => \sig_out_bus_mergerproxy_in2_288685_\);
  \split_signalbus_mergerproxy_in3_288616_\ : split_signal generic map(BITSIZE_in1=>8, BITSIZE_out1=>4, PORTSIZE_out1=>2) port map (out1 => proxy_in3_28861, in1 => \sig_out_bus_mergerproxy_in3_288616_\);
  \split_signalbus_mergerproxy_in3_288687_\ : split_signal generic map(BITSIZE_in1=>8, BITSIZE_out1=>4, PORTSIZE_out1=>2) port map (out1 => proxy_in3_28868, in1 => \sig_out_bus_mergerproxy_in3_288687_\);
  \split_signalbus_mergerproxy_sel_LOAD_288618_\ : split_signal generic map(BITSIZE_in1=>2, BITSIZE_out1=>1, PORTSIZE_out1=>2) port map (out1 => proxy_sel_LOAD_28861, in1 => \sig_out_bus_mergerproxy_sel_LOAD_288618_\);
  \split_signalbus_mergerproxy_sel_LOAD_288689_\ : split_signal generic map(BITSIZE_in1=>2, BITSIZE_out1=>1, PORTSIZE_out1=>2) port map (out1 => proxy_sel_LOAD_28868, in1 => \sig_out_bus_mergerproxy_sel_LOAD_288689_\);
  \split_signalbus_mergerproxy_sel_STORE_2886110_\ : split_signal generic map(BITSIZE_in1=>2, BITSIZE_out1=>1, PORTSIZE_out1=>2) port map (out1 => proxy_sel_STORE_28861, in1 => \sig_out_bus_mergerproxy_sel_STORE_2886110_\);
  \split_signalbus_mergerproxy_sel_STORE_2886811_\ : split_signal generic map(BITSIZE_in1=>2, BITSIZE_out1=>1, PORTSIZE_out1=>2) port map (out1 => proxy_sel_STORE_28868, in1 => \sig_out_bus_mergerproxy_sel_STORE_2886811_\);
  ui_ne_expr_FU_1_0_1_48_i0 : ui_ne_expr_FU generic map(BITSIZE_in1=>1, BITSIZE_in2=>1, BITSIZE_out1=>1) port map (out1 => out_ui_ne_expr_FU_1_0_1_48_i0_ui_ne_expr_FU_1_0_1_48_i0, in1 => unsigned(out_reg_10_reg_10), in2 => unsigned(out_const_4));
  -- io-signal post fix
  OUT_CONDITION_make_oriented_28870_29025 <= out_read_cond_FU_27_i0_fu_make_oriented_28870_29025;
  OUT_CONDITION_make_oriented_28870_29042 <= out_read_cond_FU_29_i0_fu_make_oriented_28870_29042;
  OUT_MULTIIF_make_oriented_28870_29832 <= out_multi_read_cond_FU_32_i0_fu_make_oriented_28870_29832;

end datapath_make_oriented_arch;

-- FSM based controller description for make_oriented
-- This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
-- Author(s): Component automatically generated by bambu
-- License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity controller_make_oriented is 
port (
  -- IN
  OUT_CONDITION_make_oriented_28870_29025 : in std_logic;
  OUT_CONDITION_make_oriented_28870_29042 : in std_logic;
  OUT_MULTIIF_make_oriented_28870_29832 : in std_logic_vector(1 downto 0) ;
  clock : in std_logic;
  reset : in std_logic;
  start_port : in std_logic;
  -- OUT
  done_port : out std_logic;
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD : out std_logic;
  fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE : out std_logic;
  fuselector_DPROXY_CTRLN_1_i0_LOAD : out std_logic;
  fuselector_DPROXY_CTRLN_1_i0_STORE : out std_logic;
  fuselector_DPROXY_CTRLN_2_i0_LOAD : out std_logic;
  fuselector_DPROXY_CTRLN_2_i0_STORE : out std_logic;
  selector_MUX_36_reg_10_0_0_0 : out std_logic;
  selector_MUX_4_DPROXY_CTRLN_1_i0_0_0_0 : out std_logic;
  selector_MUX_51_reg_9_0_0_0 : out std_logic;
  selector_MUX_51_reg_9_0_0_1 : out std_logic;
  selector_MUX_5_DPROXY_CTRLN_1_i0_1_0_0 : out std_logic;
  selector_MUX_8_DPROXY_CTRLN_2_i0_0_0_0 : out std_logic;
  selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0 : out std_logic;
  selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_1 : out std_logic;
  selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_2 : out std_logic;
  selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_0 : out std_logic;
  selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_1 : out std_logic;
  wrenable_reg_0 : out std_logic;
  wrenable_reg_1 : out std_logic;
  wrenable_reg_10 : out std_logic;
  wrenable_reg_11 : out std_logic;
  wrenable_reg_12 : out std_logic;
  wrenable_reg_13 : out std_logic;
  wrenable_reg_14 : out std_logic;
  wrenable_reg_15 : out std_logic;
  wrenable_reg_16 : out std_logic;
  wrenable_reg_17 : out std_logic;
  wrenable_reg_2 : out std_logic;
  wrenable_reg_3 : out std_logic;
  wrenable_reg_4 : out std_logic;
  wrenable_reg_5 : out std_logic;
  wrenable_reg_6 : out std_logic;
  wrenable_reg_7 : out std_logic;
  wrenable_reg_8 : out std_logic;
  wrenable_reg_9 : out std_logic

);
end controller_make_oriented;

architecture controller_make_oriented_arch of controller_make_oriented is
  -- define the states of FSM model
  constant S_0: std_logic_vector(9 downto 0) := "0000000001";
  constant S_1: std_logic_vector(9 downto 0) := "0000000010";
  constant S_2: std_logic_vector(9 downto 0) := "0000000100";
  constant S_3: std_logic_vector(9 downto 0) := "0000001000";
  constant S_6: std_logic_vector(9 downto 0) := "0001000000";
  constant S_7: std_logic_vector(9 downto 0) := "0010000000";
  constant S_4: std_logic_vector(9 downto 0) := "0000010000";
  constant S_5: std_logic_vector(9 downto 0) := "0000100000";
  constant S_8: std_logic_vector(9 downto 0) := "0100000000";
  constant S_9: std_logic_vector(9 downto 0) := "1000000000";
  signal present_state, next_state : std_logic_vector(9 downto 0);
begin
  -- concurrent process#1: state registers
  state_reg: process(clock)
  begin
    if (clock'event and clock='1') then
      if (reset='0') then
        present_state <= S_0;
      else
        present_state <= next_state;
      end if;
    end if;
  end process;
  -- concurrent process#0: combinational logic
  comb_logic0: process(present_state, OUT_CONDITION_make_oriented_28870_29025, OUT_CONDITION_make_oriented_28870_29042, OUT_MULTIIF_make_oriented_28870_29832, start_port)
  begin
    done_port <= '0';
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD <= '0';
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE <= '0';
    fuselector_DPROXY_CTRLN_1_i0_LOAD <= '0';
    fuselector_DPROXY_CTRLN_1_i0_STORE <= '0';
    fuselector_DPROXY_CTRLN_2_i0_LOAD <= '0';
    fuselector_DPROXY_CTRLN_2_i0_STORE <= '0';
    selector_MUX_36_reg_10_0_0_0 <= '0';
    selector_MUX_4_DPROXY_CTRLN_1_i0_0_0_0 <= '0';
    selector_MUX_51_reg_9_0_0_0 <= '0';
    selector_MUX_51_reg_9_0_0_1 <= '0';
    selector_MUX_5_DPROXY_CTRLN_1_i0_1_0_0 <= '0';
    selector_MUX_8_DPROXY_CTRLN_2_i0_0_0_0 <= '0';
    selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0 <= '0';
    selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_1 <= '0';
    selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_2 <= '0';
    selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_0 <= '0';
    selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_1 <= '0';
    wrenable_reg_0 <= '0';
    wrenable_reg_1 <= '0';
    wrenable_reg_10 <= '0';
    wrenable_reg_11 <= '0';
    wrenable_reg_12 <= '0';
    wrenable_reg_13 <= '0';
    wrenable_reg_14 <= '0';
    wrenable_reg_15 <= '0';
    wrenable_reg_16 <= '0';
    wrenable_reg_17 <= '0';
    wrenable_reg_2 <= '0';
    wrenable_reg_3 <= '0';
    wrenable_reg_4 <= '0';
    wrenable_reg_5 <= '0';
    wrenable_reg_6 <= '0';
    wrenable_reg_7 <= '0';
    wrenable_reg_8 <= '0';
    wrenable_reg_9 <= '0';
    next_state <= S_0;
    case present_state is
      when S_0 =>
        if(start_port /= '1') then
          selector_MUX_36_reg_10_0_0_0 <= 'X';
          selector_MUX_4_DPROXY_CTRLN_1_i0_0_0_0 <= 'X';
          selector_MUX_51_reg_9_0_0_0 <= 'X';
          selector_MUX_51_reg_9_0_0_1 <= 'X';
          selector_MUX_5_DPROXY_CTRLN_1_i0_1_0_0 <= 'X';
          selector_MUX_8_DPROXY_CTRLN_2_i0_0_0_0 <= 'X';
          selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0 <= 'X';
          selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_1 <= 'X';
          selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_2 <= 'X';
          selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_0 <= 'X';
          selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_1 <= 'X';
          wrenable_reg_0 <= 'X';
          wrenable_reg_1 <= 'X';
          wrenable_reg_10 <= 'X';
          wrenable_reg_11 <= 'X';
          wrenable_reg_12 <= 'X';
          wrenable_reg_13 <= 'X';
          wrenable_reg_14 <= 'X';
          wrenable_reg_15 <= 'X';
          wrenable_reg_16 <= 'X';
          wrenable_reg_17 <= 'X';
          wrenable_reg_2 <= 'X';
          wrenable_reg_3 <= 'X';
          wrenable_reg_4 <= 'X';
          wrenable_reg_5 <= 'X';
          wrenable_reg_6 <= 'X';
          wrenable_reg_7 <= 'X';
          wrenable_reg_8 <= 'X';
          wrenable_reg_9 <= 'X';
          next_state <= S_0;
        else
          fuselector_DPROXY_CTRLN_1_i0_STORE <= '1';
          selector_MUX_36_reg_10_0_0_0 <= '1';
          selector_MUX_4_DPROXY_CTRLN_1_i0_0_0_0 <= '1';
          selector_MUX_51_reg_9_0_0_1 <= '1';
          wrenable_reg_0 <= '1';
          wrenable_reg_1 <= '1';
          wrenable_reg_10 <= '1';
          wrenable_reg_2 <= '1';
          wrenable_reg_9 <= '1';
          next_state <= S_1;
        end if;
      when S_1 =>
        fuselector_DPROXY_CTRLN_2_i0_STORE <= '1';
        selector_MUX_8_DPROXY_CTRLN_2_i0_0_0_0 <= '1';
        selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_1 <= '1';
        wrenable_reg_3 <= '1';
        wrenable_reg_4 <= '1';
        wrenable_reg_5 <= '1';
        wrenable_reg_6 <= '1';
        wrenable_reg_7 <= '1';
        wrenable_reg_8 <= '1';
        next_state <= S_2;
      when S_2 =>
        fuselector_DPROXY_CTRLN_2_i0_STORE <= '1';
        selector_MUX_36_reg_10_0_0_0 <= '1';
        selector_MUX_8_DPROXY_CTRLN_2_i0_0_0_0 <= '1';
        selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0 <= '1';
        selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_0 <= '1';
        wrenable_reg_10 <= '1';
        next_state <= S_3;
      when S_3 =>
        fuselector_DPROXY_CTRLN_2_i0_LOAD <= '1';
        selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_2 <= '1';
        selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_1 <= '1';
        wrenable_reg_11 <= '1';
        wrenable_reg_12 <= '1';
        wrenable_reg_13 <= '1';
        wrenable_reg_14 <= '1';
        wrenable_reg_15 <= '1';
        wrenable_reg_16 <= '1';
        wrenable_reg_17 <= '1';
        if (OUT_CONDITION_make_oriented_28870_29025 = '1') then
          next_state <= S_4;
          wrenable_reg_13 <= '0';
        else
          next_state <= S_6;
          wrenable_reg_16 <= '0';
          wrenable_reg_17 <= '0';
        end if;
      when S_6 =>
        fuselector_DPROXY_CTRLN_2_i0_LOAD <= '1';
        selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_1 <= '1';
        if (OUT_CONDITION_make_oriented_28870_29042 = '1') then
          next_state <= S_7;
        else
          next_state <= S_8;
        end if;
      when S_7 =>
        fuselector_DPROXY_CTRLN_2_i0_STORE <= '1';
        selector_MUX_8_DPROXY_CTRLN_2_i0_0_0_0 <= '1';
        next_state <= S_8;
      when S_4 =>
        fuselector_DPROXY_CTRLN_2_i0_STORE <= '1';
        next_state <= S_5;
      when S_5 =>
        fuselector_DPROXY_CTRLN_2_i0_STORE <= '1';
        selector_MUX_8_DPROXY_CTRLN_2_i0_0_0_0 <= '1';
        selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_0 <= '1';
        next_state <= S_8;
      when S_8 =>
        selector_MUX_51_reg_9_0_0_0 <= '1';
        wrenable_reg_10 <= '1';
        wrenable_reg_9 <= '1';
        if (OUT_MULTIIF_make_oriented_28870_29832(0) = '1') then
          next_state <= S_3;
          selector_MUX_51_reg_9_0_0_0 <= '0';
        elsif (OUT_MULTIIF_make_oriented_28870_29832(1) = '1') then
          next_state <= S_1;
          wrenable_reg_10 <= '0';
        else
          next_state <= S_9;
          done_port <= '1';
          selector_MUX_51_reg_9_0_0_0 <= '0';
          wrenable_reg_10 <= '0';
          wrenable_reg_9 <= '0';
        end if;
      when S_9 =>
        fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE <= '1';
        fuselector_DPROXY_CTRLN_1_i0_STORE <= '1';
        selector_MUX_5_DPROXY_CTRLN_1_i0_1_0_0 <= '1';
        next_state <= S_0;
      when others =>
        selector_MUX_36_reg_10_0_0_0 <= 'X';
        selector_MUX_4_DPROXY_CTRLN_1_i0_0_0_0 <= 'X';
        selector_MUX_51_reg_9_0_0_0 <= 'X';
        selector_MUX_51_reg_9_0_0_1 <= 'X';
        selector_MUX_5_DPROXY_CTRLN_1_i0_1_0_0 <= 'X';
        selector_MUX_8_DPROXY_CTRLN_2_i0_0_0_0 <= 'X';
        selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0 <= 'X';
        selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_1 <= 'X';
        selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_2 <= 'X';
        selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_0 <= 'X';
        selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_1 <= 'X';
        wrenable_reg_0 <= 'X';
        wrenable_reg_1 <= 'X';
        wrenable_reg_10 <= 'X';
        wrenable_reg_11 <= 'X';
        wrenable_reg_12 <= 'X';
        wrenable_reg_13 <= 'X';
        wrenable_reg_14 <= 'X';
        wrenable_reg_15 <= 'X';
        wrenable_reg_16 <= 'X';
        wrenable_reg_17 <= 'X';
        wrenable_reg_2 <= 'X';
        wrenable_reg_3 <= 'X';
        wrenable_reg_4 <= 'X';
        wrenable_reg_5 <= 'X';
        wrenable_reg_6 <= 'X';
        wrenable_reg_7 <= 'X';
        wrenable_reg_8 <= 'X';
        wrenable_reg_9 <= 'X';
    end case;
  end process;

end controller_make_oriented_arch;

-- Top component for make_oriented
-- This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
-- Author(s): Component automatically generated by bambu
-- License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity make_oriented is 
generic(
  MEM_var_28859_28870: integer := 96;
  MEM_var_28861_28878: integer := 32;
  MEM_var_28868_28878: integer := 64);
port (
  -- IN
  clock : in std_logic;
  reset : in std_logic;
  start_port : in std_logic;
  S_oe_ram : in std_logic_vector (1 downto 0);
  S_we_ram : in std_logic_vector (1 downto 0);
  S_addr_ram : in std_logic_vector(15 downto 0) ;
  S_Wdata_ram : in std_logic_vector(15 downto 0) ;
  S_data_ram_size : in std_logic_vector(7 downto 0) ;
  Sin_Rdata_ram : in std_logic_vector(15 downto 0) ;
  Sin_DataRdy : in std_logic_vector (1 downto 0);
  proxy_out1_28861 : in std_logic_vector(15 downto 0) ;
  proxy_out1_28868 : in std_logic_vector(15 downto 0) ;
  -- OUT
  done_port : out std_logic;
  Sout_Rdata_ram : out std_logic_vector(15 downto 0) ;
  Sout_DataRdy : out std_logic_vector (1 downto 0);
  proxy_in1_28861 : out std_logic_vector(15 downto 0) ;
  proxy_in2_28861 : out std_logic_vector(15 downto 0) ;
  proxy_in3_28861 : out std_logic_vector(7 downto 0) ;
  proxy_sel_LOAD_28861 : out std_logic_vector (1 downto 0);
  proxy_sel_STORE_28861 : out std_logic_vector (1 downto 0);
  proxy_in1_28868 : out std_logic_vector(15 downto 0) ;
  proxy_in2_28868 : out std_logic_vector(15 downto 0) ;
  proxy_in3_28868 : out std_logic_vector(7 downto 0) ;
  proxy_sel_LOAD_28868 : out std_logic_vector (1 downto 0);
  proxy_sel_STORE_28868 : out std_logic_vector (1 downto 0)

);
end make_oriented;

architecture make_oriented_arch of make_oriented is
  -- Component and signal declarations
  
  component datapath_make_oriented
  generic(
    MEM_var_28859_28870: integer := 96;
    MEM_var_28861_28878: integer := 32;
    MEM_var_28868_28878: integer := 64);
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    S_oe_ram : in std_logic_vector (1 downto 0);
    S_we_ram : in std_logic_vector (1 downto 0);
    S_addr_ram : in std_logic_vector(15 downto 0) ;
    S_Wdata_ram : in std_logic_vector(15 downto 0) ;
    S_data_ram_size : in std_logic_vector(7 downto 0) ;
    Sin_Rdata_ram : in std_logic_vector(15 downto 0) ;
    Sin_DataRdy : in std_logic_vector (1 downto 0);
    proxy_out1_28861 : in std_logic_vector(15 downto 0) ;
    proxy_out1_28868 : in std_logic_vector(15 downto 0) ;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD : in std_logic;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE : in std_logic;
    fuselector_DPROXY_CTRLN_1_i0_LOAD : in std_logic;
    fuselector_DPROXY_CTRLN_1_i0_STORE : in std_logic;
    fuselector_DPROXY_CTRLN_2_i0_LOAD : in std_logic;
    fuselector_DPROXY_CTRLN_2_i0_STORE : in std_logic;
    selector_MUX_36_reg_10_0_0_0 : in std_logic;
    selector_MUX_4_DPROXY_CTRLN_1_i0_0_0_0 : in std_logic;
    selector_MUX_51_reg_9_0_0_0 : in std_logic;
    selector_MUX_51_reg_9_0_0_1 : in std_logic;
    selector_MUX_5_DPROXY_CTRLN_1_i0_1_0_0 : in std_logic;
    selector_MUX_8_DPROXY_CTRLN_2_i0_0_0_0 : in std_logic;
    selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0 : in std_logic;
    selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_1 : in std_logic;
    selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_2 : in std_logic;
    selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_0 : in std_logic;
    selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_1 : in std_logic;
    wrenable_reg_0 : in std_logic;
    wrenable_reg_1 : in std_logic;
    wrenable_reg_10 : in std_logic;
    wrenable_reg_11 : in std_logic;
    wrenable_reg_12 : in std_logic;
    wrenable_reg_13 : in std_logic;
    wrenable_reg_14 : in std_logic;
    wrenable_reg_15 : in std_logic;
    wrenable_reg_16 : in std_logic;
    wrenable_reg_17 : in std_logic;
    wrenable_reg_2 : in std_logic;
    wrenable_reg_3 : in std_logic;
    wrenable_reg_4 : in std_logic;
    wrenable_reg_5 : in std_logic;
    wrenable_reg_6 : in std_logic;
    wrenable_reg_7 : in std_logic;
    wrenable_reg_8 : in std_logic;
    wrenable_reg_9 : in std_logic;
    -- OUT
    Sout_Rdata_ram : out std_logic_vector(15 downto 0) ;
    Sout_DataRdy : out std_logic_vector (1 downto 0);
    proxy_in1_28861 : out std_logic_vector(15 downto 0) ;
    proxy_in2_28861 : out std_logic_vector(15 downto 0) ;
    proxy_in3_28861 : out std_logic_vector(7 downto 0) ;
    proxy_sel_LOAD_28861 : out std_logic_vector (1 downto 0);
    proxy_sel_STORE_28861 : out std_logic_vector (1 downto 0);
    proxy_in1_28868 : out std_logic_vector(15 downto 0) ;
    proxy_in2_28868 : out std_logic_vector(15 downto 0) ;
    proxy_in3_28868 : out std_logic_vector(7 downto 0) ;
    proxy_sel_LOAD_28868 : out std_logic_vector (1 downto 0);
    proxy_sel_STORE_28868 : out std_logic_vector (1 downto 0);
    OUT_CONDITION_make_oriented_28870_29025 : out std_logic;
    OUT_CONDITION_make_oriented_28870_29042 : out std_logic;
    OUT_MULTIIF_make_oriented_28870_29832 : out std_logic_vector(1 downto 0) 
  
  );
  end component;
  
  component controller_make_oriented
  port (
    -- IN
    OUT_CONDITION_make_oriented_28870_29025 : in std_logic;
    OUT_CONDITION_make_oriented_28870_29042 : in std_logic;
    OUT_MULTIIF_make_oriented_28870_29832 : in std_logic_vector(1 downto 0) ;
    clock : in std_logic;
    reset : in std_logic;
    start_port : in std_logic;
    -- OUT
    done_port : out std_logic;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD : out std_logic;
    fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE : out std_logic;
    fuselector_DPROXY_CTRLN_1_i0_LOAD : out std_logic;
    fuselector_DPROXY_CTRLN_1_i0_STORE : out std_logic;
    fuselector_DPROXY_CTRLN_2_i0_LOAD : out std_logic;
    fuselector_DPROXY_CTRLN_2_i0_STORE : out std_logic;
    selector_MUX_36_reg_10_0_0_0 : out std_logic;
    selector_MUX_4_DPROXY_CTRLN_1_i0_0_0_0 : out std_logic;
    selector_MUX_51_reg_9_0_0_0 : out std_logic;
    selector_MUX_51_reg_9_0_0_1 : out std_logic;
    selector_MUX_5_DPROXY_CTRLN_1_i0_1_0_0 : out std_logic;
    selector_MUX_8_DPROXY_CTRLN_2_i0_0_0_0 : out std_logic;
    selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0 : out std_logic;
    selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_1 : out std_logic;
    selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_2 : out std_logic;
    selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_0 : out std_logic;
    selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_1 : out std_logic;
    wrenable_reg_0 : out std_logic;
    wrenable_reg_1 : out std_logic;
    wrenable_reg_10 : out std_logic;
    wrenable_reg_11 : out std_logic;
    wrenable_reg_12 : out std_logic;
    wrenable_reg_13 : out std_logic;
    wrenable_reg_14 : out std_logic;
    wrenable_reg_15 : out std_logic;
    wrenable_reg_16 : out std_logic;
    wrenable_reg_17 : out std_logic;
    wrenable_reg_2 : out std_logic;
    wrenable_reg_3 : out std_logic;
    wrenable_reg_4 : out std_logic;
    wrenable_reg_5 : out std_logic;
    wrenable_reg_6 : out std_logic;
    wrenable_reg_7 : out std_logic;
    wrenable_reg_8 : out std_logic;
    wrenable_reg_9 : out std_logic
  
  );
  end component;
  
  component flipflop_AR
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    in1 : in std_logic;
    -- OUT
    out1 : out std_logic
  
  );
  end component;
  signal OUT_CONDITION_make_oriented_28870_29025 : std_logic;
  signal OUT_CONDITION_make_oriented_28870_29042 : std_logic;
  signal OUT_MULTIIF_make_oriented_28870_29832 : std_logic_vector(1 downto 0) ;
  signal done_delayed_REG_signal_in : std_logic;
  signal done_delayed_REG_signal_out : std_logic;
  signal fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD : std_logic;
  signal fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE : std_logic;
  signal fuselector_DPROXY_CTRLN_1_i0_LOAD : std_logic;
  signal fuselector_DPROXY_CTRLN_1_i0_STORE : std_logic;
  signal fuselector_DPROXY_CTRLN_2_i0_LOAD : std_logic;
  signal fuselector_DPROXY_CTRLN_2_i0_STORE : std_logic;
  signal selector_MUX_36_reg_10_0_0_0 : std_logic;
  signal selector_MUX_4_DPROXY_CTRLN_1_i0_0_0_0 : std_logic;
  signal selector_MUX_51_reg_9_0_0_0 : std_logic;
  signal selector_MUX_51_reg_9_0_0_1 : std_logic;
  signal selector_MUX_5_DPROXY_CTRLN_1_i0_1_0_0 : std_logic;
  signal selector_MUX_8_DPROXY_CTRLN_2_i0_0_0_0 : std_logic;
  signal selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0 : std_logic;
  signal selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_1 : std_logic;
  signal selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_2 : std_logic;
  signal selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_0 : std_logic;
  signal selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_1 : std_logic;
  signal wrenable_reg_0 : std_logic;
  signal wrenable_reg_1 : std_logic;
  signal wrenable_reg_10 : std_logic;
  signal wrenable_reg_11 : std_logic;
  signal wrenable_reg_12 : std_logic;
  signal wrenable_reg_13 : std_logic;
  signal wrenable_reg_14 : std_logic;
  signal wrenable_reg_15 : std_logic;
  signal wrenable_reg_16 : std_logic;
  signal wrenable_reg_17 : std_logic;
  signal wrenable_reg_2 : std_logic;
  signal wrenable_reg_3 : std_logic;
  signal wrenable_reg_4 : std_logic;
  signal wrenable_reg_5 : std_logic;
  signal wrenable_reg_6 : std_logic;
  signal wrenable_reg_7 : std_logic;
  signal wrenable_reg_8 : std_logic;
  signal wrenable_reg_9 : std_logic;
begin
  Controller_i : controller_make_oriented port map (done_port => done_delayed_REG_signal_in, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE, fuselector_DPROXY_CTRLN_1_i0_LOAD => fuselector_DPROXY_CTRLN_1_i0_LOAD, fuselector_DPROXY_CTRLN_1_i0_STORE => fuselector_DPROXY_CTRLN_1_i0_STORE, fuselector_DPROXY_CTRLN_2_i0_LOAD => fuselector_DPROXY_CTRLN_2_i0_LOAD, fuselector_DPROXY_CTRLN_2_i0_STORE => fuselector_DPROXY_CTRLN_2_i0_STORE, selector_MUX_36_reg_10_0_0_0 => selector_MUX_36_reg_10_0_0_0, selector_MUX_4_DPROXY_CTRLN_1_i0_0_0_0 => selector_MUX_4_DPROXY_CTRLN_1_i0_0_0_0, selector_MUX_51_reg_9_0_0_0 => selector_MUX_51_reg_9_0_0_0, selector_MUX_51_reg_9_0_0_1 => selector_MUX_51_reg_9_0_0_1, selector_MUX_5_DPROXY_CTRLN_1_i0_1_0_0 => selector_MUX_5_DPROXY_CTRLN_1_i0_1_0_0, selector_MUX_8_DPROXY_CTRLN_2_i0_0_0_0 => selector_MUX_8_DPROXY_CTRLN_2_i0_0_0_0, selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0 => selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0, selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_1 => selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_1, selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_2 => selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_2, selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_0 => selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_0, selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_1 => selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_1, wrenable_reg_0 => wrenable_reg_0, wrenable_reg_1 => wrenable_reg_1, wrenable_reg_10 => wrenable_reg_10, wrenable_reg_11 => wrenable_reg_11, wrenable_reg_12 => wrenable_reg_12, wrenable_reg_13 => wrenable_reg_13, wrenable_reg_14 => wrenable_reg_14, wrenable_reg_15 => wrenable_reg_15, wrenable_reg_16 => wrenable_reg_16, wrenable_reg_17 => wrenable_reg_17, wrenable_reg_2 => wrenable_reg_2, wrenable_reg_3 => wrenable_reg_3, wrenable_reg_4 => wrenable_reg_4, wrenable_reg_5 => wrenable_reg_5, wrenable_reg_6 => wrenable_reg_6, wrenable_reg_7 => wrenable_reg_7, wrenable_reg_8 => wrenable_reg_8, wrenable_reg_9 => wrenable_reg_9, OUT_CONDITION_make_oriented_28870_29025 => OUT_CONDITION_make_oriented_28870_29025, OUT_CONDITION_make_oriented_28870_29042 => OUT_CONDITION_make_oriented_28870_29042, OUT_MULTIIF_make_oriented_28870_29832 => OUT_MULTIIF_make_oriented_28870_29832, clock => clock, reset => reset, start_port => start_port);
  Datapath_i : datapath_make_oriented generic map(MEM_var_28859_28870=>(MEM_var_28859_28870), MEM_var_28861_28878=>(MEM_var_28861_28878), MEM_var_28868_28878=>(MEM_var_28868_28878)) port map (Sout_Rdata_ram => Sout_Rdata_ram, Sout_DataRdy => Sout_DataRdy, proxy_in1_28861 => proxy_in1_28861, proxy_in2_28861 => proxy_in2_28861, proxy_in3_28861 => proxy_in3_28861, proxy_sel_LOAD_28861 => proxy_sel_LOAD_28861, proxy_sel_STORE_28861 => proxy_sel_STORE_28861, proxy_in1_28868 => proxy_in1_28868, proxy_in2_28868 => proxy_in2_28868, proxy_in3_28868 => proxy_in3_28868, proxy_sel_LOAD_28868 => proxy_sel_LOAD_28868, proxy_sel_STORE_28868 => proxy_sel_STORE_28868, OUT_CONDITION_make_oriented_28870_29025 => OUT_CONDITION_make_oriented_28870_29025, OUT_CONDITION_make_oriented_28870_29042 => OUT_CONDITION_make_oriented_28870_29042, OUT_MULTIIF_make_oriented_28870_29832 => OUT_MULTIIF_make_oriented_28870_29832, clock => clock, reset => reset, S_oe_ram => S_oe_ram, S_we_ram => S_we_ram, S_addr_ram => S_addr_ram, S_Wdata_ram => S_Wdata_ram, S_data_ram_size => S_data_ram_size, Sin_Rdata_ram => Sin_Rdata_ram, Sin_DataRdy => Sin_DataRdy, proxy_out1_28861 => proxy_out1_28861, proxy_out1_28868 => proxy_out1_28868, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_LOAD, fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE => fuselector_ARRAY_1D_STD_DISTRAM_NN_SDS_0_i0_STORE, fuselector_DPROXY_CTRLN_1_i0_LOAD => fuselector_DPROXY_CTRLN_1_i0_LOAD, fuselector_DPROXY_CTRLN_1_i0_STORE => fuselector_DPROXY_CTRLN_1_i0_STORE, fuselector_DPROXY_CTRLN_2_i0_LOAD => fuselector_DPROXY_CTRLN_2_i0_LOAD, fuselector_DPROXY_CTRLN_2_i0_STORE => fuselector_DPROXY_CTRLN_2_i0_STORE, selector_MUX_36_reg_10_0_0_0 => selector_MUX_36_reg_10_0_0_0, selector_MUX_4_DPROXY_CTRLN_1_i0_0_0_0 => selector_MUX_4_DPROXY_CTRLN_1_i0_0_0_0, selector_MUX_51_reg_9_0_0_0 => selector_MUX_51_reg_9_0_0_0, selector_MUX_51_reg_9_0_0_1 => selector_MUX_51_reg_9_0_0_1, selector_MUX_5_DPROXY_CTRLN_1_i0_1_0_0 => selector_MUX_5_DPROXY_CTRLN_1_i0_1_0_0, selector_MUX_8_DPROXY_CTRLN_2_i0_0_0_0 => selector_MUX_8_DPROXY_CTRLN_2_i0_0_0_0, selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0 => selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_0, selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_1 => selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_1, selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_2 => selector_MUX_9_DPROXY_CTRLN_2_i0_1_0_2, selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_0 => selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_0, selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_1 => selector_MUX_9_DPROXY_CTRLN_2_i0_1_1_1, wrenable_reg_0 => wrenable_reg_0, wrenable_reg_1 => wrenable_reg_1, wrenable_reg_10 => wrenable_reg_10, wrenable_reg_11 => wrenable_reg_11, wrenable_reg_12 => wrenable_reg_12, wrenable_reg_13 => wrenable_reg_13, wrenable_reg_14 => wrenable_reg_14, wrenable_reg_15 => wrenable_reg_15, wrenable_reg_16 => wrenable_reg_16, wrenable_reg_17 => wrenable_reg_17, wrenable_reg_2 => wrenable_reg_2, wrenable_reg_3 => wrenable_reg_3, wrenable_reg_4 => wrenable_reg_4, wrenable_reg_5 => wrenable_reg_5, wrenable_reg_6 => wrenable_reg_6, wrenable_reg_7 => wrenable_reg_7, wrenable_reg_8 => wrenable_reg_8, wrenable_reg_9 => wrenable_reg_9);
  done_delayed_REG : flipflop_AR generic map(BITSIZE_in1=>1, BITSIZE_out1=>1) port map (out1 => done_delayed_REG_signal_out, clock => clock, reset => reset, in1 => done_delayed_REG_signal_in);
  -- io-signal post fix
  done_port <= done_delayed_REG_signal_out;

end make_oriented_arch;

-- Datapath RTL description for main
-- This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
-- Author(s): Component automatically generated by bambu
-- License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity datapath_main is 
generic(
  MEM_var_28859_28870: integer := 96;
  MEM_var_28861_28878: integer := 32;
  MEM_var_28864_28877: integer := 128;
  MEM_var_28866_28877: integer := 160;
  MEM_var_28867_28877: integer := 192;
  MEM_var_28868_28878: integer := 64);
port (
  -- IN
  clock : in std_logic;
  reset : in std_logic;
  S_oe_ram : in std_logic_vector (1 downto 0);
  S_we_ram : in std_logic_vector (1 downto 0);
  S_addr_ram : in std_logic_vector(15 downto 0) ;
  S_Wdata_ram : in std_logic_vector(15 downto 0) ;
  S_data_ram_size : in std_logic_vector(7 downto 0) ;
  Sin_Rdata_ram : in std_logic_vector(15 downto 0) ;
  Sin_DataRdy : in std_logic_vector (1 downto 0);
  selector_IN_UNBOUNDED_main_28878_29386 : in std_logic;
  selector_IN_UNBOUNDED_main_28878_29387 : in std_logic;
  wrenable_reg_0 : in std_logic;
  -- OUT
  Sout_Rdata_ram : out std_logic_vector(15 downto 0) ;
  Sout_DataRdy : out std_logic_vector (1 downto 0);
  OUT_UNBOUNDED_main_28878_29386 : out std_logic;
  OUT_UNBOUNDED_main_28878_29387 : out std_logic

);
end datapath_main;

architecture datapath_main_arch of datapath_main is
  -- Component and signal declarations
  
  component constant_value
  generic(
   BITSIZE_out1: integer;
   value: std_logic_vector);
  port (
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component register_SE
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    wenable : in std_logic;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component ARRAY_1D_STD_DISTRAM_NN_SDS
  generic(
   BITSIZE_in1: integer;
   PORTSIZE_in1: integer;
   BITSIZE_in2: integer;
   PORTSIZE_in2: integer;
   BITSIZE_in3: integer;
   PORTSIZE_in3: integer;
   BITSIZE_in4: integer;
   PORTSIZE_in4: integer;
   BITSIZE_sel_LOAD: integer;
   PORTSIZE_sel_LOAD: integer;
   BITSIZE_sel_STORE: integer;
   PORTSIZE_sel_STORE: integer;
   BITSIZE_S_oe_ram: integer;
   PORTSIZE_S_oe_ram: integer;
   BITSIZE_S_we_ram: integer;
   PORTSIZE_S_we_ram: integer;
   BITSIZE_out1: integer;
   PORTSIZE_out1: integer;
   BITSIZE_S_addr_ram: integer;
   PORTSIZE_S_addr_ram: integer;
   BITSIZE_S_Wdata_ram: integer;
   PORTSIZE_S_Wdata_ram: integer;
   BITSIZE_Sin_Rdata_ram: integer;
   PORTSIZE_Sin_Rdata_ram: integer;
   BITSIZE_Sout_Rdata_ram: integer;
   PORTSIZE_Sout_Rdata_ram: integer;
   BITSIZE_S_data_ram_size: integer;
   PORTSIZE_S_data_ram_size: integer;
   BITSIZE_Sin_DataRdy: integer;
   PORTSIZE_Sin_DataRdy: integer;
   BITSIZE_Sout_DataRdy: integer;
   PORTSIZE_Sout_DataRdy: integer;
   MEMORY_INIT_file: string;
   n_elements: integer;
   data_size: integer;
   address_space_begin: integer;
   address_space_rangesize: integer;
   BUS_PIPELINED: integer;
   BRAM_BITSIZE: integer;
   PRIVATE_MEMORY: integer;
   READ_ONLY_MEMORY: integer;
   USE_SPARSE_MEMORY: integer;
   BITSIZE_proxy_in1: integer;
   PORTSIZE_proxy_in1: integer;
   BITSIZE_proxy_in2: integer;
   PORTSIZE_proxy_in2: integer;
   BITSIZE_proxy_in3: integer;
   PORTSIZE_proxy_in3: integer;
   BITSIZE_proxy_sel_LOAD: integer;
   PORTSIZE_proxy_sel_LOAD: integer;
   BITSIZE_proxy_sel_STORE: integer;
   PORTSIZE_proxy_sel_STORE: integer;
   BITSIZE_proxy_out1: integer;
   PORTSIZE_proxy_out1: integer);
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    in1 : in std_logic_vector((PORTSIZE_in1*BITSIZE_in1)+(-1) downto 0) ;
    in2 : in std_logic_vector((PORTSIZE_in2*BITSIZE_in2)+(-1) downto 0) ;
    in3 : in std_logic_vector((PORTSIZE_in3*BITSIZE_in3)+(-1) downto 0) ;
    in4 : in std_logic_vector((PORTSIZE_in4*BITSIZE_in4)-1 downto 0) ;
    sel_LOAD : in std_logic_vector((PORTSIZE_sel_LOAD*BITSIZE_sel_LOAD)-1 downto 0) ;
    sel_STORE : in std_logic_vector((PORTSIZE_sel_STORE*BITSIZE_sel_STORE)-1 downto 0) ;
    S_oe_ram : in std_logic_vector((PORTSIZE_S_oe_ram*BITSIZE_S_oe_ram)-1 downto 0) ;
    S_we_ram : in std_logic_vector((PORTSIZE_S_we_ram*BITSIZE_S_we_ram)-1 downto 0) ;
    S_addr_ram : in std_logic_vector((PORTSIZE_S_addr_ram*BITSIZE_S_addr_ram)+(-1) downto 0) ;
    S_Wdata_ram : in std_logic_vector((PORTSIZE_S_Wdata_ram*BITSIZE_S_Wdata_ram)+(-1) downto 0) ;
    Sin_Rdata_ram : in std_logic_vector((PORTSIZE_Sin_Rdata_ram*BITSIZE_Sin_Rdata_ram)+(-1) downto 0) ;
    S_data_ram_size : in std_logic_vector((PORTSIZE_S_data_ram_size*BITSIZE_S_data_ram_size)+(-1) downto 0) ;
    Sin_DataRdy : in std_logic_vector((PORTSIZE_Sin_DataRdy*BITSIZE_Sin_DataRdy)-1 downto 0) ;
    proxy_in1 : in std_logic_vector((PORTSIZE_proxy_in1*BITSIZE_proxy_in1)+(-1) downto 0) ;
    proxy_in2 : in std_logic_vector((PORTSIZE_proxy_in2*BITSIZE_proxy_in2)+(-1) downto 0) ;
    proxy_in3 : in std_logic_vector((PORTSIZE_proxy_in3*BITSIZE_proxy_in3)+(-1) downto 0) ;
    proxy_sel_LOAD : in std_logic_vector((PORTSIZE_proxy_sel_LOAD*BITSIZE_proxy_sel_LOAD)-1 downto 0) ;
    proxy_sel_STORE : in std_logic_vector((PORTSIZE_proxy_sel_STORE*BITSIZE_proxy_sel_STORE)-1 downto 0) ;
    -- OUT
    out1 : out std_logic_vector((PORTSIZE_out1*BITSIZE_out1)+(-1) downto 0) ;
    Sout_Rdata_ram : out std_logic_vector((PORTSIZE_Sout_Rdata_ram*BITSIZE_Sout_Rdata_ram)+(-1) downto 0) ;
    Sout_DataRdy : out std_logic_vector((PORTSIZE_Sout_DataRdy*BITSIZE_Sout_DataRdy)-1 downto 0) ;
    proxy_out1 : out std_logic_vector((PORTSIZE_proxy_out1*BITSIZE_proxy_out1)+(-1) downto 0) 
  
  );
  end component;
  
  component addr_expr_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component UUdata_converter_FU
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component astar
  generic(
    MEM_var_28861_28878: integer := 32;
    MEM_var_28864_28877: integer := 128;
    MEM_var_28866_28877: integer := 160;
    MEM_var_28867_28877: integer := 192;
    MEM_var_28868_28878: integer := 64);
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    start_port : in std_logic;
    size : in unsigned (7 downto 0);
    a : in std_logic_vector(31 downto 0) ;
    goal : in unsigned (7 downto 0);
    S_oe_ram : in std_logic_vector (1 downto 0);
    S_we_ram : in std_logic_vector (1 downto 0);
    S_addr_ram : in std_logic_vector(15 downto 0) ;
    S_Wdata_ram : in std_logic_vector(15 downto 0) ;
    S_data_ram_size : in std_logic_vector(7 downto 0) ;
    Sin_Rdata_ram : in std_logic_vector(15 downto 0) ;
    Sin_DataRdy : in std_logic_vector (1 downto 0);
    proxy_out1_28861 : in std_logic_vector(15 downto 0) ;
    proxy_out1_28868 : in std_logic_vector(15 downto 0) ;
    -- OUT
    done_port : out std_logic;
    Sout_Rdata_ram : out std_logic_vector(15 downto 0) ;
    Sout_DataRdy : out std_logic_vector (1 downto 0);
    proxy_in1_28861 : out std_logic_vector(15 downto 0) ;
    proxy_in2_28861 : out std_logic_vector(15 downto 0) ;
    proxy_in3_28861 : out std_logic_vector(7 downto 0) ;
    proxy_sel_LOAD_28861 : out std_logic_vector (1 downto 0);
    proxy_sel_STORE_28861 : out std_logic_vector (1 downto 0);
    proxy_in1_28868 : out std_logic_vector(15 downto 0) ;
    proxy_in2_28868 : out std_logic_vector(15 downto 0) ;
    proxy_in3_28868 : out std_logic_vector(7 downto 0) ;
    proxy_sel_LOAD_28868 : out std_logic_vector (1 downto 0);
    proxy_sel_STORE_28868 : out std_logic_vector (1 downto 0)
  
  );
  end component;
  
  component make_oriented
  generic(
    MEM_var_28859_28870: integer := 96;
    MEM_var_28861_28878: integer := 32;
    MEM_var_28868_28878: integer := 64);
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    start_port : in std_logic;
    S_oe_ram : in std_logic_vector (1 downto 0);
    S_we_ram : in std_logic_vector (1 downto 0);
    S_addr_ram : in std_logic_vector(15 downto 0) ;
    S_Wdata_ram : in std_logic_vector(15 downto 0) ;
    S_data_ram_size : in std_logic_vector(7 downto 0) ;
    Sin_Rdata_ram : in std_logic_vector(15 downto 0) ;
    Sin_DataRdy : in std_logic_vector (1 downto 0);
    proxy_out1_28861 : in std_logic_vector(15 downto 0) ;
    proxy_out1_28868 : in std_logic_vector(15 downto 0) ;
    -- OUT
    done_port : out std_logic;
    Sout_Rdata_ram : out std_logic_vector(15 downto 0) ;
    Sout_DataRdy : out std_logic_vector (1 downto 0);
    proxy_in1_28861 : out std_logic_vector(15 downto 0) ;
    proxy_in2_28861 : out std_logic_vector(15 downto 0) ;
    proxy_in3_28861 : out std_logic_vector(7 downto 0) ;
    proxy_sel_LOAD_28861 : out std_logic_vector (1 downto 0);
    proxy_sel_STORE_28861 : out std_logic_vector (1 downto 0);
    proxy_in1_28868 : out std_logic_vector(15 downto 0) ;
    proxy_in2_28868 : out std_logic_vector(15 downto 0) ;
    proxy_in3_28868 : out std_logic_vector(7 downto 0) ;
    proxy_sel_LOAD_28868 : out std_logic_vector (1 downto 0);
    proxy_sel_STORE_28868 : out std_logic_vector (1 downto 0)
  
  );
  end component;
  
  component bus_merger
  generic(
   BITSIZE_in1: integer;
   PORTSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector((PORTSIZE_in1*BITSIZE_in1)+(-1) downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component join_signal
  generic(
   BITSIZE_in1: integer;
   PORTSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector((PORTSIZE_in1*BITSIZE_in1)+(-1) downto 0) ;
    -- OUT
    out1 : out std_logic_vector(BITSIZE_out1-1 downto 0) 
  
  );
  end component;
  
  component split_signal
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer;
   PORTSIZE_out1: integer);
  port (
    -- IN
    in1 : in std_logic_vector(BITSIZE_in1-1 downto 0) ;
    -- OUT
    out1 : out std_logic_vector((PORTSIZE_out1*BITSIZE_out1)+(-1) downto 0) 
  
  );
  end component;
  signal null_out_signal_array_28861_0_out1_0 : std_logic_vector(7 downto 0) ;
  signal null_out_signal_array_28861_0_out1_1 : std_logic_vector(7 downto 0) ;
  signal null_out_signal_array_28868_0_out1_0 : std_logic_vector(7 downto 0) ;
  signal null_out_signal_array_28868_0_out1_1 : std_logic_vector(7 downto 0) ;
  signal out_UUdata_converter_FU_5_i0_fu_main_28878_29720 : std_logic_vector(0 downto 0);
  signal out_addr_expr_FU_4_i0_fu_main_28878_29602 : std_logic_vector(0 downto 0);
  signal out_const_0 : std_logic_vector(1 downto 0) ;
  signal out_const_1 : std_logic_vector(2 downto 0) ;
  signal out_const_2 : std_logic_vector(7 downto 0) ;
  signal out_conv_out_const_0_2_8 : std_logic_vector(7 downto 0) ;
  signal out_conv_out_const_1_3_8 : std_logic_vector(7 downto 0) ;
  signal out_conv_out_const_2_8_32 : std_logic_vector(31 downto 0) ;
  signal out_conv_out_reg_0_reg_0_1_32 : std_logic_vector(31 downto 0) ;
  signal out_reg_0_reg_0 : std_logic_vector(0 downto 0);
  signal proxy_out1_28861 : std_logic_vector (15 downto 0);
  signal proxy_out1_28868 : std_logic_vector (15 downto 0);
  signal s_done_fu_main_28878_29386 : std_logic;
  signal s_done_fu_main_28878_29387 : std_logic;
  signal sig_in_bus_mergerSout_DataRdy0_0 : std_logic_vector(1 downto 0) ;
  signal sig_in_bus_mergerSout_DataRdy0_1 : std_logic_vector(1 downto 0) ;
  signal sig_in_bus_mergerSout_DataRdy0_2 : std_logic_vector(1 downto 0) ;
  signal sig_in_bus_mergerSout_DataRdy0_3 : std_logic_vector(1 downto 0) ;
  signal sig_in_bus_mergerSout_Rdata_ram1_0 : std_logic_vector(15 downto 0) ;
  signal sig_in_bus_mergerSout_Rdata_ram1_1 : std_logic_vector(15 downto 0) ;
  signal sig_in_bus_mergerSout_Rdata_ram1_2 : std_logic_vector(15 downto 0) ;
  signal sig_in_bus_mergerSout_Rdata_ram1_3 : std_logic_vector(15 downto 0) ;
  signal sig_in_bus_mergerproxy_in12_0 : std_logic_vector(15 downto 0) ;
  signal sig_in_bus_mergerproxy_in12_1 : std_logic_vector(15 downto 0) ;
  signal sig_in_bus_mergerproxy_in17_0 : std_logic_vector(15 downto 0) ;
  signal sig_in_bus_mergerproxy_in17_1 : std_logic_vector(15 downto 0) ;
  signal sig_in_bus_mergerproxy_in23_0 : std_logic_vector(15 downto 0) ;
  signal sig_in_bus_mergerproxy_in23_1 : std_logic_vector(15 downto 0) ;
  signal sig_in_bus_mergerproxy_in28_0 : std_logic_vector(15 downto 0) ;
  signal sig_in_bus_mergerproxy_in28_1 : std_logic_vector(15 downto 0) ;
  signal sig_in_bus_mergerproxy_in34_0 : std_logic_vector(7 downto 0) ;
  signal sig_in_bus_mergerproxy_in34_1 : std_logic_vector(7 downto 0) ;
  signal sig_in_bus_mergerproxy_in39_0 : std_logic_vector(7 downto 0) ;
  signal sig_in_bus_mergerproxy_in39_1 : std_logic_vector(7 downto 0) ;
  signal sig_in_bus_mergerproxy_sel_LOAD10_0 : std_logic_vector(1 downto 0) ;
  signal sig_in_bus_mergerproxy_sel_LOAD10_1 : std_logic_vector(1 downto 0) ;
  signal sig_in_bus_mergerproxy_sel_LOAD5_0 : std_logic_vector(1 downto 0) ;
  signal sig_in_bus_mergerproxy_sel_LOAD5_1 : std_logic_vector(1 downto 0) ;
  signal sig_in_bus_mergerproxy_sel_STORE11_0 : std_logic_vector(1 downto 0) ;
  signal sig_in_bus_mergerproxy_sel_STORE11_1 : std_logic_vector(1 downto 0) ;
  signal sig_in_bus_mergerproxy_sel_STORE6_0 : std_logic_vector(1 downto 0) ;
  signal sig_in_bus_mergerproxy_sel_STORE6_1 : std_logic_vector(1 downto 0) ;
  signal sig_in_vector_bus_mergerSout_DataRdy0_0 : std_logic_vector (1 downto 0);
  signal sig_in_vector_bus_mergerSout_DataRdy0_1 : std_logic_vector (1 downto 0);
  signal sig_in_vector_bus_mergerSout_DataRdy0_2 : std_logic_vector (1 downto 0);
  signal sig_in_vector_bus_mergerSout_DataRdy0_3 : std_logic_vector (1 downto 0);
  signal sig_in_vector_bus_mergerSout_Rdata_ram1_0 : std_logic_vector (15 downto 0);
  signal sig_in_vector_bus_mergerSout_Rdata_ram1_1 : std_logic_vector (15 downto 0);
  signal sig_in_vector_bus_mergerSout_Rdata_ram1_2 : std_logic_vector (15 downto 0);
  signal sig_in_vector_bus_mergerSout_Rdata_ram1_3 : std_logic_vector (15 downto 0);
  signal sig_in_vector_bus_mergerproxy_in12_0 : std_logic_vector (15 downto 0);
  signal sig_in_vector_bus_mergerproxy_in12_1 : std_logic_vector (15 downto 0);
  signal sig_in_vector_bus_mergerproxy_in17_0 : std_logic_vector (15 downto 0);
  signal sig_in_vector_bus_mergerproxy_in17_1 : std_logic_vector (15 downto 0);
  signal sig_in_vector_bus_mergerproxy_in23_0 : std_logic_vector (15 downto 0);
  signal sig_in_vector_bus_mergerproxy_in23_1 : std_logic_vector (15 downto 0);
  signal sig_in_vector_bus_mergerproxy_in28_0 : std_logic_vector (15 downto 0);
  signal sig_in_vector_bus_mergerproxy_in28_1 : std_logic_vector (15 downto 0);
  signal sig_in_vector_bus_mergerproxy_in34_0 : std_logic_vector (7 downto 0);
  signal sig_in_vector_bus_mergerproxy_in34_1 : std_logic_vector (7 downto 0);
  signal sig_in_vector_bus_mergerproxy_in39_0 : std_logic_vector (7 downto 0);
  signal sig_in_vector_bus_mergerproxy_in39_1 : std_logic_vector (7 downto 0);
  signal sig_in_vector_bus_mergerproxy_sel_LOAD10_0 : std_logic_vector (1 downto 0);
  signal sig_in_vector_bus_mergerproxy_sel_LOAD10_1 : std_logic_vector (1 downto 0);
  signal sig_in_vector_bus_mergerproxy_sel_LOAD5_0 : std_logic_vector (1 downto 0);
  signal sig_in_vector_bus_mergerproxy_sel_LOAD5_1 : std_logic_vector (1 downto 0);
  signal sig_in_vector_bus_mergerproxy_sel_STORE11_0 : std_logic_vector (1 downto 0);
  signal sig_in_vector_bus_mergerproxy_sel_STORE11_1 : std_logic_vector (1 downto 0);
  signal sig_in_vector_bus_mergerproxy_sel_STORE6_0 : std_logic_vector (1 downto 0);
  signal sig_in_vector_bus_mergerproxy_sel_STORE6_1 : std_logic_vector (1 downto 0);
  signal \sig_out_bus_mergerSout_DataRdy0_\ : std_logic_vector(1 downto 0) ;
  signal \sig_out_bus_mergerSout_Rdata_ram1_\ : std_logic_vector(15 downto 0) ;
  signal \sig_out_bus_mergerproxy_in12_\ : std_logic_vector(15 downto 0) ;
  signal \sig_out_bus_mergerproxy_in17_\ : std_logic_vector(15 downto 0) ;
  signal \sig_out_bus_mergerproxy_in23_\ : std_logic_vector(15 downto 0) ;
  signal \sig_out_bus_mergerproxy_in28_\ : std_logic_vector(15 downto 0) ;
  signal \sig_out_bus_mergerproxy_in34_\ : std_logic_vector(7 downto 0) ;
  signal \sig_out_bus_mergerproxy_in39_\ : std_logic_vector(7 downto 0) ;
  signal \sig_out_bus_mergerproxy_sel_LOAD10_\ : std_logic_vector(1 downto 0) ;
  signal \sig_out_bus_mergerproxy_sel_LOAD5_\ : std_logic_vector(1 downto 0) ;
  signal \sig_out_bus_mergerproxy_sel_STORE11_\ : std_logic_vector(1 downto 0) ;
  signal \sig_out_bus_mergerproxy_sel_STORE6_\ : std_logic_vector(1 downto 0) ;
  signal \sig_out_vector_bus_mergerproxy_in12_\ : std_logic_vector (15 downto 0);
  signal \sig_out_vector_bus_mergerproxy_in17_\ : std_logic_vector (15 downto 0);
  signal \sig_out_vector_bus_mergerproxy_in23_\ : std_logic_vector (15 downto 0);
  signal \sig_out_vector_bus_mergerproxy_in28_\ : std_logic_vector (15 downto 0);
  signal \sig_out_vector_bus_mergerproxy_in34_\ : std_logic_vector (7 downto 0);
  signal \sig_out_vector_bus_mergerproxy_in39_\ : std_logic_vector (7 downto 0);
  signal \sig_out_vector_bus_mergerproxy_sel_LOAD10_\ : std_logic_vector (1 downto 0);
  signal \sig_out_vector_bus_mergerproxy_sel_LOAD5_\ : std_logic_vector (1 downto 0);
  signal \sig_out_vector_bus_mergerproxy_sel_STORE11_\ : std_logic_vector (1 downto 0);
  signal \sig_out_vector_bus_mergerproxy_sel_STORE6_\ : std_logic_vector (1 downto 0);
begin
  array_28861_0 : ARRAY_1D_STD_DISTRAM_NN_SDS generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_in2=>8, PORTSIZE_in2=>2, BITSIZE_in3=>4, PORTSIZE_in3=>2, BITSIZE_in4=>1, PORTSIZE_in4=>2, BITSIZE_sel_LOAD=>1, PORTSIZE_sel_LOAD=>2, BITSIZE_sel_STORE=>1, PORTSIZE_sel_STORE=>2, BITSIZE_S_oe_ram=>1, PORTSIZE_S_oe_ram=>2, BITSIZE_S_we_ram=>1, PORTSIZE_S_we_ram=>2, BITSIZE_out1=>8, PORTSIZE_out1=>2, BITSIZE_S_addr_ram=>8, PORTSIZE_S_addr_ram=>2, BITSIZE_S_Wdata_ram=>8, PORTSIZE_S_Wdata_ram=>2, BITSIZE_Sin_Rdata_ram=>8, PORTSIZE_Sin_Rdata_ram=>2, BITSIZE_Sout_Rdata_ram=>8, PORTSIZE_Sout_Rdata_ram=>2, BITSIZE_S_data_ram_size=>4, PORTSIZE_S_data_ram_size=>2, BITSIZE_Sin_DataRdy=>1, PORTSIZE_Sin_DataRdy=>2, BITSIZE_Sout_DataRdy=>1, PORTSIZE_Sout_DataRdy=>2, MEMORY_INIT_file=>"array_ref_28861.mem", n_elements=>1, data_size=>8, address_space_begin=>MEM_var_28861_28878, address_space_rangesize=>32, BUS_PIPELINED=>1, BRAM_BITSIZE=>8, PRIVATE_MEMORY=>0, READ_ONLY_MEMORY=>0, USE_SPARSE_MEMORY=>1, BITSIZE_proxy_in1=>8, PORTSIZE_proxy_in1=>2, BITSIZE_proxy_in2=>8, PORTSIZE_proxy_in2=>2, BITSIZE_proxy_in3=>4, PORTSIZE_proxy_in3=>2, BITSIZE_proxy_sel_LOAD=>1, PORTSIZE_proxy_sel_LOAD=>2, BITSIZE_proxy_sel_STORE=>1, PORTSIZE_proxy_sel_STORE=>2, BITSIZE_proxy_out1=>8, PORTSIZE_proxy_out1=>2) port map (out1(15 downto 8) => null_out_signal_array_28861_0_out1_1, out1(7 downto 0) => null_out_signal_array_28861_0_out1_0, Sout_Rdata_ram => sig_in_vector_bus_mergerSout_Rdata_ram1_0, Sout_DataRdy => sig_in_vector_bus_mergerSout_DataRdy0_0, proxy_out1 => proxy_out1_28861, clock => clock, reset => reset, in1(15 downto 8) => "00000000", in1(7 downto 0) => "00000000", in2(15 downto 8) => "00000000", in2(7 downto 0) => "00000000", in3(7 downto 4) => "0000", in3(3 downto 0) => "0000", in4(1 downto 1) => "0", in4(0 downto 0) => "0", sel_LOAD(1 downto 1) => "0", sel_LOAD(0 downto 0) => "0", sel_STORE(1 downto 1) => "0", sel_STORE(0 downto 0) => "0", S_oe_ram => S_oe_ram, S_we_ram => S_we_ram, S_addr_ram => S_addr_ram, S_Wdata_ram => S_Wdata_ram, Sin_Rdata_ram => Sin_Rdata_ram, S_data_ram_size => S_data_ram_size, Sin_DataRdy => Sin_DataRdy, proxy_in1 => \sig_out_vector_bus_mergerproxy_in12_\, proxy_in2 => \sig_out_vector_bus_mergerproxy_in23_\, proxy_in3 => \sig_out_vector_bus_mergerproxy_in34_\, proxy_sel_LOAD => \sig_out_vector_bus_mergerproxy_sel_LOAD5_\, proxy_sel_STORE => \sig_out_vector_bus_mergerproxy_sel_STORE6_\);
  array_28868_0 : ARRAY_1D_STD_DISTRAM_NN_SDS generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_in2=>8, PORTSIZE_in2=>2, BITSIZE_in3=>4, PORTSIZE_in3=>2, BITSIZE_in4=>1, PORTSIZE_in4=>2, BITSIZE_sel_LOAD=>1, PORTSIZE_sel_LOAD=>2, BITSIZE_sel_STORE=>1, PORTSIZE_sel_STORE=>2, BITSIZE_S_oe_ram=>1, PORTSIZE_S_oe_ram=>2, BITSIZE_S_we_ram=>1, PORTSIZE_S_we_ram=>2, BITSIZE_out1=>8, PORTSIZE_out1=>2, BITSIZE_S_addr_ram=>8, PORTSIZE_S_addr_ram=>2, BITSIZE_S_Wdata_ram=>8, PORTSIZE_S_Wdata_ram=>2, BITSIZE_Sin_Rdata_ram=>8, PORTSIZE_Sin_Rdata_ram=>2, BITSIZE_Sout_Rdata_ram=>8, PORTSIZE_Sout_Rdata_ram=>2, BITSIZE_S_data_ram_size=>4, PORTSIZE_S_data_ram_size=>2, BITSIZE_Sin_DataRdy=>1, PORTSIZE_Sin_DataRdy=>2, BITSIZE_Sout_DataRdy=>1, PORTSIZE_Sout_DataRdy=>2, MEMORY_INIT_file=>"array_ref_28868.mem", n_elements=>4, data_size=>8, address_space_begin=>MEM_var_28868_28878, address_space_rangesize=>32, BUS_PIPELINED=>1, BRAM_BITSIZE=>8, PRIVATE_MEMORY=>0, READ_ONLY_MEMORY=>0, USE_SPARSE_MEMORY=>1, BITSIZE_proxy_in1=>8, PORTSIZE_proxy_in1=>2, BITSIZE_proxy_in2=>8, PORTSIZE_proxy_in2=>2, BITSIZE_proxy_in3=>4, PORTSIZE_proxy_in3=>2, BITSIZE_proxy_sel_LOAD=>1, PORTSIZE_proxy_sel_LOAD=>2, BITSIZE_proxy_sel_STORE=>1, PORTSIZE_proxy_sel_STORE=>2, BITSIZE_proxy_out1=>8, PORTSIZE_proxy_out1=>2) port map (out1(15 downto 8) => null_out_signal_array_28868_0_out1_1, out1(7 downto 0) => null_out_signal_array_28868_0_out1_0, Sout_Rdata_ram => sig_in_vector_bus_mergerSout_Rdata_ram1_1, Sout_DataRdy => sig_in_vector_bus_mergerSout_DataRdy0_1, proxy_out1 => proxy_out1_28868, clock => clock, reset => reset, in1(15 downto 8) => "00000000", in1(7 downto 0) => "00000000", in2(15 downto 8) => "00000000", in2(7 downto 0) => "00000000", in3(7 downto 4) => "0000", in3(3 downto 0) => "0000", in4(1 downto 1) => "0", in4(0 downto 0) => "0", sel_LOAD(1 downto 1) => "0", sel_LOAD(0 downto 0) => "0", sel_STORE(1 downto 1) => "0", sel_STORE(0 downto 0) => "0", S_oe_ram => S_oe_ram, S_we_ram => S_we_ram, S_addr_ram => S_addr_ram, S_Wdata_ram => S_Wdata_ram, Sin_Rdata_ram => Sin_Rdata_ram, S_data_ram_size => S_data_ram_size, Sin_DataRdy => Sin_DataRdy, proxy_in1 => \sig_out_vector_bus_mergerproxy_in17_\, proxy_in2 => \sig_out_vector_bus_mergerproxy_in28_\, proxy_in3 => \sig_out_vector_bus_mergerproxy_in39_\, proxy_sel_LOAD => \sig_out_vector_bus_mergerproxy_sel_LOAD10_\, proxy_sel_STORE => \sig_out_vector_bus_mergerproxy_sel_STORE11_\);
  \bus_mergerSout_DataRdy0_\ : bus_merger generic map(BITSIZE_in1=>2, PORTSIZE_in1=>4, BITSIZE_out1=>2) port map (out1 => \sig_out_bus_mergerSout_DataRdy0_\, in1(7 downto 6) => sig_in_bus_mergerSout_DataRdy0_3, in1(5 downto 4) => sig_in_bus_mergerSout_DataRdy0_2, in1(3 downto 2) => sig_in_bus_mergerSout_DataRdy0_1, in1(1 downto 0) => sig_in_bus_mergerSout_DataRdy0_0);
  \bus_mergerSout_Rdata_ram1_\ : bus_merger generic map(BITSIZE_in1=>16, PORTSIZE_in1=>4, BITSIZE_out1=>16) port map (out1 => \sig_out_bus_mergerSout_Rdata_ram1_\, in1(63 downto 48) => sig_in_bus_mergerSout_Rdata_ram1_3, in1(47 downto 32) => sig_in_bus_mergerSout_Rdata_ram1_2, in1(31 downto 16) => sig_in_bus_mergerSout_Rdata_ram1_1, in1(15 downto 0) => sig_in_bus_mergerSout_Rdata_ram1_0);
  \bus_mergerproxy_in12_\ : bus_merger generic map(BITSIZE_in1=>16, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => \sig_out_bus_mergerproxy_in12_\, in1(31 downto 16) => sig_in_bus_mergerproxy_in12_1, in1(15 downto 0) => sig_in_bus_mergerproxy_in12_0);
  \bus_mergerproxy_in17_\ : bus_merger generic map(BITSIZE_in1=>16, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => \sig_out_bus_mergerproxy_in17_\, in1(31 downto 16) => sig_in_bus_mergerproxy_in17_1, in1(15 downto 0) => sig_in_bus_mergerproxy_in17_0);
  \bus_mergerproxy_in23_\ : bus_merger generic map(BITSIZE_in1=>16, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => \sig_out_bus_mergerproxy_in23_\, in1(31 downto 16) => sig_in_bus_mergerproxy_in23_1, in1(15 downto 0) => sig_in_bus_mergerproxy_in23_0);
  \bus_mergerproxy_in28_\ : bus_merger generic map(BITSIZE_in1=>16, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => \sig_out_bus_mergerproxy_in28_\, in1(31 downto 16) => sig_in_bus_mergerproxy_in28_1, in1(15 downto 0) => sig_in_bus_mergerproxy_in28_0);
  \bus_mergerproxy_in34_\ : bus_merger generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_out1=>8) port map (out1 => \sig_out_bus_mergerproxy_in34_\, in1(15 downto 8) => sig_in_bus_mergerproxy_in34_1, in1(7 downto 0) => sig_in_bus_mergerproxy_in34_0);
  \bus_mergerproxy_in39_\ : bus_merger generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_out1=>8) port map (out1 => \sig_out_bus_mergerproxy_in39_\, in1(15 downto 8) => sig_in_bus_mergerproxy_in39_1, in1(7 downto 0) => sig_in_bus_mergerproxy_in39_0);
  \bus_mergerproxy_sel_LOAD10_\ : bus_merger generic map(BITSIZE_in1=>2, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => \sig_out_bus_mergerproxy_sel_LOAD10_\, in1(3 downto 2) => sig_in_bus_mergerproxy_sel_LOAD10_1, in1(1 downto 0) => sig_in_bus_mergerproxy_sel_LOAD10_0);
  \bus_mergerproxy_sel_LOAD5_\ : bus_merger generic map(BITSIZE_in1=>2, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => \sig_out_bus_mergerproxy_sel_LOAD5_\, in1(3 downto 2) => sig_in_bus_mergerproxy_sel_LOAD5_1, in1(1 downto 0) => sig_in_bus_mergerproxy_sel_LOAD5_0);
  \bus_mergerproxy_sel_STORE11_\ : bus_merger generic map(BITSIZE_in1=>2, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => \sig_out_bus_mergerproxy_sel_STORE11_\, in1(3 downto 2) => sig_in_bus_mergerproxy_sel_STORE11_1, in1(1 downto 0) => sig_in_bus_mergerproxy_sel_STORE11_0);
  \bus_mergerproxy_sel_STORE6_\ : bus_merger generic map(BITSIZE_in1=>2, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => \sig_out_bus_mergerproxy_sel_STORE6_\, in1(3 downto 2) => sig_in_bus_mergerproxy_sel_STORE6_1, in1(1 downto 0) => sig_in_bus_mergerproxy_sel_STORE6_0);
  const_0 : constant_value generic map(BITSIZE_out1=>2, value=>"10") port map (out1 => out_const_0);
  const_1 : constant_value generic map(BITSIZE_out1=>3, value=>"101") port map (out1 => out_const_1);
  const_2 : constant_value generic map(BITSIZE_out1=>8, value=> std_logic_vector(to_unsigned(MEM_var_28868_28878, 8))) port map (out1 => out_const_2);
  conv_out_const_0_2_8 : UUdata_converter_FU generic map(BITSIZE_in1=>2, BITSIZE_out1=>8) port map (out1 => out_conv_out_const_0_2_8, in1 => out_const_0);
  conv_out_const_1_3_8 : UUdata_converter_FU generic map(BITSIZE_in1=>3, BITSIZE_out1=>8) port map (out1 => out_conv_out_const_1_3_8, in1 => out_const_1);
  conv_out_const_2_8_32 : UUdata_converter_FU generic map(BITSIZE_in1=>8, BITSIZE_out1=>32) port map (out1 => out_conv_out_const_2_8_32, in1 => out_const_2);
  conv_out_reg_0_reg_0_1_32 : UUdata_converter_FU generic map(BITSIZE_in1=>1, BITSIZE_out1=>32) port map (out1 => out_conv_out_reg_0_reg_0_1_32, in1 => out_reg_0_reg_0);
  fu_main_28878_29386 : make_oriented generic map(MEM_var_28859_28870=>(MEM_var_28859_28870), MEM_var_28861_28878=>(MEM_var_28861_28878), MEM_var_28868_28878=>(MEM_var_28868_28878)) port map (done_port => s_done_fu_main_28878_29386, Sout_Rdata_ram => sig_in_vector_bus_mergerSout_Rdata_ram1_3, Sout_DataRdy => sig_in_vector_bus_mergerSout_DataRdy0_3, proxy_in1_28861 => sig_in_vector_bus_mergerproxy_in12_1, proxy_in2_28861 => sig_in_vector_bus_mergerproxy_in23_1, proxy_in3_28861 => sig_in_vector_bus_mergerproxy_in34_1, proxy_sel_LOAD_28861 => sig_in_vector_bus_mergerproxy_sel_LOAD5_1, proxy_sel_STORE_28861 => sig_in_vector_bus_mergerproxy_sel_STORE6_1, proxy_in1_28868 => sig_in_vector_bus_mergerproxy_in17_1, proxy_in2_28868 => sig_in_vector_bus_mergerproxy_in28_1, proxy_in3_28868 => sig_in_vector_bus_mergerproxy_in39_1, proxy_sel_LOAD_28868 => sig_in_vector_bus_mergerproxy_sel_LOAD10_1, proxy_sel_STORE_28868 => sig_in_vector_bus_mergerproxy_sel_STORE11_1, clock => clock, reset => reset, start_port => selector_IN_UNBOUNDED_main_28878_29386, S_oe_ram => S_oe_ram, S_we_ram => S_we_ram, S_addr_ram => S_addr_ram, S_Wdata_ram => S_Wdata_ram, S_data_ram_size => S_data_ram_size, Sin_Rdata_ram => Sin_Rdata_ram, Sin_DataRdy => Sin_DataRdy, proxy_out1_28861 => proxy_out1_28861, proxy_out1_28868 => proxy_out1_28868);
  fu_main_28878_29387 : astar generic map(MEM_var_28861_28878=>(MEM_var_28861_28878), MEM_var_28864_28877=>(MEM_var_28864_28877), MEM_var_28866_28877=>(MEM_var_28866_28877), MEM_var_28867_28877=>(MEM_var_28867_28877), MEM_var_28868_28878=>(MEM_var_28868_28878)) port map (done_port => s_done_fu_main_28878_29387, Sout_Rdata_ram => sig_in_vector_bus_mergerSout_Rdata_ram1_2, Sout_DataRdy => sig_in_vector_bus_mergerSout_DataRdy0_2, proxy_in1_28861 => sig_in_vector_bus_mergerproxy_in12_0, proxy_in2_28861 => sig_in_vector_bus_mergerproxy_in23_0, proxy_in3_28861 => sig_in_vector_bus_mergerproxy_in34_0, proxy_sel_LOAD_28861 => sig_in_vector_bus_mergerproxy_sel_LOAD5_0, proxy_sel_STORE_28861 => sig_in_vector_bus_mergerproxy_sel_STORE6_0, proxy_in1_28868 => sig_in_vector_bus_mergerproxy_in17_0, proxy_in2_28868 => sig_in_vector_bus_mergerproxy_in28_0, proxy_in3_28868 => sig_in_vector_bus_mergerproxy_in39_0, proxy_sel_LOAD_28868 => sig_in_vector_bus_mergerproxy_sel_LOAD10_0, proxy_sel_STORE_28868 => sig_in_vector_bus_mergerproxy_sel_STORE11_0, clock => clock, reset => reset, start_port => selector_IN_UNBOUNDED_main_28878_29387, size => unsigned(out_conv_out_const_0_2_8), a => out_conv_out_reg_0_reg_0_1_32, goal => unsigned(out_conv_out_const_1_3_8), S_oe_ram => S_oe_ram, S_we_ram => S_we_ram, S_addr_ram => S_addr_ram, S_Wdata_ram => S_Wdata_ram, S_data_ram_size => S_data_ram_size, Sin_Rdata_ram => Sin_Rdata_ram, Sin_DataRdy => Sin_DataRdy, proxy_out1_28861 => proxy_out1_28861, proxy_out1_28868 => proxy_out1_28868);
  fu_main_28878_29602 : addr_expr_FU generic map(BITSIZE_in1=>32, BITSIZE_out1=>1) port map (out1 => out_addr_expr_FU_4_i0_fu_main_28878_29602, in1 => out_conv_out_const_2_8_32);
  fu_main_28878_29720 : UUdata_converter_FU generic map(BITSIZE_in1=>1, BITSIZE_out1=>1) port map (out1 => out_UUdata_converter_FU_5_i0_fu_main_28878_29720, in1 => out_addr_expr_FU_4_i0_fu_main_28878_29602);
  join_signalbus_mergerSout_DataRdy0_0 : join_signal generic map(BITSIZE_in1=>1, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => sig_in_bus_mergerSout_DataRdy0_0, in1 => sig_in_vector_bus_mergerSout_DataRdy0_0);
  join_signalbus_mergerSout_DataRdy0_1 : join_signal generic map(BITSIZE_in1=>1, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => sig_in_bus_mergerSout_DataRdy0_1, in1 => sig_in_vector_bus_mergerSout_DataRdy0_1);
  join_signalbus_mergerSout_DataRdy0_2 : join_signal generic map(BITSIZE_in1=>1, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => sig_in_bus_mergerSout_DataRdy0_2, in1 => sig_in_vector_bus_mergerSout_DataRdy0_2);
  join_signalbus_mergerSout_DataRdy0_3 : join_signal generic map(BITSIZE_in1=>1, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => sig_in_bus_mergerSout_DataRdy0_3, in1 => sig_in_vector_bus_mergerSout_DataRdy0_3);
  join_signalbus_mergerSout_Rdata_ram1_0 : join_signal generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => sig_in_bus_mergerSout_Rdata_ram1_0, in1 => sig_in_vector_bus_mergerSout_Rdata_ram1_0);
  join_signalbus_mergerSout_Rdata_ram1_1 : join_signal generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => sig_in_bus_mergerSout_Rdata_ram1_1, in1 => sig_in_vector_bus_mergerSout_Rdata_ram1_1);
  join_signalbus_mergerSout_Rdata_ram1_2 : join_signal generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => sig_in_bus_mergerSout_Rdata_ram1_2, in1 => sig_in_vector_bus_mergerSout_Rdata_ram1_2);
  join_signalbus_mergerSout_Rdata_ram1_3 : join_signal generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => sig_in_bus_mergerSout_Rdata_ram1_3, in1 => sig_in_vector_bus_mergerSout_Rdata_ram1_3);
  join_signalbus_mergerproxy_in12_0 : join_signal generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => sig_in_bus_mergerproxy_in12_0, in1 => sig_in_vector_bus_mergerproxy_in12_0);
  join_signalbus_mergerproxy_in12_1 : join_signal generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => sig_in_bus_mergerproxy_in12_1, in1 => sig_in_vector_bus_mergerproxy_in12_1);
  join_signalbus_mergerproxy_in17_0 : join_signal generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => sig_in_bus_mergerproxy_in17_0, in1 => sig_in_vector_bus_mergerproxy_in17_0);
  join_signalbus_mergerproxy_in17_1 : join_signal generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => sig_in_bus_mergerproxy_in17_1, in1 => sig_in_vector_bus_mergerproxy_in17_1);
  join_signalbus_mergerproxy_in23_0 : join_signal generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => sig_in_bus_mergerproxy_in23_0, in1 => sig_in_vector_bus_mergerproxy_in23_0);
  join_signalbus_mergerproxy_in23_1 : join_signal generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => sig_in_bus_mergerproxy_in23_1, in1 => sig_in_vector_bus_mergerproxy_in23_1);
  join_signalbus_mergerproxy_in28_0 : join_signal generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => sig_in_bus_mergerproxy_in28_0, in1 => sig_in_vector_bus_mergerproxy_in28_0);
  join_signalbus_mergerproxy_in28_1 : join_signal generic map(BITSIZE_in1=>8, PORTSIZE_in1=>2, BITSIZE_out1=>16) port map (out1 => sig_in_bus_mergerproxy_in28_1, in1 => sig_in_vector_bus_mergerproxy_in28_1);
  join_signalbus_mergerproxy_in34_0 : join_signal generic map(BITSIZE_in1=>4, PORTSIZE_in1=>2, BITSIZE_out1=>8) port map (out1 => sig_in_bus_mergerproxy_in34_0, in1 => sig_in_vector_bus_mergerproxy_in34_0);
  join_signalbus_mergerproxy_in34_1 : join_signal generic map(BITSIZE_in1=>4, PORTSIZE_in1=>2, BITSIZE_out1=>8) port map (out1 => sig_in_bus_mergerproxy_in34_1, in1 => sig_in_vector_bus_mergerproxy_in34_1);
  join_signalbus_mergerproxy_in39_0 : join_signal generic map(BITSIZE_in1=>4, PORTSIZE_in1=>2, BITSIZE_out1=>8) port map (out1 => sig_in_bus_mergerproxy_in39_0, in1 => sig_in_vector_bus_mergerproxy_in39_0);
  join_signalbus_mergerproxy_in39_1 : join_signal generic map(BITSIZE_in1=>4, PORTSIZE_in1=>2, BITSIZE_out1=>8) port map (out1 => sig_in_bus_mergerproxy_in39_1, in1 => sig_in_vector_bus_mergerproxy_in39_1);
  join_signalbus_mergerproxy_sel_LOAD10_0 : join_signal generic map(BITSIZE_in1=>1, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => sig_in_bus_mergerproxy_sel_LOAD10_0, in1 => sig_in_vector_bus_mergerproxy_sel_LOAD10_0);
  join_signalbus_mergerproxy_sel_LOAD10_1 : join_signal generic map(BITSIZE_in1=>1, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => sig_in_bus_mergerproxy_sel_LOAD10_1, in1 => sig_in_vector_bus_mergerproxy_sel_LOAD10_1);
  join_signalbus_mergerproxy_sel_LOAD5_0 : join_signal generic map(BITSIZE_in1=>1, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => sig_in_bus_mergerproxy_sel_LOAD5_0, in1 => sig_in_vector_bus_mergerproxy_sel_LOAD5_0);
  join_signalbus_mergerproxy_sel_LOAD5_1 : join_signal generic map(BITSIZE_in1=>1, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => sig_in_bus_mergerproxy_sel_LOAD5_1, in1 => sig_in_vector_bus_mergerproxy_sel_LOAD5_1);
  join_signalbus_mergerproxy_sel_STORE11_0 : join_signal generic map(BITSIZE_in1=>1, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => sig_in_bus_mergerproxy_sel_STORE11_0, in1 => sig_in_vector_bus_mergerproxy_sel_STORE11_0);
  join_signalbus_mergerproxy_sel_STORE11_1 : join_signal generic map(BITSIZE_in1=>1, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => sig_in_bus_mergerproxy_sel_STORE11_1, in1 => sig_in_vector_bus_mergerproxy_sel_STORE11_1);
  join_signalbus_mergerproxy_sel_STORE6_0 : join_signal generic map(BITSIZE_in1=>1, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => sig_in_bus_mergerproxy_sel_STORE6_0, in1 => sig_in_vector_bus_mergerproxy_sel_STORE6_0);
  join_signalbus_mergerproxy_sel_STORE6_1 : join_signal generic map(BITSIZE_in1=>1, PORTSIZE_in1=>2, BITSIZE_out1=>2) port map (out1 => sig_in_bus_mergerproxy_sel_STORE6_1, in1 => sig_in_vector_bus_mergerproxy_sel_STORE6_1);
  reg_0 : register_SE generic map(BITSIZE_in1=>1, BITSIZE_out1=>1) port map (out1 => out_reg_0_reg_0, clock => clock, reset => reset, in1 => out_UUdata_converter_FU_5_i0_fu_main_28878_29720, wenable => wrenable_reg_0);
  \split_signalbus_mergerSout_DataRdy0_\ : split_signal generic map(BITSIZE_in1=>2, BITSIZE_out1=>1, PORTSIZE_out1=>2) port map (out1 => Sout_DataRdy, in1 => \sig_out_bus_mergerSout_DataRdy0_\);
  \split_signalbus_mergerSout_Rdata_ram1_\ : split_signal generic map(BITSIZE_in1=>16, BITSIZE_out1=>8, PORTSIZE_out1=>2) port map (out1 => Sout_Rdata_ram, in1 => \sig_out_bus_mergerSout_Rdata_ram1_\);
  \split_signalbus_mergerproxy_in12_\ : split_signal generic map(BITSIZE_in1=>16, BITSIZE_out1=>8, PORTSIZE_out1=>2) port map (out1 => \sig_out_vector_bus_mergerproxy_in12_\, in1 => \sig_out_bus_mergerproxy_in12_\);
  \split_signalbus_mergerproxy_in17_\ : split_signal generic map(BITSIZE_in1=>16, BITSIZE_out1=>8, PORTSIZE_out1=>2) port map (out1 => \sig_out_vector_bus_mergerproxy_in17_\, in1 => \sig_out_bus_mergerproxy_in17_\);
  \split_signalbus_mergerproxy_in23_\ : split_signal generic map(BITSIZE_in1=>16, BITSIZE_out1=>8, PORTSIZE_out1=>2) port map (out1 => \sig_out_vector_bus_mergerproxy_in23_\, in1 => \sig_out_bus_mergerproxy_in23_\);
  \split_signalbus_mergerproxy_in28_\ : split_signal generic map(BITSIZE_in1=>16, BITSIZE_out1=>8, PORTSIZE_out1=>2) port map (out1 => \sig_out_vector_bus_mergerproxy_in28_\, in1 => \sig_out_bus_mergerproxy_in28_\);
  \split_signalbus_mergerproxy_in34_\ : split_signal generic map(BITSIZE_in1=>8, BITSIZE_out1=>4, PORTSIZE_out1=>2) port map (out1 => \sig_out_vector_bus_mergerproxy_in34_\, in1 => \sig_out_bus_mergerproxy_in34_\);
  \split_signalbus_mergerproxy_in39_\ : split_signal generic map(BITSIZE_in1=>8, BITSIZE_out1=>4, PORTSIZE_out1=>2) port map (out1 => \sig_out_vector_bus_mergerproxy_in39_\, in1 => \sig_out_bus_mergerproxy_in39_\);
  \split_signalbus_mergerproxy_sel_LOAD10_\ : split_signal generic map(BITSIZE_in1=>2, BITSIZE_out1=>1, PORTSIZE_out1=>2) port map (out1 => \sig_out_vector_bus_mergerproxy_sel_LOAD10_\, in1 => \sig_out_bus_mergerproxy_sel_LOAD10_\);
  \split_signalbus_mergerproxy_sel_LOAD5_\ : split_signal generic map(BITSIZE_in1=>2, BITSIZE_out1=>1, PORTSIZE_out1=>2) port map (out1 => \sig_out_vector_bus_mergerproxy_sel_LOAD5_\, in1 => \sig_out_bus_mergerproxy_sel_LOAD5_\);
  \split_signalbus_mergerproxy_sel_STORE11_\ : split_signal generic map(BITSIZE_in1=>2, BITSIZE_out1=>1, PORTSIZE_out1=>2) port map (out1 => \sig_out_vector_bus_mergerproxy_sel_STORE11_\, in1 => \sig_out_bus_mergerproxy_sel_STORE11_\);
  \split_signalbus_mergerproxy_sel_STORE6_\ : split_signal generic map(BITSIZE_in1=>2, BITSIZE_out1=>1, PORTSIZE_out1=>2) port map (out1 => \sig_out_vector_bus_mergerproxy_sel_STORE6_\, in1 => \sig_out_bus_mergerproxy_sel_STORE6_\);
  -- io-signal post fix
  OUT_UNBOUNDED_main_28878_29386 <= s_done_fu_main_28878_29386;
  OUT_UNBOUNDED_main_28878_29387 <= s_done_fu_main_28878_29387;

end datapath_main_arch;

-- FSM based controller description for main
-- This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
-- Author(s): Component automatically generated by bambu
-- License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity controller_main is 
port (
  -- IN
  OUT_UNBOUNDED_main_28878_29386 : in std_logic;
  OUT_UNBOUNDED_main_28878_29387 : in std_logic;
  clock : in std_logic;
  reset : in std_logic;
  start_port : in std_logic;
  -- OUT
  done_port : out std_logic;
  selector_IN_UNBOUNDED_main_28878_29386 : out std_logic;
  selector_IN_UNBOUNDED_main_28878_29387 : out std_logic;
  wrenable_reg_0 : out std_logic

);
end controller_main;

architecture controller_main_arch of controller_main is
  -- define the states of FSM model
  constant S_0: std_logic_vector(4 downto 0) := "00001";
  constant S_1: std_logic_vector(4 downto 0) := "00010";
  constant S_2: std_logic_vector(4 downto 0) := "00100";
  constant S_3: std_logic_vector(4 downto 0) := "01000";
  constant S_4: std_logic_vector(4 downto 0) := "10000";
  signal present_state, next_state : std_logic_vector(4 downto 0);
begin
  -- concurrent process#1: state registers
  state_reg: process(clock)
  begin
    if (clock'event and clock='1') then
      if (reset='0') then
        present_state <= S_0;
      else
        present_state <= next_state;
      end if;
    end if;
  end process;
  -- concurrent process#0: combinational logic
  comb_logic0: process(present_state, OUT_UNBOUNDED_main_28878_29386, OUT_UNBOUNDED_main_28878_29387, start_port)
  begin
    done_port <= '0';
    selector_IN_UNBOUNDED_main_28878_29386 <= '0';
    selector_IN_UNBOUNDED_main_28878_29387 <= '0';
    wrenable_reg_0 <= '0';
    next_state <= S_0;
    case present_state is
      when S_0 =>
        if(start_port /= '1') then
          wrenable_reg_0 <= 'X';
          next_state <= S_0;
        else
          selector_IN_UNBOUNDED_main_28878_29386 <= '1';
          wrenable_reg_0 <= '1';
          if (OUT_UNBOUNDED_main_28878_29386 = '0') then
            next_state <= S_1;
          else
            next_state <= S_2;
          end if;
        end if;
      when S_1 =>
        if (OUT_UNBOUNDED_main_28878_29386 = '0') then
          next_state <= S_1;
        else
          next_state <= S_2;
        end if;
      when S_2 =>
        selector_IN_UNBOUNDED_main_28878_29387 <= '1';
        if (OUT_UNBOUNDED_main_28878_29387 = '0') then
          next_state <= S_3;
        else
          next_state <= S_4;
          done_port <= '1';
        end if;
      when S_3 =>
        if (OUT_UNBOUNDED_main_28878_29387 = '0') then
          next_state <= S_3;
        else
          next_state <= S_4;
          done_port <= '1';
        end if;
      when S_4 =>
        next_state <= S_0;
      when others =>
        wrenable_reg_0 <= 'X';
    end case;
  end process;

end controller_main_arch;

-- Top component for main
-- This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
-- Author(s): Component automatically generated by bambu
-- License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity \_main\ is 
generic(
  MEM_var_28859_28870: integer := 96;
  MEM_var_28861_28878: integer := 32;
  MEM_var_28864_28877: integer := 128;
  MEM_var_28866_28877: integer := 160;
  MEM_var_28867_28877: integer := 192;
  MEM_var_28868_28878: integer := 64);
port (
  -- IN
  clock : in std_logic;
  reset : in std_logic;
  start_port : in std_logic;
  S_oe_ram : in std_logic_vector (1 downto 0);
  S_we_ram : in std_logic_vector (1 downto 0);
  S_addr_ram : in std_logic_vector(15 downto 0) ;
  S_Wdata_ram : in std_logic_vector(15 downto 0) ;
  S_data_ram_size : in std_logic_vector(7 downto 0) ;
  Sin_Rdata_ram : in std_logic_vector(15 downto 0) ;
  Sin_DataRdy : in std_logic_vector (1 downto 0);
  -- OUT
  done_port : out std_logic;
  Sout_Rdata_ram : out std_logic_vector(15 downto 0) ;
  Sout_DataRdy : out std_logic_vector (1 downto 0)

);
end \_main\;

architecture \_main_arch\ of \_main\ is
  -- Component and signal declarations
  
  component datapath_main
  generic(
    MEM_var_28859_28870: integer := 96;
    MEM_var_28861_28878: integer := 32;
    MEM_var_28864_28877: integer := 128;
    MEM_var_28866_28877: integer := 160;
    MEM_var_28867_28877: integer := 192;
    MEM_var_28868_28878: integer := 64);
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    S_oe_ram : in std_logic_vector (1 downto 0);
    S_we_ram : in std_logic_vector (1 downto 0);
    S_addr_ram : in std_logic_vector(15 downto 0) ;
    S_Wdata_ram : in std_logic_vector(15 downto 0) ;
    S_data_ram_size : in std_logic_vector(7 downto 0) ;
    Sin_Rdata_ram : in std_logic_vector(15 downto 0) ;
    Sin_DataRdy : in std_logic_vector (1 downto 0);
    selector_IN_UNBOUNDED_main_28878_29386 : in std_logic;
    selector_IN_UNBOUNDED_main_28878_29387 : in std_logic;
    wrenable_reg_0 : in std_logic;
    -- OUT
    Sout_Rdata_ram : out std_logic_vector(15 downto 0) ;
    Sout_DataRdy : out std_logic_vector (1 downto 0);
    OUT_UNBOUNDED_main_28878_29386 : out std_logic;
    OUT_UNBOUNDED_main_28878_29387 : out std_logic
  
  );
  end component;
  
  component controller_main
  port (
    -- IN
    OUT_UNBOUNDED_main_28878_29386 : in std_logic;
    OUT_UNBOUNDED_main_28878_29387 : in std_logic;
    clock : in std_logic;
    reset : in std_logic;
    start_port : in std_logic;
    -- OUT
    done_port : out std_logic;
    selector_IN_UNBOUNDED_main_28878_29386 : out std_logic;
    selector_IN_UNBOUNDED_main_28878_29387 : out std_logic;
    wrenable_reg_0 : out std_logic
  
  );
  end component;
  
  component flipflop_AR
  generic(
   BITSIZE_in1: integer;
   BITSIZE_out1: integer);
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    in1 : in std_logic;
    -- OUT
    out1 : out std_logic
  
  );
  end component;
  signal OUT_UNBOUNDED_main_28878_29386 : std_logic;
  signal OUT_UNBOUNDED_main_28878_29387 : std_logic;
  signal done_delayed_REG_signal_in : std_logic;
  signal done_delayed_REG_signal_out : std_logic;
  signal selector_IN_UNBOUNDED_main_28878_29386 : std_logic;
  signal selector_IN_UNBOUNDED_main_28878_29387 : std_logic;
  signal wrenable_reg_0 : std_logic;
begin
  Controller_i : controller_main port map (done_port => done_delayed_REG_signal_in, selector_IN_UNBOUNDED_main_28878_29386 => selector_IN_UNBOUNDED_main_28878_29386, selector_IN_UNBOUNDED_main_28878_29387 => selector_IN_UNBOUNDED_main_28878_29387, wrenable_reg_0 => wrenable_reg_0, OUT_UNBOUNDED_main_28878_29386 => OUT_UNBOUNDED_main_28878_29386, OUT_UNBOUNDED_main_28878_29387 => OUT_UNBOUNDED_main_28878_29387, clock => clock, reset => reset, start_port => start_port);
  Datapath_i : datapath_main generic map(MEM_var_28859_28870=>(MEM_var_28859_28870), MEM_var_28861_28878=>(MEM_var_28861_28878), MEM_var_28864_28877=>(MEM_var_28864_28877), MEM_var_28866_28877=>(MEM_var_28866_28877), MEM_var_28867_28877=>(MEM_var_28867_28877), MEM_var_28868_28878=>(MEM_var_28868_28878)) port map (Sout_Rdata_ram => Sout_Rdata_ram, Sout_DataRdy => Sout_DataRdy, OUT_UNBOUNDED_main_28878_29386 => OUT_UNBOUNDED_main_28878_29386, OUT_UNBOUNDED_main_28878_29387 => OUT_UNBOUNDED_main_28878_29387, clock => clock, reset => reset, S_oe_ram => S_oe_ram, S_we_ram => S_we_ram, S_addr_ram => S_addr_ram, S_Wdata_ram => S_Wdata_ram, S_data_ram_size => S_data_ram_size, Sin_Rdata_ram => Sin_Rdata_ram, Sin_DataRdy => Sin_DataRdy, selector_IN_UNBOUNDED_main_28878_29386 => selector_IN_UNBOUNDED_main_28878_29386, selector_IN_UNBOUNDED_main_28878_29387 => selector_IN_UNBOUNDED_main_28878_29387, wrenable_reg_0 => wrenable_reg_0);
  done_delayed_REG : flipflop_AR generic map(BITSIZE_in1=>1, BITSIZE_out1=>1) port map (out1 => done_delayed_REG_signal_out, clock => clock, reset => reset, in1 => done_delayed_REG_signal_in);
  -- io-signal post fix
  done_port <= done_delayed_REG_signal_out;

end \_main_arch\;

-- Minimal interface for function: main
-- This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
-- Author(s): Component automatically generated by bambu
-- License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;
use STD.textio.all;
use IEEE.std_logic_textio.all;
-- synthesis translate_off
use STD.env.all;
-- synthesis translate_on
use work.panda_pkg.all;
entity main is 
generic(
  MEM_var_28859_28870: integer := 96;
  MEM_var_28861_28878: integer := 32;
  MEM_var_28864_28877: integer := 128;
  MEM_var_28866_28877: integer := 160;
  MEM_var_28867_28877: integer := 192;
  MEM_var_28868_28878: integer := 64);
port (
  -- IN
  clock : in std_logic;
  reset : in std_logic;
  start_port : in std_logic;
  S_oe_ram : in std_logic_vector (1 downto 0);
  S_we_ram : in std_logic_vector (1 downto 0);
  S_addr_ram : in std_logic_vector(15 downto 0) ;
  S_Wdata_ram : in std_logic_vector(15 downto 0) ;
  S_data_ram_size : in std_logic_vector(7 downto 0) ;
  -- OUT
  done_port : out std_logic;
  Sout_Rdata_ram : out std_logic_vector(15 downto 0) ;
  Sout_DataRdy : out std_logic_vector (1 downto 0)

);
end main;

architecture main_arch of main is
  -- Component and signal declarations
  
  component \_main\
  generic(
    MEM_var_28859_28870: integer := 96;
    MEM_var_28861_28878: integer := 32;
    MEM_var_28864_28877: integer := 128;
    MEM_var_28866_28877: integer := 160;
    MEM_var_28867_28877: integer := 192;
    MEM_var_28868_28878: integer := 64);
  port (
    -- IN
    clock : in std_logic;
    reset : in std_logic;
    start_port : in std_logic;
    S_oe_ram : in std_logic_vector (1 downto 0);
    S_we_ram : in std_logic_vector (1 downto 0);
    S_addr_ram : in std_logic_vector(15 downto 0) ;
    S_Wdata_ram : in std_logic_vector(15 downto 0) ;
    S_data_ram_size : in std_logic_vector(7 downto 0) ;
    Sin_Rdata_ram : in std_logic_vector(15 downto 0) ;
    Sin_DataRdy : in std_logic_vector (1 downto 0);
    -- OUT
    done_port : out std_logic;
    Sout_Rdata_ram : out std_logic_vector(15 downto 0) ;
    Sout_DataRdy : out std_logic_vector (1 downto 0)
  
  );
  end component;
begin
  \_main_i0\ : \_main\ generic map(MEM_var_28859_28870=>(MEM_var_28859_28870), MEM_var_28861_28878=>(MEM_var_28861_28878), MEM_var_28864_28877=>(MEM_var_28864_28877), MEM_var_28866_28877=>(MEM_var_28866_28877), MEM_var_28867_28877=>(MEM_var_28867_28877), MEM_var_28868_28878=>(MEM_var_28868_28878)) port map (done_port => done_port, Sout_Rdata_ram => Sout_Rdata_ram, Sout_DataRdy => Sout_DataRdy, clock => clock, reset => reset, start_port => start_port, S_oe_ram => S_oe_ram, S_we_ram => S_we_ram, S_addr_ram => S_addr_ram, S_Wdata_ram => S_Wdata_ram, S_data_ram_size => S_data_ram_size, Sin_Rdata_ram(15 downto 8) => "00000000", Sin_Rdata_ram(7 downto 0) => "00000000", Sin_DataRdy(1) => '0', Sin_DataRdy(0) => '0');

end main_arch;


