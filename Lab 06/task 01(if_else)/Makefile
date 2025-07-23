all:
	bison -d cal.y
	flex cal.l
	gcc cal.tab.c lex.yy.c -o main

clean:
	rm -f cal.tab.c cal.tab.h lex.yy.c main
