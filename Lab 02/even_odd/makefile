CC = gcc
CFLAGS = -I.
DEPS = even_oddmake.h
OBJS = even_oddmake.o even_oddfunc.o

all:
	gcc -o even_odd even_odd.c
	gcc -E even_odd.c > even_odd.i 
	gcc -S -masm=intel even_odd.i
	as -o even_odd.o even_odd.s
	objdump -M intel -d even_odd.o > even_odd.dump
	gcc -c -o even_odd.o even_odd.c
	objdump -M intel -d even_odd.o > even_odd2.dump

even_oddmake: even_oddmake.c even_oddfunc.c
	gcc -o even_oddmake even_oddmake.c even_oddfunc.c -I.

even_oddmake2: even_oddmake.o even_oddfunc.o
	$(CC) -o even_oddmake even_oddmake.o even_oddfunc.o $(CFLAGS)

# even_oddmake.o: even_oddmake.c
# 	gcc -c -o even_oddmake.o even_oddmake.c -I.

# even_oddfunc.o: even_oddfunc.c
# 	gcc -c -o even_oddfunc.o even_oddfunc.c -I.

even_oddmake3: $(OBJS)
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