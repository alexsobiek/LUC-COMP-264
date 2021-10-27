/*
long loop(long z, int num) {
    long accum = __________;
    long loopvar;
    for (loopvar = __________; loopvar __________ ; loopvar = __________) {
        accum ^= __________;
    }
    return accum;
}
 */

long loop(long z, int num) {
    long accum = 0;
    long loopvar;
    for (loopvar = 1; loopvar != 0; loopvar <<= num) {
        accum ^= (z & num);
    }
    return accum;
}