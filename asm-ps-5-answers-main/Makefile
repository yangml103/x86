objs=and.o or.o sum.o calc.o array.o list.o upper.o 

calc_simpleone: ${objs} data/simpleone_cmds.o # add arraysum.o etc when i finish making the functions
	ld -g $^ -o $@ 

calc_basic: ${objs} data/basic_cmds.o
	ld -g $^ -o $@ 

calc_listsum_cmds: ${objs} data/listsum_cmds.o
	ld -g $^ -o $@

calc_upperonly: ${objs} data/upperonly_cmds.o
	ld -g $^ -o $@

calc_easy: ${objs} data/easy_cmds.o
	ld -g $^ -o $@

calc_basicwithupper: ${objs} data/basicwithupper_cmds.o
	ld -g $^ -o $@

calc_simplerandom: ${objs} data/simplerandom_cmds.o
	ld -g $^ -o $@


    
    
    

    

