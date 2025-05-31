CC = gcc
CFLAGS = -I.
DEPS = sum_of_fast_n_numbersmake.h
OBJS = sum_of_fast_n_numbersmake.o sum_of_fast_n_numbersfunc.o

all:
	gcc -o sum_of_fast_n_numbers sum_of_fast_n_numbers.c
	gcc -E sum_of_fast_n_numbers.c > sum_of_fast_n_numbers.i 
	gcc -S -masm=intel sum_of_fast_n_numbers.i
	as -o sum_of_fast_n_numbers.o sum_of_fast_n_numbers.s
	objdump -M intel -d sum_of_fast_n_numbers.o > sum_of_fast_n_numbers.dump
	gcc -c -o sum_of_fast_n_numbers.o sum_of_fast_n_numbers.c
	objdump -M intel -d sum_of_fast_n_numbers.o > sum_of_fast_n_numbers2.dump

sum_of_fast_n_numbersmake: sum_of_fast_n_numbersmake.c sum_of_fast_n_numbersfunc.c
	gcc -o sum_of_fast_n_numbersmake sum_of_fast_n_numbersmake.c sum_of_fast_n_numbersfunc.c -I.

sum_of_fast_n_numbersmake2: sum_of_fast_n_numbersmake.o sum_of_fast_n_numbersfunc.o
	$(CC) -o sum_of_fast_n_numbersmake sum_of_fast_n_numbersmake.o sum_of_fast_n_numbersfunc.o $(CFLAGS)

# sum_of_fast_n_numbersmake.o: sum_of_fast_n_numbersmake.c
# 	gcc -c -o sum_of_fast_n_numbersmake.o sum_of_fast_n_numbersmake.c -I.

# sum_of_fast_n_numbersfunc.o: sum_of_fast_n_numbersfunc.c
# 	gcc -c -o sum_of_fast_n_numbersfunc.o sum_of_fast_n_numbersfunc.c -I.

sum_of_fast_n_numbersmake3: $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS)

%.o: %.c $(DEPS) 
	gcc -c -o $@ $< -I.

.PHONY: clean

clean:
	rm -f *.o

assembler:
	C:\masm32\bin\ml /c /coff /Cp prog1.asm
	C:\masm32\bin\link -entry:main /subsystem:console prog1.obj
	prog1