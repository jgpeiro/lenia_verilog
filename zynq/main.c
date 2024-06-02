#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdint.h>
#include "lenia.h"
#include "xil_io.h"
#include "xspi.h"

#define FRAMEBUFFER_SIZE (SIZE * SIZE)
#define CONVOLUTION_HW_BASE_ADDR 0x40000000  // Base address for the convolution hardware

// Framebuffer for rendering
float framebuffer[SIZE][SIZE];

// SPI instance for LCD communication
XSpi SpiInstance;

void render_framebuffer_to_lcd(float framebuffer[SIZE][SIZE]);
void spi_init();

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

int main() {
    struct lenia_t lenia;
    float peaks[MAX_PEAKS] = {1.0};
    lenia_init(&lenia, 10.0, peaks, 0.15, 0.03, 0.1);

    // Initialize SPI for LCD communication
    spi_init();

    // Randomize initial state
    lenia_random(&lenia, 16, 16);

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

    return 0;
}

void render_framebuffer_to_lcd(float framebuffer[SIZE][SIZE]) {
    // Implement the SPI transfer to send the framebuffer to the LCD
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            // Convert float to grayscale value
            uint8_t grayscale = (uint8_t)(framebuffer[i][j] * 255);

            // Send grayscale value via SPI
            XSpi_Transfer(&SpiInstance, &grayscale, NULL, 1);
        }
    }
}

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
