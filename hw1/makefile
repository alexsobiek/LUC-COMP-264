run: hello
hello.i:
	gcc hello.c -E -o hello.i
hello.s: hello.i
	gcc hello.c -S
hello.o: hello.s
	gcc hello.c -c
hello: hello.o
	gcc hello.c -o hello