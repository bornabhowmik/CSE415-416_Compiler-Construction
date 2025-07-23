input = input.txt
output = output.txt

main: cal.l cal.y
	bison -d cal.y
	flex cal.l
	gcc cal.tab.c lex.yy.c -o calc
	./calc < $(input) > $(output)

run:
	./calc < $(input) > $(output)
	cat $(output)

clean:
	rm -f cal.tab.c cal.tab.h lex.yy.c calc $(output)
