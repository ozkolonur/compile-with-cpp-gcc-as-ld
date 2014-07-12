#!/bin/sh

#TODO: Makefile it.
mips_4KC-cpp -I. a.c -o a.i
mips_4KC-gcc -S a.i -o a.s
mips_4KC-as a.s -o a.o
mips_4KC-ld a.o -o a /opt/eldk/mips_4KC/lib/crt1.o /opt/eldk/mips_4KC/lib/crti.o /opt/eldk/mips_4KC/lib/crtn.o --dynamic-linker /opt/eldk/mips_4KC/lib/ld.so.1 -lc
