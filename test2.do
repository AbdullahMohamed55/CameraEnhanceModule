vsim work.bmwn

add wave -position insertpoint  \
sim:/bmwn/clk \
sim:/bmwn/rst \
sim:/bmwn/start \
sim:/bmwn/movedone \
sim:/bmwn/focaddress \
sim:/bmwn/done \
sim:/bmwn/direction \
sim:/bmwn/move \
sim:/bmwn/nvmdataout \
sim:/bmwn/bmnvmaddress \
sim:/bmwn/bmpm/memnvmreadaddr \
sim:/bmwn/bmpm/memdataout \
sim:/bmwn/bmpm/memreaddone \
sim:/bmwn/bmpm/strt \
sim:/bmwn/bmpm/afpm/clk \
sim:/bmwn/bmpm/afpm/rst \
sim:/bmwn/bmpm/afpm/dataIn \
sim:/bmwn/bmpm/afpm/addr \
sim:/bmwn/bmpm/afpm/regreset \
sim:/bmwn/bmpm/afpm/myvalid/addr \
sim:/bmwn/bmpm/afpm/myvalid/cnt \
sim:/bmwn/bmpm/afpm/myvalid/out_fsm \
sim:/bmwn/bmpm/mmpm/clk \
sim:/bmwn/bmpm/mmpm/rst \
sim:/bmwn/bmpm/mmpm/CacheAddr \
sim:/bmwn/bmpm/mmpm/TopLeftAddr \
sim:/bmwn/bmpm/mmpm/MoveDone \
sim:/bmwn/bmpm/mmpm/nvmDataIn \
sim:/bmwn/bmpm/mmpm/nvmReadAddr \
sim:/bmwn/bmpm/mmpm/ReadDone \
sim:/bmwn/bmpm/mmpm/dma_nvmreadaddress \
sim:/bmwn/bmpm/mmpm/dma_cachewriteaddress \
sim:/bmwn/bmpm/mmpm/dma_readdone \

add wave -position insertpoint  \
sim:/bmwn/bmpm/afpm/my256/en \
sim:/bmwn/bmpm/afpm/my256/clr \
sim:/bmwn/bmpm/afpm/my256/clk \
sim:/bmwn/bmpm/afpm/c256enabler \
sim:/bmwn/bmpm/afpm/my256/q \
sim:/bmwn/bmpm/afpm/my9/q \
sim:/bmwn/bmpm/afpm/activate \
sim:/bmwn/bmpm/afpm/readDone \
sim:/bmwn/bmpm/afpm/direction \
sim:/bmwn/bmpm/afpm/Move \
sim:/bmwn/bmpm/afpm/FocusAddr \
sim:/bmwn/bmpm/afpm/Start \
sim:/bmwn/bmpm/afpm/main_px_data \
sim:/bmwn/bmpm/afpm/out_Addr \
sim:/bmwn/bmpm/mmpm/DataOut \
sim:/bmwn/bmpm/afpm/move_algo \
sim:/bmwn/bmpm/afpm/dir_algo \
sim:/bmwn/bmpm/afpm/done_algo \
sim:/bmwn/bmpm/afpm/Done \
sim:/bmwn/bmpm/afpm/result \
sim:/bmwn/bmpm/afpm/myalgo/lastResult 


force -freeze sim:/bmwn/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/bmwn/rst 1 0
force -freeze sim:/bmwn/start 0 0
force -freeze sim:/bmwn/movedone 0 0
force -freeze sim:/bmwn/focaddress 10'd0 0
run



mem load -i /home/adeladham/intelFPGA/CameraEnhanceModule/hi2.mem /bmwn/nvmpm/DATAMEMORY

force -freeze sim:/bmwn/rst 0 0
force -freeze sim:/bmwn/start 1 0
run 
force -freeze sim:/bmwn/start 0 0
run 25700
run 230400
run

force -freeze sim:/bmwn/movedone 1 0
mem load -i /home/adeladham/intelFPGA/CameraEnhanceModule/hi.mem /bmwn/nvmpm/DATAMEMORY
run 100
force -freeze sim:/bmwn/movedone 0 0

run 25700
run 230400
run

force -freeze sim:/bmwn/movedone 1 0
mem load -i /home/adeladham/intelFPGA/CameraEnhanceModule/hi2.mem /bmwn/nvmpm/DATAMEMORY
run
force -freeze sim:/bmwn/movedone 0 0

run 25700
run 230400
run

force -freeze sim:/bmwn/movedone 1 0
mem load -i /home/adeladham/intelFPGA/CameraEnhanceModule/hi.mem /bmwn/nvmpm/DATAMEMORY
run 100
force -freeze sim:/bmwn/movedone 0 0

run 25700
run 230400
run



