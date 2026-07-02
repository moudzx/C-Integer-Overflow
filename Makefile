CC      := gcc
NASM    := nasm
AR      := ar

CFLAGS  := -m32 -Wall -Wextra -std=c11 -I.
NASMFLAGS := -f elf32

TARGET  := libioverflow.a
OBJS    := ioverflow.o overflow.o

PREFIX  := /usr/local

.PHONY: all clean install uninstall

all: $(TARGET)

$(TARGET): $(OBJS)
	$(AR) rcs $@ $^

ioverflow.o: ioverflow.c ioverflow.h
	$(CC) $(CFLAGS) -c $< -o $@

overflow.o: overflow.asm add.asm sub.asm mul.asm
	$(NASM) $(NASMFLAGS) $< -o $@

install: $(TARGET)
	install -d $(PREFIX)/lib $(PREFIX)/include
	install -m 644 $(TARGET) $(PREFIX)/lib
	install -m 644 intof.h $(PREFIX)/include

uninstall:
	rm -f $(PREFIX)/lib/$(TARGET) $(PREFIX)/include/ioverflow.h

clean:
	rm -f $(OBJS) $(TARGET)
