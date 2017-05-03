vsim work.dma
# vsim work.dma 
# Start time: 23:53:27 on May 01,2017
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.dma(a_dma)
force -freeze sim:/dma/CLK 1 0, 0 {50 ps} -r 100
force -freeze sim:/dma/RST 1 0
force -freeze sim:/dma/ReadReq 0 0
force -freeze sim:/dma/DataIn 00000000000000010000001000000011000001000000010100000110000001110000100000001001000010100000101100001100000011010000111000001111 0
force -freeze sim:/dma/NVMTopleftPixelAddress 000000000000 0
run
force -freeze sim:/dma/RST 0 0
run
add wave  \
sim:/dma/CLK \
sim:/dma/RST \
sim:/dma/ReadReq \
sim:/dma/DataIn \
sim:/dma/NVMTopleftPixelAddress \
sim:/dma/NVMReadAddress \
sim:/dma/CacheWriteAddress \
sim:/dma/DataOut \
sim:/dma/CacheWE \
sim:/dma/ReadDone \
sim:/dma/started \
sim:/dma/p0 \
sim:/dma/p1 \
sim:/dma/p2 \
sim:/dma/p3 \
sim:/dma/p4 \
sim:/dma/p5 \
sim:/dma/p6 \
sim:/dma/p7 \
sim:/dma/p8 \
sim:/dma/p9 \
sim:/dma/p10 \
sim:/dma/p11 \
sim:/dma/p12 \
sim:/dma/p13 \
sim:/dma/p14 \
sim:/dma/p15 \
sim:/dma/readdoneinternal \
sim:/dma/nvmcounter \
sim:/dma/nvmnextaddress \
sim:/dma/cachenextaddress
force -freeze sim:/dma/ReadReq 1 0
run
force -freeze sim:/dma/ReadReq 0 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run