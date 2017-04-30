add wave -position insertpoint  \
sim:/my_8subtractor/a \
sim:/my_8subtractor/b \
sim:/my_8subtractor/cin \
sim:/my_8subtractor/s \
sim:/my_8subtractor/cout 

force -freeze sim:/my_8subtractor/cin 1 0
force -freeze sim:/my_8subtractor/a 10'd10 0
force -freeze sim:/my_8subtractor/b 10'd5 0
run
force -freeze sim:/my_8subtractor/a 10'd3 0
run
force -freeze sim:/my_8subtractor/a 10'd0 0
force -freeze sim:/my_8subtractor/b 10'd255 0
run

