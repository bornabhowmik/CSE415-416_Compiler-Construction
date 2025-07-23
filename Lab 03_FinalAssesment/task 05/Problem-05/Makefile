input = input.txt
output = output.txt
target = main

$(target): cal.l cal.y
	bison -d cal.y
	flex cal.l
	gcc cal.tab.c lex.yy.c -o $(target)
	./$(target) < $(input) > $(output)

clean:
	rm -f cal.tab.c cal.tab.h lex.yy.c $(target)
