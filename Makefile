.PHONY: clean

CC = g++
CFLAGS = -Wall

bin/yesno: src/yesno.cc
	$(CC) $(CFLAGS) -o $@ $^

clean:
	rm -f bin/yesno
