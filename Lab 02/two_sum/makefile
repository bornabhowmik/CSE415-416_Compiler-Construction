CC = gcc
CFLAGS = -I.
DEPS = two_summake.h
OBJS = two_summake.o two_sumfunc.o

all:
	gcc -o two_sum two_sum.c
	gcc -E two_sum.c > two_sum.i 
	gcc -S -masm=intel two_sum.i
	as -o two_sum.o two_sum.s
	objdump -M intel -d two_sum.o > two_sum.dump
	gcc -c -o two_sum.o two_sum.c
	objdump -M intel -d two_sum.o > two_sum2.dump

two_summake: two_summake.c two_sumfunc.c
	gcc -o two_summake two_summake.c two_sumfunc.c -I.

two_summake2: two_summake.o two_sumfunc.o
	$(CC) -o two_summake two_summake.o two_sumfunc.o $(CFLAGS)

# two_summake.o: two_summake.c
# 	gcc -c -o two_summake.o two_summake.c -I.

# two_sumfunc.o: two_sumfunc.c
# 	gcc -c -o two_sumfunc.o two_sumfunc.c -I.

two_summake3: $(OBJS)
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