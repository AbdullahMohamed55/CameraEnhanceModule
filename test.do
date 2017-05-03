vsim work.bmwn
# vsim work.bmwn
# Start time: 23:01:11 on May 03,2017
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.bmwn(a_bmwn)
# Loading work.bigmodule(a_bm)
# Loading ieee.numeric_std(body)
# Loading work.af(af)
# Loading work.my_8subtractor(a_my_8subtractor)
# Loading work.my_adder(a_my_adder)
# Loading work.my_19adder(a_my_19adder)
# Loading ieee.std_logic_arith(body)
# Loading ieee.std_logic_unsigned(body)
# Loading work.counter256(counter256)
# Loading work.counter(counter)
# Loading work.n_reg(a_n_reg)
# Loading work.reg_19(a_reg_19)
# Loading work.add_valid(a_add_valid)
# Loading work.my_nadder(a_my_nadder)
# Loading work.my_8subtractor_noabs(a_my_8subtractor_noabs)
# Loading work.algo(algo)
# Loading work.memmod(a_memmod)
# Loading work.cache(a_cache)
# Loading work.dma(a_dma)
# Loading work.nvm(a_nvm)
add wave  \
sim:/bmwn/clk \
sim:/bmwn/rst \
sim:/bmwn/start \
sim:/bmwn/movedone \
sim:/bmwn/focaddress \
sim:/bmwn/done \
sim:/bmwn/direction \
sim:/bmwn/move \
sim:/bmwn/nvmdataout \
sim:/bmwn/bmnvmaddress
force -freeze sim:/bmwn/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/bmwn/rst 1 0
force -freeze sim:/bmwn/start 0 0
force -freeze sim:/bmwn/movedone 0 0
force -freeze sim:/bmwn/focaddress 10#0 0
run
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 0  Instance: /bmwn/nvmpm
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 0  Instance: /bmwn/bmpm/mmpm/pmcache
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 1  Instance: /bmwn/nvmpm
force -freeze sim:/bmwn/move 0 0
run
force -freeze sim:/bmwn/rst 0 0
run
mem load -i /home/abdullah/Desktop/CameraAFModule/hi.mem /bmwn/nvmpm/DATAMEMORY
