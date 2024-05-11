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
const MAX_SNAKE_LEN = (N_COLS * N_ROWS);

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

// Pseudo-Random Number Generator
// Linear Congruential Generator
// nextSeed = (a * X(currSeed) + c) mod n

// Multiplier
const a = 1103515245;
// Increment
const c = 12345;
// Mask
const m = 0x7FFFFFFF;
// Seed
var rSeed: u8 = 0;

// Set initial seed
fn seedRNG(seed: u8) u8 {
    rSeed = seed;
}

fn rValue(n: u8) u8 {
    rSeed = (rSeed * a + c) & m;
    return rSeed % n;
}
