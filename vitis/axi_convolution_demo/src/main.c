#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdint.h>
#include "lenia.h"
#include "xil_io.h"
//#include "xspi.h"

#define FRAMEBUFFER_SIZE (SIZE * SIZE)
#define CONVOLUTION_HW_BASE_ADDR 0x43C00000  // Base address for the convolution hardware

// Framebuffer for rendering
float framebuffer[SIZE][SIZE];

// SPI instance for LCD communication
//XSpi SpiInstance;

void render_framebuffer_to_lcd(float framebuffer[SIZE][SIZE]);
//void spi_init();

float covolve2D(float kernel[SIZE][SIZE], float world[SIZE][SIZE], int i, int j) {
    // Write kernel to hardware
    for (int k = 0; k < SIZE; k++) {
        for (int l = 0; l < SIZE; l++) {
            Xil_Out32(CONVOLUTION_HW_BASE_ADDR + ((k * SIZE + l) * 4), *((uint32_t*)&kernel[k][l]));
        }
    }

    // Write world data to hardware
    for (int k = 0; k < SIZE; k++) {
        for (int l = 0; l < SIZE; l++) {
            Xil_Out32(CONVOLUTION_HW_BASE_ADDR + 0x1000 + ((k * SIZE + l) * 4), *((uint32_t*)&world[k][l]));
        }
    }

    // Trigger the convolution operation
    Xil_Out32(CONVOLUTION_HW_BASE_ADDR + 0x2000, 1);

    // Read the result from the hardware
    uint32_t result = Xil_In32(CONVOLUTION_HW_BASE_ADDR + 0x3000 + ((i * SIZE + j) * 4));
    return *((float*)&result);
}


#include "pikaScript.h"
/*
int main2()
{
    PikaObj* root = pikaScriptInit();
    pikaScriptShell(root);
    obj_deinit(root);
    return 0;
}*/

#include "xparameters.h"
#include "xuartps.h"
#include "xil_printf.h"

XUartPs Uart_PS;		/* The instance of the UART Driver */

int fputc(int ch, FILE *f)
{// using XUartPs_Send
	uint8_t c = ch;
	XUartPs_Send(&Uart_PS, &c, 1);
	return ch;
}

char __platform_getchar(void) {
	uint8_t ch;
	while(1){
		if(XUartPs_Recv(&Uart_PS, &ch, 1) == 1){
			return ch;
		}
	}
}

