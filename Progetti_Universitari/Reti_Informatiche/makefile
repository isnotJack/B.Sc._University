all: client server td kd

client: client.o
	gcc -Wall client.o -o cli

server: server.o
	gcc -Wall server.o -o server

td: td.o
	gcc -Wall td.o -o td

kd: kd.o
	gcc -Wall kd.o -o kd

clean:
	rm *o cli server td kd