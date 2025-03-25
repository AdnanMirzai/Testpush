CC=gcc-14
SRCDIR=./src
INCLUDE=/usr/local/include/SDL2
INCDIR=./include                  
LIBS=/usr/local/lib
CFLAGS=-g -I$(INCDIR) -I$(INCLUDE) -c
LDFLAGS=-L$(LIBS) -lSDL2main -lSDL2 -lSDL2_image -lm

rocket: main.o rocket.o
	$(CC) -o rocket main.o rocket.o $(LDFLAGS)   

main.o: $(SRCDIR)/main.c
	$(CC) $(CFLAGS) $(SRCDIR)/main.c             

rocket.o: $(SRCDIR)/rocket.c ./include/rocket.h   #OBS! INCDIR orsakade problem av nån anledning, använd direkt ./include! !!!
	$(CC) $(CFLAGS) $(SRCDIR)/rocket.c           

clean:
	rm -f *.o rocket