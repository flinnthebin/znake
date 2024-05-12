//
//   ____             __ _
//  / ___|___  _ __  / _(_) __ _
// | |   / _ \| '_ \| |_| |/ _` |
// | |__| (_) | | | |  _| | (_| |
//  \____\___/|_| |_|_| |_|\__, |
//                         |___/
//
//  Configuration file! Play around
//  with this and break things!
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
    WEST,
    SOUTH,
    EAST,
};

// Grid symbols (empty, head, body, apple)
const symbols = [4]u8{ '.', '󱔎', '', '' };
