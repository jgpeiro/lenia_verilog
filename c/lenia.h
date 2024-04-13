/*
 * Lenia.h
 *
 *  Created on: Dec 3, 2021
 *      Author: Jose
 */

#ifndef LENIA_H_
#define LENIA_H_

#include <stdint.h>

#define SIZE 32
#define MID (SIZE/2)
#define MAX_PEAKS 1

struct lenia_t {
    float R;
    float mu;
    float sigma;
    float dt;
    float peaks[MAX_PEAKS];

    float world[SIZE][SIZE];
    float kernel[SIZE][SIZE];
};

void lenia_init(struct lenia_t *lenia, float R, float *peaks, float mu, float sigma, float dt);
void lenia_reset(struct lenia_t *lenia);
void lenia_random(struct lenia_t *lenia, int w, int h) ;
void lenia_calc_kernel(struct lenia_t *lenia);
float lenia_calc_core(struct lenia_t *lenia, float r);
float lenia_calc_shell(struct lenia_t *lenia, float r);
float lenia_delta_func(struct lenia_t *lenia, float n);
void lenia_calc_once(struct lenia_t *lenia);
void lenia_print( struct lenia_t *lenia, uint8_t kernel );

#endif /* LENIA_H_ */
