#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <time.h>
#include "lenia.h"
#include "xil_io.h"

#define CONVOLUTION_HW_BASE_ADDR 0x40000000  // Base address for the convolution hardware

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

void generate_random_matrix(float matrix[SIZE][SIZE]) {
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            matrix[i][j] = (float)rand() / RAND_MAX;
        }
    }
}

void print_matrix(const char *name, float matrix[SIZE][SIZE]) {
    printf("%s:\n", name);
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            printf("%6.3f ", matrix[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}

void test_convolution() {
    float kernel[SIZE][SIZE];
    float world[SIZE][SIZE];
    float result;

    // Initialize random matrices
    generate_random_matrix(kernel);
    generate_random_matrix(world);

    // Perform convolution at a specific point
    result = covolve2D(kernel, world, SIZE / 2, SIZE / 2);

    // Print matrices and result
    print_matrix("Kernel", kernel);
    print_matrix("World", world);
    printf("Convolution result at (%d, %d): %6.3f\n", SIZE / 2, SIZE / 2, result);
}

void benchmark_convolution() {
    float kernel[SIZE][SIZE];
    float world[SIZE][SIZE];
    clock_t start, end;
    double cpu_time_used;

    // Initialize random matrices
    generate_random_matrix(kernel);
    generate_random_matrix(world);

    // Benchmark the convolution operation
    start = clock();
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            covolve2D(kernel, world, i, j);
        }
    }
    end = clock();
    cpu_time_used = ((double)(end - start)) / CLOCKS_PER_SEC;

    printf("Convolution benchmark completed in %f seconds\n", cpu_time_used);
}

int main() {
    // Seed the random number generator
    srand(time(NULL));

    // Test the convolution function
    printf("Running convolution test...\n");
    test_convolution();

    // Benchmark the convolution function
    printf("Running convolution benchmark...\n");
    benchmark_convolution();

    return 0;
}
