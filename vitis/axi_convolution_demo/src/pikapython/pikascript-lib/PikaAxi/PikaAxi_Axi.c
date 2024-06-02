/* Math_Adder.c */
#include "pikaScript.h"


int PikaAxi_Axi_read(PikaObj *self, int addr)
{
    return *(int*)addr;
}

int PikaAxi_Axi_write(PikaObj *self, int addr, int data)
{
	*(int*)addr = data;
}
