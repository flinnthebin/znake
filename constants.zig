//   ____                _              _
//  / ___|___  _ __  ___| |_ __ _ _ __ | |_ ___
// | |   / _ \| '_ \/ __| __/ _` | '_ \| __/ __|
// | |__| (_) | | | \__ \ || (_| | | | | |_\__ \
//  \____\___/|_| |_|___/\__\__,_|_| |_|\__|___/
//
//  Const values for snake
//

// Grid Size/Snake Length
const N_COLS = 15;
const N_ROWS = 15;
const MAX_LEN = (N_COLS * N_ROWS);

// Snake enum
const snake = enum {
    EMPTY,
    HEAD,
    BODY,
    APPLE,
};

// Input enum
const dirs = enum {
    NORTH,
    EAST,
    SOUTH,
    WEST,
};

// Grid symbols (empty, head, body, apple)
const symbols = [4]u8{ '.', '󱔎', '', '' };
