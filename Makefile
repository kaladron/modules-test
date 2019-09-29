.SUFFIXES: .cppm .pcm .cpp
.PHONY: all

CXXFLAGS := -std=c++2a -stdlib=libc++ -fmodules

OBJS := foo.o main.o a.o

all: test

.cppm.pcm:
	$(CXX) $(CXXFLAGS) --precompile $< -o $@

.pcm.o:
	$(CXX) $(CXXFLAGS) -Wno-unused-command-line-argument -c $< -o $@

# Cancel the built-in
%.o: %.cpp

%.o: %.cpp a.pcm
	$(CXX) ${CXXFLAGS} -fmodule-file=a.pcm -c $< -o $@

test: $(OBJS) a.pcm
	$(CXX) $(CXXFLAGS) -fmodule-file=a.pcm $(OBJS) -o test

clean:
	-rm -f *.o *.pcm test
