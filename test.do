vsim work.bmwn(a_bmwn)
# vsim work.bmwn(a_bmwn)
# Start time: 15:36:52 on May 04,2017
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
add wave  \
sim:/bmwn/bmpm/afpm/myalgo/en \
sim:/bmwn/bmpm/afpm/myalgo/clr \
sim:/bmwn/bmpm/afpm/myalgo/clk \
sim:/bmwn/bmpm/afpm/myalgo/result \
sim:/bmwn/bmpm/afpm/myalgo/dir \
sim:/bmwn/bmpm/afpm/myalgo/done \
sim:/bmwn/bmpm/afpm/myalgo/move \
sim:/bmwn/bmpm/afpm/myalgo/lastResult \
sim:/bmwn/bmpm/afpm/myalgo/lastmove
add wave  \
sim:/bmwn/bmpm/afpm/clk \
sim:/bmwn/bmpm/afpm/rst \
sim:/bmwn/bmpm/afpm/dataIn \
sim:/bmwn/bmpm/afpm/addr \
sim:/bmwn/bmpm/afpm/readDone \
sim:/bmwn/bmpm/afpm/direction \
sim:/bmwn/bmpm/afpm/Move \
sim:/bmwn/bmpm/afpm/FocusAddr \
sim:/bmwn/bmpm/afpm/Start \
sim:/bmwn/bmpm/afpm/Done \
sim:/bmwn/bmpm/afpm/main_px_data \
sim:/bmwn/bmpm/afpm/out_Addr \
sim:/bmwn/bmpm/afpm/activate
add wave -position insertpoint  \
sim:/bmwn/bmpm/mmpm/clk
force -freeze sim:/bmwn/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/bmwn/rst 1 0
force -freeze sim:/bmwn/start 0 0
force -freeze sim:/bmwn/movedone 0 0
force -freeze sim:/bmwn/focaddress 10'd0 0
run
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 0  Instance: /bmwn/nvmpm
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 0  Instance: /bmwn/bmpm/mmpm/pmcache
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ps  Iteration: 1  Instance: /bmwn/nvmpm
mem load -i /home/abdullah/Desktop/CameraAFModule/hi.mem /bmwn/nvmpm/DATAMEMORY
run