int uart_init()
{
	u32 Status;
	XUartPs_Config *Config;
	/* Initialize the UART driver so that it's ready to use */
	Config = XUartPs_LookupConfig(XPAR_XUARTPS_0_DEVICE_ID);
	if (NULL == Config) {
		return XST_FAILURE;
	}
	Status = XUartPs_CfgInitialize(&Uart_PS, Config, Config->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	/* Check hardware build */
	Status = XUartPs_SelfTest(&Uart_PS);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	/* Set the UART Baud Rate */
	XUartPs_SetBaudRate(&Uart_PS, 115200);
	/* Send the Hello World message */
	for( int i = 0 ; i < 1000 ; i++ )
	{
		XUartPs_Send(&Uart_PS, (u8 *) "hhh World\n\r", 13);
	}
	return XST_SUCCESS;
}

void uart_deinit()
{

}

void lenia_c()
{
	struct lenia_t lenia;
	float peaks[MAX_PEAKS] = {1.0};
	lenia_init(&lenia, 10.0, peaks, 0.15, 0.03, 0.1);

	// Initialize SPI for LCD communication
	//spi_init();

	// Randomize initial state
	lenia_random(&lenia, SIZE, SIZE);

	while (1) {
		// Calculate next state
		lenia_calc_once(&lenia);

		// Copy world to framebuffer
		memcpy(framebuffer, lenia.world, SIZE * SIZE * sizeof(float));

		// Render framebuffer to LCD
		render_framebuffer_to_lcd(framebuffer);

		// Delay to control frame rate
		usleep(100000); // 10 FPS
	}
}

// Function to read a memory address
int read_memory(int address) {
    return *((int*)address);
}

// Function to write to a memory address
void write_memory(int address, int value) {
    *((int*)address) = value;
}

int custom_add(PikaObj* self, Args* args) {
    int a = args_getInt(args, "a");
    int b = args_getInt(args, "b");
    return a + b;
}

// Initialize PikaScript environment
//PikaObj* root = pikaScriptInit();

typedef struct {
    PikaObj *super;
} PikaMem;

// Implementation of the read method
static int PikaMem_read(PikaObj *self, int addr) {
    if (addr < 0) {
        obj_setErrorCode(self, -1);
        obj_setSysOut(self, "Address out of range.");
        return -1;
    }
    int *memory = (int *)addr;  // Cast address to int pointer
    return *memory;  // Dereference and return value
}

// Implementation of the write method
static void PikaMem_write(PikaObj *self, int addr, int data) {
    if (addr < 0) {
        obj_setErrorCode(self, -1);
        obj_setSysOut(self, "Address out of range.");
        return;
    }
    int *memory = (int *)addr;  // Cast address to int pointer
    *memory = data;  // Write data to memory address
}
/*
#ifndef __PikaMem__H
#define __PikaMem__H
#include <stdio.h>
#include <stdlib.h>
#include "PikaObj.h"

PikaObj *New_PikaMem(Args *args);

Arg* PikaMem_memory(PikaObj *self);

#endif

// Constructor for PikaMem
PikaObj *New_PikaMem(Args *args) {
    PikaMem *self = New_TinyObj(args);//, "PikaMem", PikaMem);
    return (PikaObj *)self;
}

// Bind the methods to the memory class
Arg *PikaMem_memory(PikaObj *self) {
    PikaMem *mem = (PikaMem *)self;
    obj_bindMethod(self, "read(addr:int)->int", PikaMem_read);
    obj_bindMethod(self, "write(addr:int, data:int)->None", PikaMem_write);
    return arg_newObj(mem);
}
*/
//pika_platform_reboot(
int main() {
	init_platform();

    uart_init();


    PikaObj* root = pikaScriptInit();
   // pika
    //obj_bind(root, "custom_add", custom_add);


    //obj_newObj(root, "memory", "PikaMem", custom_add);
    //obj_newObj(root, "memory", "PikaMem", New_PikaMem);

    //pikaScript_registerFunction(root, "read_memory", read_memory);
    //pikaScript_registerFunction(root, "write_memory", write_memory);
   // pikaScript_AddMethod("write_memory", write_memory);
    //pikaScript_AddMethod("read_memory", pika_script_read_memory);
    pikaScriptShell(root);
    obj_deinit(root);

    cleanup_platform();

    //lenia_c();

    return 0;
}

void render_framebuffer_to_lcd(float framebuffer[SIZE][SIZE]) {
    // Implement the SPI transfer to send the framebuffer to the LCD
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            // Convert float to grayscale value
            uint8_t grayscale = (uint8_t)(framebuffer[i][j] * 255);

            // Send grayscale value via SPI
            //XSpi_Transfer(&SpiInstance, &grayscale, NULL, 1);
        }
    }
}
/*
void spi_init() {
    XSpi_Config *ConfigPtr;
    int Status;

    // Initialize the SPI driver
    ConfigPtr = XSpi_LookupConfig(XPAR_SPI_DEVICE_ID);
    if (ConfigPtr == NULL) {
        printf("SPI LookupConfig failed\n");
        return;
    }

    Status = XSpi_CfgInitialize(&SpiInstance, ConfigPtr, ConfigPtr->BaseAddress);
    if (Status != XST_SUCCESS) {
        printf("SPI CfgInitialize failed\n");
        return;
    }

    // Set SPI options
    Status = XSpi_SetOptions(&SpiInstance, XSP_MASTER_OPTION | XSP_MANUAL_SSELECT_OPTION);
    if (Status != XST_SUCCESS) {
        printf("SPI SetOptions failed\n");
        return;
    }

    // Start the SPI driver
    XSpi_Start(&SpiInstance);

    // Disable global interrupt
    XSpi_IntrGlobalDisable(&SpiInstance);
}
*/
