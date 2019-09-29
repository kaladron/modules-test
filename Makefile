.SUFFIXES: .cppm .pcm .cpp
.PHONY: all

CPPFLAGS := -std=c++2a -fmodules
CXXFLAGS := $(CPPFLAGS) -stdlib=libc++

OBJS := foo.o bar.o main.o a.o

all: test

.cppm.pcm:
	$(CXX) $(CXXFLAGS) --precompile $< -o $@

.pcm.o:
	$(CXX) $(CPPFLAGS) -c $< -o $@

# Cancel the built-in
%.o: %.cpp

%.o: %.cpp a.pcm
	$(CXX) ${CXXFLAGS} -fmodule-file=a.pcm -c $< -o $@

test: $(OBJS) a.pcm
	$(CXX) $(CXXFLAGS) -fmodule-file=a.pcm $(OBJS) -o test

clean:
	-rm -f *.o *.pcm test
