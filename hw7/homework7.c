struct point_color {
    int c;
    int m;
    int y;
    int k;
};

/**
 * Assume the following:
 * -> sizeof(int)==4
 * -> square begins at mem address 0
 * -> cache is initially empty
 * -> only memory accesses are to entries of array square; i and j are stored in registers
 */


void homework7_1() {
    struct point_color square[16][16];
    int i, j;
    for (i=0; i<16; i++) {
        for (j=0; j<16; j++) {
            square[i][j].c = 0;
            square[i][j].m = 0;
            square[i][j].y = 0;
            square[i][j].k = 0;
        }
    }
}

void homework7_2() {
    struct point_color square[16][16];
    int i, j;
    for (j=0; j<16; j++) {
        for (i=0; i<16; i++) {
            square[i][j].c = 0;
            square[i][j].m = 0;
            square[i][j].y = 0;
            square[i][j].k = 0;
        }
    }
}