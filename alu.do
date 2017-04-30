add wave -position insertpoint  \
sim:/alu/a \
sim:/alu/b \
sim:/alu/s \
sim:/alu/f \
sim:/alu/flags_out \
sim:/alu/tmp_out \
sim:/alu/flags_tmp
# add 5+3
force -freeze sim:/alu/a 10'd5 0
force -freeze sim:/alu/b 10'd3 0
force -freeze sim:/alu/s 0 0
run
#5-3
force -freeze sim:/alu/s 1 0
run
#5-7
force -freeze sim:/alu/b 10'd7 0
run
#255 + 100
force -freeze sim:/alu/a 10'd255 0
force -freeze sim:/alu/b 10'd100 0
force -freeze sim:/alu/s 0 0
run
#127 + 100
force -freeze sim:/alu/a 001111111 0
run
