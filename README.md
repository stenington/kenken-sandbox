# kenken-sandbox
KenKen calculator sandbox

## Quickstart

Run `./puzzle.rb -p <PUZZLE_SIZE>`.

Then enter commands:
* `x<TARGET> <NUM_FACTORS>` for factorization problems
* `+<TARGET> <NUM_ADDENDS>` to find possible addends
* `p<PUZZLE_SIZE>` to change to another puzzle size

Hit return with no command to exit.

### Example

```
$ ./puzzle.rb -p 8
+-------- Puzzle size: 8 --------+
> x36 3
x36 3
[1, 6, 6]
[2, 3, 6]
[3, 3, 4]
[1, 2, 3, 4, 6]
> +16 3
+16 3
[1, 7, 8]
[2, 6, 8]
[2, 7, 7]
[3, 5, 8]
[3, 6, 7]
[4, 4, 8]
[4, 5, 7]
[4, 6, 6]
[5, 5, 6]
[1, 2, 3, 4, 5, 6, 7, 8]
> 
```

