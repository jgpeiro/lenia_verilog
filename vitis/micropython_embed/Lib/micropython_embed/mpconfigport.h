/* This file is part of the MicroPython project, http://micropython.org/
 * The MIT License (MIT)
 * Copyright (c) 2022-2023 Damien P. George
 */

// Include common MicroPython embed configuration.
#include <port/mpconfigport_common.h>

// Use the minimal starting configuration (disables all optional features).
#define MICROPY_CONFIG_ROM_LEVEL                (MICROPY_CONFIG_ROM_LEVEL_MINIMUM)

// MicroPython configuration.
#define MICROPY_ENABLE_COMPILER                 (1)
#define MICROPY_ENABLE_GC                       (1)
#define MICROPY_PY_GC                           (1)
//#define MICROPY_REPL_EVENT_DRIVEN 				(1)
//#define MICROPY_HELPER_REPL (1)
//#define MICROPY_READLINE_HISTORY_SIZE (4)


#define MP_STATE_PORT MP_STATE_VM

//#define MICROPY_PORT_ROOT_POINTERS
//    const char *readline_hist[8];
