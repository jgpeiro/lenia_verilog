/*
 * Lenia.c
 *
 *  Created on: Dec 3, 2021
 *      Author: Jose
 */

#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>

#include "lenia.h"

void lenia_init(struct lenia_t *lenia, float R, float *peaks, float mu, float sigma, float dt) {
    lenia->R = R;
    lenia->mu = mu;
    lenia->sigma = sigma;
    lenia->dt = dt;

    memcpy( lenia->peaks, peaks, MAX_PEAKS * sizeof(float) );

    memset( lenia->world, 0, SIZE * SIZE * sizeof(float) );
    memset( lenia->kernel, 0, SIZE * SIZE * sizeof(float) );

    lenia_calc_kernel(lenia);
}

void lenia_reset(struct lenia_t *lenia) {
    memset( lenia->world, 0, SIZE * SIZE * sizeof(float) );
}

void lenia_random(struct lenia_t *lenia, int w, int h) {
    for( int i = SIZE/2-w/2 ; i < SIZE/2+w/2 ; i++ )
    {
        for( int j = SIZE/2-h/2 ; j < SIZE/2+h/2 ; j++ )
        {
            lenia->world[i][j] = ((float)rand())/RAND_MAX;
        }
    }
}

void lenia_print( struct lenia_t *lenia, uint8_t kernel ) {
    int i, j;
    for( i=0; i<SIZE; i++ ) {
        for( j=0; j<SIZE; j++ ) {
            if( kernel )
            {
                printf("%s", lenia->kernel[i][j]<0.5?" ":"*");
            }
            else
            {
                printf("%s", lenia->world[i][j]<0.5?" ":"*");
            }
        }
        printf("\r\n");
    }
}

float lenia_calc_core(struct lenia_t *lenia, float r) {
    float rm = fmin(r, 1);
    float tmp = (4 * rm * (1-rm));
    return tmp * tmp * tmp * tmp;
}

float lenia_calc_shell(struct lenia_t *lenia, float r) {
    int k = MAX_PEAKS;
    float kr = k * r;
    float peak = lenia->peaks[(int)fmin(floorf(kr), k-1)];
    return (r<1) * lenia_calc_core( lenia, fmod(kr,1) ) * peak;
}

void lenia_calc_kernel(struct lenia_t *lenia) {
    int i, j;
    float I[SIZE][SIZE];
    for( i=0; i<SIZE; i++ ) {
        for( j=0; j<SIZE; j++ ) {
            I[i][j] = j;
        }
    }

    float X[SIZE][SIZE];
    for( i=0; i<SIZE; i++ ) {
        for( j=0; j<SIZE; j++ ) {
            X[i][j] = (I[i][j] - MID)/lenia->R;
        }
    }

    float Y[SIZE][SIZE];
    for( i=0; i<SIZE; i++ ) {
        for( j=0; j<SIZE; j++ ) {
            Y[i][j] = X[j][i];
        }
    }

    float D[SIZE][SIZE];
    for( i=0; i<SIZE; i++ ) {
        for( j=0; j<SIZE; j++ ) {
            D[i][j] = sqrtf(X[i][j]*X[i][j] + Y[i][j]*Y[i][j]);
        }
    }

    for( i=0; i<SIZE; i++ ) {
        for( j=0; j<SIZE; j++ ) {
            lenia->kernel[i][j] = lenia_calc_shell( lenia, D[i][j] );
        }
    }

    float kernel_sum = 0;
    for( i=0; i<SIZE; i++ ) {
        for( j=0; j<SIZE; j++ ) {
            kernel_sum += lenia->kernel[i][j];
        }
    }

    for( i=0; i<SIZE; i++ ) {
        for( j=0; j<SIZE; j++ ) {
            lenia->kernel[i][j] = lenia->kernel[i][j] / kernel_sum;
        }
    }
}

float lenia_delta_func(struct lenia_t *lenia, float n)
{
    float tmp = fmax(0, 1 - (n - lenia->mu) * (n - lenia->mu) / (lenia->sigma * lenia->sigma * 9));
    return tmp * tmp * tmp * tmp * 2 - 1;
}

float _covolve2D(float kernel[SIZE][SIZE], float world[SIZE][SIZE], int i, int j)
{
    int k, l;
    float sum = 0;
    for (k = 0; k < SIZE; k++) {
        for (l = 0; l < SIZE; l++) {
            int x = i + k - SIZE/2;
            int y = j + l - SIZE/2;
            if( 0 <= x && x < SIZE )
            {
                if( 0 <= y && y < SIZE )
                {
                    sum += kernel[k][l] * world[x][y];
                }
            }
        }
    }
    return sum;
}

void lenia_calc_once(struct lenia_t *lenia)
{
    float potential;
    float delta;
    float cell;
    int i, j;

    for (i = 0; i < SIZE; i++) {
        for (j = 0; j < SIZE; j++) {
            potential = covolve2D( lenia->kernel, lenia->world, i, j );
            delta = lenia_delta_func( lenia, potential );
            cell = lenia->world[i][j] + delta * lenia->dt;
            lenia->world[i][j] = fmax(0, fmin(1, cell) );
        }
    }
}

