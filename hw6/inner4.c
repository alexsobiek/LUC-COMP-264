
/*
Suppose we wish to write a procedure that computes the inner product
of two vectors u and v. An abstract version of the function has a CPE of 14–18 with x86-64 for
different types of integer and floating-point data. By doing the same sort of transformations we did
to transform the abstract program combine1 into the more efficient combine4, we get the following
code:
 */

typedef vec_ptr *vector;
typedef data default;

void inner4(vec_ptr u, vec_ptr v, data t *dest) { // vectors are dynamic arrays
    long i;
    long length = vec_length(u);            // Returns the vector length of u
    data_t *udata = get_vec_start(u);       // Returns pointer to start of vector data
    data_t *vdata = get_vec_start(v);
    data_t sum = (data_t) 0;
    for (i = 0; i < length; i++){           // loop u.length times
        sum = sum + udata[i] * vdata[i];
    }
    *dest = sum;
}

void inner5(vec_ptr u, vec_ptr v, data t *dest) {
    long i;
    long length = vec_length(u);            // Returns the vector length of u
    data_t *udata = get_vec_start(u);       // Returns pointer to start of vector data*
    data_t *vdata = get_vec_start(v);
    data_t sum = (data_t) 0, sum1 = (data_t) 0, sum2 = (data_t) 0, sum3 = (data_t) 0;
    for (i = 0; i < length; i+=4){
        sum += udata[i]*vdata[i];
        sum1 += udata[i+1]*vdata[i+1];
        sum2 += udata[i+2]*vdata[i+2];
        sum3 += udata[i+3]*vdata[i+3];
    }
    *dest = sum + sum1 + sum2 + sum3;
}

