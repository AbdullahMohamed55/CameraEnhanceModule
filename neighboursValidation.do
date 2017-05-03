vsim work.addr_valid

add wave -position insertpoint  \
sim:/addr_valid/addr \
sim:/addr_valid/cnt \
sim:/addr_valid/err \
sim:/addr_valid/out_fsm \
sim:/addr_valid/car1 \
sim:/addr_valid/car2 \
sim:/addr_valid/addOperand \
sim:/addr_valid/subbOperand \
sim:/addr_valid/x1 \
sim:/addr_valid/x2

force -freeze sim:/addr_valid/addr 10'd100 0
force -freeze sim:/addr_valid/cnt 0000 0
run
force -freeze sim:/addr_valid/cnt 0001 0
run
force -freeze sim:/addr_valid/cnt 0010 0
run
force -freeze sim:/addr_valid/cnt 0011 0
run
force -freeze sim:/addr_valid/cnt 0100 0
run
force -freeze sim:/addr_valid/cnt 0101 0
run
force -freeze sim:/addr_valid/cnt 0110 0
run
force -freeze sim:/addr_valid/cnt 0111 0
run
force -freeze sim:/addr_valid/cnt 1000 0
run
force -freeze sim:/addr_valid/addr 00000000 0
force -freeze sim:/addr_valid/cnt 0010 0
run
force -freeze sim:/addr_valid/addr 10'd255 0
force -freeze sim:/addr_valid/cnt 0001 0
run
force -freeze sim:/addr_valid/cnt 1000 0
run
force -freeze sim:/addr_valid/addr 10'd3 0
force -freeze sim:/addr_valid/cnt 0100 0
run
force -freeze sim:/addr_valid/addr 10'd250 0
force -freeze sim:/addr_valid/cnt 0111 0
run
