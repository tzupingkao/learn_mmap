CFLAGS=-g
CC=gcc
CXX=g++

ifeq ($(shell uname -s), Linux)
	DIR_NAME=/home
	LINK_TYPE="-static"
else ifeq ($(shell uname -s), Darwin)
	DIR_NAME=/Users
	LINK_TYPE=""
endif


LIB_PATH=$(DIR_NAME)/tzuping/install/boost/lib
HEAD_PATH=$(DIR_NAME)/tzuping/install/boost/include

PROG=test_mmap test_write boost_iostreams_mmap_read boost_iostreams_mmap_read2 boost_iostreams_mmap_write

all: $(PROG)

install: $(PROG)
	install $(PROG) $(HOME)/bin/

# LIBS= -lssl
LIBS= -lboost_iostreams

test_mmap: test_mmap.o
	@echo $(shell uname -s)
	@echo $(DIR_NAME)
	$(CC) $(CFLAGS) -o test_mmap test_mmap.o

test_write: test_write.o
	$(CC) $(CFLAGS) -o test_write test_write.o 

# In MacOS the -static parameter will will cause -lcrt.o error
# so the program uses dynamic link, and set DYLD_FALLBACK_LIBRARY_PATH assign path
boost_iostreams_mmap_read: boost_iostreams_mmap_read.o
	$(CXX) -o boost_iostreams_mmap_read boost_iostreams_mmap_read.o -L $(LIB_PATH) -I $(HEAD_PATH) $(LIBS) $(LINK_TYPE)

boost_iostreams_mmap_read.o: boost_iostreams_mmap_read.cpp
	$(CXX) -c boost_iostreams_mmap_read.cpp -I $(HEAD_PATH)

# In MacOS the -static parameter will will cause -lcrt.o error
# so the program uses dynamic link, and set DYLD_FALLBACK_LIBRARY_PATH assign path
boost_iostreams_mmap_read2: boost_iostreams_mmap_read2.o
	$(CXX) -o boost_iostreams_mmap_read2 boost_iostreams_mmap_read2.o -L $(LIB_PATH) -I $(HEAD_PATH) $(LIBS) $(LINK_TYPE)

boost_iostreams_mmap_read2.o: boost_iostreams_mmap_read2.cpp
	$(CXX) -c boost_iostreams_mmap_read2.cpp -I $(HEAD_PATH)

# In MacOS the -static parameter will will cause -lcrt.o error
# so the program uses dynamic link, and set DYLD_FALLBACK_LIBRARY_PATH assign path
boost_iostreams_mmap_write: boost_iostreams_mmap_write.o
	$(CXX) -o boost_iostreams_mmap_write boost_iostreams_mmap_write.o -L $(LIB_PATH) -I $(HEAD_PATH) $(LIBS) $(LINK_TYPE)

boost_iostreams_mmap_write.o: boost_iostreams_mmap_write.cpp
	$(CXX) -c boost_iostreams_mmap_write.cpp -I $(HEAD_PATH)

clean:
	rm -f *.o $(PROG) 

backup: clean
	cd .. ; tar czvf dircache.tar.gz dir-cache
