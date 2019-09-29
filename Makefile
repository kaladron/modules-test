CXXFLAGS := -std=c++2a -stdlib=libc++ -fmodules

all:
	$(CXX) $(CXXFLAGS) --precompile a.cppm -o a.pcm
	$(CXX) $(CXXFLAGS) -fmodule-file=a.pcm -c foo.cpp -o foo.o                             
	$(CXX) $(CXXFLAGS) -fmodule-file=a.pcm -c main.cpp -o main.o                             
	$(CXX) $(CXXFLAGS) -c a.pcm -o a.o                             
	$(CXX) $(CXXFLAGS) -fmodule-file=a.pcm a.o foo.o main.o -o test 

clean:
	-rm -f *.o *.pcm test
