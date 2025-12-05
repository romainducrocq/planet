
cd ../wheelcc/bin/libc
rm -v ./test_bindings
gcc test_bindings.c -L. -lplx -o test_bindings
./test_bindings
