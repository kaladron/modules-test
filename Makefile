all:
	clang++-9 -std=c++2a -stdlib=libc++ -fmodules --precompile a.cppm -o a.pcm
	clang++-9 -std=c++2a -stdlib=libc++ -fmodules -fmodule-file=a.pcm -c foo.cpp -o foo.o                             
	clang++-9 -std=c++2a -c a.pcm -o a.o                             
	clang++-9 -std=c++2a -stdlib=libc++ -fmodules -fmodule-file=a.pcm a.o foo.o main.cc -o test 

clean:
	-rm -f *.o *.pcm test
