##### Alex Sobiek
##### COMP 264
##### Dr. Greenberg

### Homework 7-1

Determine the cache performance of hte following code when the cache is a 2048 byte direct-mapped cache with 32 byte blocks:
```c
for (i=0; i<16; i++) {
    for (j=0; j<16; j++) {
        square[i][j].c = 0;
        square[i][j].m = 0;
        square[i][j].y = 0;
        square[i][j].k = 0;
    }
}
```

#### (a) What is the total number of writes
Since it's a 16x16 matrix of a struct that has 4 elements each, the number of writes for the entire matrix would be `16*16*4 = 1024`

#### (b) What is the total number of writes that miss in cache?


#### (c) What is the miss rate?


### Homework 7-2
With the same assumptions as in the previous problem, determine the cache performance of the following code:
```c
for (j=0; j<16; j++) {
    for (i=0; i<16; i++) {
        square[i][j].c = 0;
        square[i][j].m = 0;
        square[i][j].y = 0;
        square[i][j].k = 0;
    }
}
```

#### (a) What is the total number of writes?
Since it's the same 16x16 matrix with structs of 4 elements, the number or writes for the entire matrix is `16*16*4 = 1024`

#### (b) What is the total number of writes that miss in cache?
Because each iteration jumps, the first write will always be a miss. Therefore, there will be `1024*0.25 = 256` misses. 

#### (c) What is the miss rate?
Because each iteration has 4 writes with the first always missing, the miss rate will be 1/4 or 25%. 

https://www.yumpu.com/en/document/read/7055877/cs-4400-computer-systems
https://www.cs.hmc.edu/~mike/courses/workingcs105/f12/quizzes/Quiz7.ans.pdf
https://stackoverflow.com/questions/22443246/need-help-understanding-cache-writing
