CC = gcc
CFLAGS = -I.
DEPS = greatermake.h
OBJS = greatermake.o greaterfunc.o

all:
	gcc -o greater greater.c
	gcc -E greater.c > greater.i 
	gcc -S -masm=intel greater.i
	as -o greater.o greater.s
	objdump -M intel -d greater.o > greater.dump
	gcc -c -o greater.o greater.c
	objdump -M intel -d greater.o > greater2.dump

greatermake: greatermake.c greaterfunc.c
	gcc -o greatermake greatermake.c greaterfunc.c -I.

greatermake2: greatermake.o greaterfunc.o
	$(CC) -o greatermake greatermake.o greaterfunc.o $(CFLAGS)

# greatermake.o: greatermake.c
# 	gcc -c -o greatermake.o greatermake.c -I.

# greaterfunc.o: greaterfunc.c
# 	gcc -c -o greaterfunc.o greaterfunc.c -I.

greatermake3: $(OBJS)
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
	greatermake3 return objdump 