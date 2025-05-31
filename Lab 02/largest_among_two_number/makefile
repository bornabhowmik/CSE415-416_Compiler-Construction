CC = gcc
CFLAGS = -I.
DEPS = largest_among_two_numbermake.h
OBJS = largest_among_two_numbermake.o largest_among_two_numberfunc.o

all:
	gcc -o largest_among_two_number largest_among_two_number.c
	gcc -E largest_among_two_number.c > largest_among_two_number.i 
	gcc -S -masm=intel largest_among_two_number.i
	as -o largest_among_two_number.o largest_among_two_number.s
	objdump -M intel -d largest_among_two_number.o > largest_among_two_number.dump
	gcc -c -o largest_among_two_number.o largest_among_two_number.c
	objdump -M intel -d largest_among_two_number.o > largest_among_two_number2.dump

largest_among_two_numbermake: largest_among_two_numbermake.c largest_among_two_numberfunc.c
	gcc -o largest_among_two_numbermake largest_among_two_numbermake.c largest_among_two_numberfunc.c -I.

largest_among_two_numbermake2: largest_among_two_numbermake.o largest_among_two_numberfunc.o
	$(CC) -o largest_among_two_numbermake largest_among_two_numbermake.o largest_among_two_numberfunc.o $(CFLAGS)

# largest_among_two_numbermake.o: largest_among_two_numbermake.c
# 	gcc -c -o largest_among_two_numbermake.o largest_among_two_numbermake.c -I.

# largest_among_two_numberfunc.o: largest_among_two_numberfunc.c
# 	gcc -c -o largest_among_two_numberfunc.o largest_among_two_numberfunc.c -I.

largest_among_two_numbermake3: $(OBJS)
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