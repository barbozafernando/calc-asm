EXEC=calculator

all:
	nasm -f elf64 $(EXEC).asm -o $(EXEC).o
	ld -o $(EXEC) $(EXEC).o

clean:
	rm -rf *.o
	rm -f $(EXEC)
