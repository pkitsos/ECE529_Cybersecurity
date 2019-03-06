CC=gcc
OBJ=flawed.o
CC_FLAGS=-no-pie -m32 -g -z execstack -fno-stack-protector

%.o: %.c
	$(CC) -c -o $@ $< $(CC_FLAGS)

main: $(OBJ)
	$(CC) -o flawed flawed.o $(CC_FLAGS) $(ALT_CC_FLAGS)

clean:
	rm *.o flawed
	rm -rf a.out core
