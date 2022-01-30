CFLAGS=-g
CC=gcc

PROG=test_mmap test_write

all: $(PROG)

install: $(PROG)
	install $(PROG) $(HOME)/bin/

# LIBS= -lssl
LIBS= -lssl

test_mmap: test_mmap.o
	$(CC) $(CFLAGS) -o test_mmap test_mmap.o

test_write: test_write.o
	$(CC) $(CFLAGS) -o test_write test_write.o 


clean:
	rm -f *.o $(PROG) 

backup: clean
	cd .. ; tar czvf dircache.tar.gz dir-cache
