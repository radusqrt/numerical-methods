all: compile

compile: bisectionMethod.o main.o
	g++ bisectionMethod.o main.o -o bisection

main.o: main.cpp
	g++ -c main.cpp

bisectionMethod.o: bisectionMethod.cpp
	g++ -c bisectionMethod.cpp

clean:
	rm *.o bisection
	clear