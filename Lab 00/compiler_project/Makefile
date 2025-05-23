all: parser

parser: parser.tab.c lex.yy.c
	gcc -o parser parser.tab.c lex.yy.c -lfl

parser.tab.c parser.tab.h: parser.y
	bison -d parser.y

lex.yy.c: lexer.l parser.tab.h
	flex lexer.l

clean:
	rm -f parser parser.tab.* lex.yy.c
