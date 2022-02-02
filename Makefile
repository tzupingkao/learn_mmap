CFLAGS=-g
CC=gcc
CXX=g++

LIB_PATH=/home/tzuping/install/boost/lib
HEAD_PATH=/home/tzuping/install/boost/include

PROG=test_mmap test_write boost_iostreams_mmap_read boost_iostreams_mmap_read2 boost_iostreams_mmap_write

all: $(PROG)

install: $(PROG)
	install $(PROG) $(HOME)/bin/

# LIBS= -lssl
LIBS= -lboost_iostreams

test_mmap: test_mmap.o
	$(CC) $(CFLAGS) -o test_mmap test_mmap.o

test_write: test_write.o
	$(CC) $(CFLAGS) -o test_write test_write.o 

boost_iostreams_mmap_read: boost_iostreams_mmap_read.o
	$(CXX) -o boost_iostreams_mmap_read boost_iostreams_mmap_read.o -L $(LIB_PATH) -I $(HEAD_PATH) $(LIBS) -static

boost_iostreams_mmap_read.o: boost_iostreams_mmap_read.cpp
	$(CXX) -c boost_iostreams_mmap_read.cpp -I $(HEAD_PATH)

boost_iostreams_mmap_read2: boost_iostreams_mmap_read2.o
	$(CXX) -o boost_iostreams_mmap_read2 boost_iostreams_mmap_read2.o -L $(LIB_PATH) -I $(HEAD_PATH) $(LIBS) -static

boost_iostreams_mmap_read2.o: boost_iostreams_mmap_read2.cpp
	$(CXX) -c boost_iostreams_mmap_read2.cpp -I $(HEAD_PATH)

boost_iostreams_mmap_write: boost_iostreams_mmap_write.o
	$(CXX) -o boost_iostreams_mmap_write boost_iostreams_mmap_write.o -L $(LIB_PATH) -I $(HEAD_PATH) $(LIBS) -static

boost_iostreams_mmap_write.o: boost_iostreams_mmap_write.cpp
	$(CXX) -c boost_iostreams_mmap_write.cpp -I $(HEAD_PATH)

clean:
	rm -f *.o $(PROG) 

backup: clean
	cd .. ; tar czvf dircache.tar.gz dir-cache
