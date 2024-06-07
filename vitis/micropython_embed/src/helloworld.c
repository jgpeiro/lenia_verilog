/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
//#include "xil_printf.h"
//#include "xparameters.h"
#include "xuartps.h"
XUartPs Uart_PS;		/* The instance of the UART Driver */

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





#include "port/micropython_embed.h"
#include "py/obj.h"
#include "py/parse.h"
#include "py/lexer.h"
#include "py/nlr.h"
#include "py/runtime.h"
#include <string.h>

// This array is the MicroPython GC heap.
static char heap[8 * 1024];
#define RX_BUFFER_SIZE (128)
uint8_t rxBuffer[RX_BUFFER_SIZE];
volatile uint16_t rxHead = 0;
volatile uint16_t rxTail = 0;
/*
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
    if (huart->Instance == LPUART1)
    {
        // Avanzar el índice de cabeza del buffer circular
        rxHead = (rxHead + 1) % RX_BUFFER_SIZE;

        // Reiniciar la recepción por interrupción
        HAL_UART_Receive_IT(&hlpuart1, (uint8_t *)&rxBuffer[rxHead], 1);
    }
}*/

// Receive single character, blocking until one is available.
/*int mp_hal_stdin_rx_chr(void) {
    unsigned char c = -1;
    HAL_UART_Receive(&hlpuart1, &c, 1, 10);//HAL_MAX_DELAY);
    return c;
}*/
int mp_hal_stdin_rx_chr(void) {
    // Esperar hasta que haya datos en el buffer
    /*while (rxTail == rxHead) {
        // Opcionalmente, puedes implementar un tiempo de espera aquí si lo necesitas.
    	return 255;
    }

    // Leer el dato del buffer circular
    unsigned char c = rxBuffer[rxTail];
    rxTail = (rxTail + 1) % RX_BUFFER_SIZE;

    return c;*/
	while( 1 )
	{
		int ch = 0;
		if(XUartPs_Recv(&Uart_PS, &ch, 1) == 1){
			return ch;
		}

	}
	return 0;
}


// Send the string of given length.
mp_uint_t mp_hal_stdout_tx_strn(const char *str, size_t len){
	//HAL_UART_Transmit(&hlpuart1,(uint8_t*)str,len,HAL_MAX_DELAY);
	XUartPs_Send(&Uart_PS, (u8 *) str, len);
	return len;
}

__attribute__((weak)) int _write(int file, char *ptr, int len)
{
  (void)file;
  //HAL_UART_Transmit(&hlpuart1,(uint8_t*)ptr,len,HAL_MAX_DELAY);
  XUartPs_Send(&Uart_PS, (u8 *) ptr, len);
  return len;
}


void do_str(const char *src, mp_parse_input_kind_t input_kind) {
    nlr_buf_t nlr;
    if (nlr_push(&nlr) == 0) {
        mp_lexer_t *lex = mp_lexer_new_from_str_len(MP_QSTR__lt_stdin_gt_, src, strlen(src), 0);
        qstr source_name = lex->source_name;
        mp_parse_tree_t parse_tree = mp_parse(lex, input_kind);
        mp_obj_t module_fun = mp_compile(&parse_tree, source_name, true);
        mp_call_function_0(module_fun);
        nlr_pop();
    } else {
        // uncaught exception
        mp_obj_print_exception(&mp_plat_print, (mp_obj_t)nlr.ret_val);
    }
}

// Define the size of the buffer for input
#define BUFFER_SIZE 256

// Function prototype for processing the input
void do_str(const char *src, mp_parse_input_kind_t input_kind);

//#include "py/compile.h"
//#include "py/runtime.h"
//#include "py/repl.h"
#include "py/stackctrl.h"
//#include "py/mpstate.h"
//#include "py/mphal.h"
#include "py/emitglue.h"
#define BYTES_PER_WORD 4  // For a 32-bit architecture

// The main REPL function
void repl() {
    printf("Welcome to MicroPython!\r\n");
    static char heap[4096];
    char buffer[BUFFER_SIZE];
    size_t i = 0;
    bool file_input_mode = false;

    //mp_stack_ctrl_init();
   // mp_stack_set_limit(40000 * (BYTES_PER_WORD / 4));
    //mp_embed_init(&heap[0], sizeof(heap), &stack_top);

    mp_hal_stdout_tx_strn("\n>>> ", 5);
    while (1) {
        int c = mp_hal_stdin_rx_chr();
        if (c != 255) {
            // Enter file input mode
            if (c == 0x05) {  // Ctrl-E
                file_input_mode = true;
                i = 0;
                mp_hal_stdout_tx_strn("Enter\r\n", 7);
                mp_hal_stdout_tx_strn("---\r\n", 5);
                continue;
            }

            // Exit file input mode
            if (file_input_mode && c == 0x04) {  // Ctrl-D
                file_input_mode = false;
                buffer[i] = '\0';
                mp_hal_stdout_tx_strn("\r\n", 2);
                do_str(buffer, MP_PARSE_FILE_INPUT);
                i = 0;
                mp_hal_stdout_tx_strn("Exit\r\n", 7);
                mp_hal_stdout_tx_strn(">>> ", 4);
                continue;
            }

            // Handle normal input and multiline blocks
            if (c == 0x0D && (file_input_mode==MP_PARSE_SINGLE_INPUT)){//|| (file_input_mode && c == '\n')) {  // Enter key or newline in file input mode
            	mp_hal_stdout_tx_strn("\r\n", 2);
                buffer[i] = '\0';
                do_str(buffer, MP_PARSE_SINGLE_INPUT);
                i = 0;
                mp_hal_stdout_tx_strn(">>> ", 4);
            } else {
                mp_hal_stdout_tx_strn(&c, 1);
                if( c == '\r' ){
                	char cc;
                	cc = '\n';
                	mp_hal_stdout_tx_strn(&cc, 1);
                }
                buffer[i] = c;
                i = (i + 1) % sizeof(buffer);
            }
        }
    }
}


int main()
{
	int stack_top;
    init_platform();

    uart_init();

    mp_embed_init(&heap[0], sizeof(heap), &stack_top);
    repl();

    cleanup_platform();
    return 0;
}
