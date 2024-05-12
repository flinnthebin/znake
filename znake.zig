//
//  ____              _
// / ___| _ __   __ _| | _____
// \___ \| '_ \ / _` | |/ / _ \
//  ___) | | | | (_| |   <  __/
// |____/|_| |_|\__,_|_|\_\___|
//
// Snake in the Terminal!
// WASD keys for navigation
//
const std = @import("std");
const cnum = @import("constants.zig");

// Global Variables
var grid = [cnum.N_ROWS][cnum.N_COLS]u8{cnum.snake.EMPTY};
var snakeRow = [cnum.MAX_LEN]u8{cnum.snake.EMPTY};
var snakeCol = [cnum.MAX_LEN]u8{cnum.snake.EMPTY};
var snakeLen: u8 = 0;
var growthFactor: u8 = 0;
var snakeTail: u8 = 0;
var lastDir: u8 = cnum.dirs.EAST;

fn setSnakeGrid(row: u8, col: u8, segment: u8) void {
    grid[row][col] = segment;
}

fn setSnakeMem(row: u8, col: u8, length: u8) void {
    snakeRow[length] = row;
    snakeCol[length] = col;
}

fn setSnake(row: u8, col: u8, segment: u8) void {
    setSnakeGrid(row, col, segment);
    setSnakeMem(row, col, snakeLen);
    snakeLen += 1;
}

fn initSnake() void {
    const sRow: u8 = cnum.N_ROWS / 2;
    const sCol: u8 = cnum.N_COLS / 2;
    setSnake(sRow, sCol, cnum.snake.HEAD);
    setSnake(sRow, sCol - 1, cnum.snake.BODY);
    setSnake(sRow, sCol - 2, cnum.snake.BODY);
    setSnake(sRow, sCol - 3, cnum.snake.BODY);
}

fn printGrid() void {
    std.io.getStdOut().writeAll("\x1b[2J");
    std.io.getStdOut().writeAll('\n');

    var i: u8 = 0;
    var j: u8 = 0;
    while (i < cnum.N_ROWS) {
        while (j < cnum.N_COLS) {
            const symbol: u8 = cnum.symbols[grid[i][j]];
            std.io.getStdOut().writeAll(symbol);
            j += 1;
        }
        std.debug.print('\n');
        i += 1;
    }
}

fn inputDir() u8 {
    var direction: u8 = std.io.GenericReader().readByte();
    const case = std.meta.stringToEnum(cnum.dirs, direction) orelse return;
    while (direction) {
        switch (case) {
            'w' => direction = {},
            'a' => direction = {},
            's' => direction = {},
            'd' => direction = {},

            else => std.io.getStdOut().writeAll("invalid direction: {s}\n", .{direction}),
        }
        if (std.math.pow((lastDir - direction), 1) != 2) {
            lastDir = direction;
            return direction;
        } else {
            std.io.getStdOut().writeAll("bonk! cannot turn around 180 degrees!\n");
        }
    }
}

fn deltaRow(direction: u8) u8 {}

fn deltaCol(direction: u8) u8 {}

fn moveSnakeGrid(newRow: u8, newCol: u8) bool {}

fn moveSnakeMem(newRow: u8, newCol: u8) void {}

fn updateApple() void {
    const rng = std.Random();
    const aRow: i32 = std.Random.intRangeLessThan(rng, i32, 0, cnum.N_ROWS);
    const aCol: i32 = std.Random.intRangeLessThan(rng, i32, 0, cnum.N_COLS);

    while (grid[aRow][aCol] != cnum.snake.EMPTY) {
        grid[aRow][aCol] = cnum.snake.APPLE;
    }
}

fn updateSnake(direction: u8) bool {}

pub fn main() void {}
