mkdir test0
cp mpi* test0/
cd test0
mpicc -std=gnu99 mpi16.c -o test0size16
mpicc -std=gnu99 mpi32.c -o test0size32
mpisubmit.pl -p 32 test0size32 --stdout size32_n32_out --stderr n32_er_size32
mpicc -std=gnu99 mpi64.c -o test0size64
mpisubmit.pl -p 32 test0size64 --stdout size64_n32_out --stderr n32_er_size64
mpisubmit.pl -p 64 test0size64 --stdout size64_n64_out --stderr n64_er_size64
mpicc -std=gnu99 mpi128.c -o test0size128
mpisubmit.pl -p 32 test0size128 --stdout size128_n32_out --stderr n32_er_size128
mpisubmit.pl -p 64 test0size128 --stdout size128_n64_out --stderr n64_er_size128
mpisubmit.pl -p 80 test0size128 --stdout size128_n80_out --stderr n80_er_size128
mpicc -std=gnu99 mpi256.c -o test0size256
mpisubmit.pl -p 32 test0size256 --stdout size256_n32_out --stderr n32_er_size256
mpisubmit.pl -p 64 test0size256 --stdout size256_n64_out --stderr n64_er_size256
mpisubmit.pl -p 80 test0size256 --stdout size256_n80_out --stderr n80_er_size256
mpicc -std=gnu99 mpi512.c -o test0size512
mpisubmit.pl -p 32 test0size512 --stdout size512_n32_out --stderr n32_er_size512
mpisubmit.pl -p 64 test0size512 --stdout size512_n64_out --stderr n64_er_size512
mpisubmit.pl -p 80 test0size512 --stdout size512_n80_out --stderr n80_er_size512
mpicc -std=gnu99 mpi600.c -o test0size600
mpisubmit.pl -p 32 test0size600 --stdout size600_n32_out --stderr n32_er_size600
mpisubmit.pl -p 64 test0size600 --stdout size600_n64_out --stderr n64_er_size600
mpisubmit.pl -p 80 test0size600 --stdout size600_n80_out --stderr n80_er_size600
mpicc -std=gnu99 mpi700.c -o test0size700
mpisubmit.pl -p 32 test0size700 --stdout size700_n32_out --stderr n32_er_size700
mpisubmit.pl -p 64 test0size700 --stdout size700_n64_out --stderr n64_er_size700
mpisubmit.pl -p 80 test0size700 --stdout size700_n80_out --stderr n80_er_size700
mpicc -std=gnu99 mpi800.c -o test0size800
mpisubmit.pl -p 32 test0size800 --stdout size800_n32_out --stderr n32_er_size800
mpisubmit.pl -p 64 test0size800 --stdout size800_n64_out --stderr n64_er_size800
mpisubmit.pl -p 80 test0size800 --stdout size800_n80_out --stderr n80_er_size800
mpicc -std=gnu99 mpi900.c -o test0size900
mpisubmit.pl -p 32 test0size900 --stdout size900_n32_out --stderr n32_er_size900
mpisubmit.pl -p 64 test0size900 --stdout size900_n64_out --stderr n64_er_size900
mpisubmit.pl -p 80 test0size900 --stdout size900_n80_out --stderr n80_er_size900
mpicc -std=gnu99 mpi1024.c -o test0size1024
mpisubmit.pl -p 32 test0size1024 --stdout size1024_n32_out --stderr n32_er_size1024
mpisubmit.pl -p 64 test0size1024 --stdout size1024_n64_out --stderr n64_er_size1024
mpisubmit.pl -p 80 test0size1024 --stdout size1024_n80_out --stderr n80_er_size1024
mkdir test1
cp mpi* test1/
cd test1
mpicc -std=gnu99 mpi16.c -o test1size16
mpicc -std=gnu99 mpi32.c -o test1size32
mpisubmit.pl -p 32 test1size32 --stdout size32_n32_out --stderr n32_er_size32
mpicc -std=gnu99 mpi64.c -o test1size64
mpisubmit.pl -p 32 test1size64 --stdout size64_n32_out --stderr n32_er_size64
mpisubmit.pl -p 64 test1size64 --stdout size64_n64_out --stderr n64_er_size64
mpicc -std=gnu99 mpi128.c -o test1size128
mpisubmit.pl -p 32 test1size128 --stdout size128_n32_out --stderr n32_er_size128
mpisubmit.pl -p 64 test1size128 --stdout size128_n64_out --stderr n64_er_size128
mpisubmit.pl -p 80 test1size128 --stdout size128_n80_out --stderr n80_er_size128
mpicc -std=gnu99 mpi256.c -o test1size256
mpisubmit.pl -p 32 test1size256 --stdout size256_n32_out --stderr n32_er_size256
mpisubmit.pl -p 64 test1size256 --stdout size256_n64_out --stderr n64_er_size256
mpisubmit.pl -p 80 test1size256 --stdout size256_n80_out --stderr n80_er_size256
mpicc -std=gnu99 mpi512.c -o test1size512
mpisubmit.pl -p 32 test1size512 --stdout size512_n32_out --stderr n32_er_size512
mpisubmit.pl -p 64 test1size512 --stdout size512_n64_out --stderr n64_er_size512
mpisubmit.pl -p 80 test1size512 --stdout size512_n80_out --stderr n80_er_size512
mpicc -std=gnu99 mpi600.c -o test1size600
mpisubmit.pl -p 32 test1size600 --stdout size600_n32_out --stderr n32_er_size600
mpisubmit.pl -p 64 test1size600 --stdout size600_n64_out --stderr n64_er_size600
mpisubmit.pl -p 80 test1size600 --stdout size600_n80_out --stderr n80_er_size600
mpicc -std=gnu99 mpi700.c -o test1size700
mpisubmit.pl -p 32 test1size700 --stdout size700_n32_out --stderr n32_er_size700
mpisubmit.pl -p 64 test1size700 --stdout size700_n64_out --stderr n64_er_size700
mpisubmit.pl -p 80 test1size700 --stdout size700_n80_out --stderr n80_er_size700
mpicc -std=gnu99 mpi800.c -o test1size800
mpisubmit.pl -p 32 test1size800 --stdout size800_n32_out --stderr n32_er_size800
mpisubmit.pl -p 64 test1size800 --stdout size800_n64_out --stderr n64_er_size800
mpisubmit.pl -p 80 test1size800 --stdout size800_n80_out --stderr n80_er_size800
mpicc -std=gnu99 mpi900.c -o test1size900
mpisubmit.pl -p 32 test1size900 --stdout size900_n32_out --stderr n32_er_size900
mpisubmit.pl -p 64 test1size900 --stdout size900_n64_out --stderr n64_er_size900
mpisubmit.pl -p 80 test1size900 --stdout size900_n80_out --stderr n80_er_size900
mpicc -std=gnu99 mpi1024.c -o test1size1024
mpisubmit.pl -p 32 test1size1024 --stdout size1024_n32_out --stderr n32_er_size1024
mpisubmit.pl -p 64 test1size1024 --stdout size1024_n64_out --stderr n64_er_size1024
mpisubmit.pl -p 80 test1size1024 --stdout size1024_n80_out --stderr n80_er_size1024
mkdir test2
cp mpi* test2/
cd test2
mpicc -std=gnu99 mpi16.c -o test2size16
mpicc -std=gnu99 mpi32.c -o test2size32
mpisubmit.pl -p 32 test2size32 --stdout size32_n32_out --stderr n32_er_size32
mpicc -std=gnu99 mpi64.c -o test2size64
mpisubmit.pl -p 32 test2size64 --stdout size64_n32_out --stderr n32_er_size64
mpisubmit.pl -p 64 test2size64 --stdout size64_n64_out --stderr n64_er_size64
mpicc -std=gnu99 mpi128.c -o test2size128
mpisubmit.pl -p 32 test2size128 --stdout size128_n32_out --stderr n32_er_size128
mpisubmit.pl -p 64 test2size128 --stdout size128_n64_out --stderr n64_er_size128
mpisubmit.pl -p 80 test2size128 --stdout size128_n80_out --stderr n80_er_size128
mpicc -std=gnu99 mpi256.c -o test2size256
mpisubmit.pl -p 32 test2size256 --stdout size256_n32_out --stderr n32_er_size256
mpisubmit.pl -p 64 test2size256 --stdout size256_n64_out --stderr n64_er_size256
mpisubmit.pl -p 80 test2size256 --stdout size256_n80_out --stderr n80_er_size256
mpicc -std=gnu99 mpi512.c -o test2size512
mpisubmit.pl -p 32 test2size512 --stdout size512_n32_out --stderr n32_er_size512
mpisubmit.pl -p 64 test2size512 --stdout size512_n64_out --stderr n64_er_size512
mpisubmit.pl -p 80 test2size512 --stdout size512_n80_out --stderr n80_er_size512
mpicc -std=gnu99 mpi600.c -o test2size600
mpisubmit.pl -p 32 test2size600 --stdout size600_n32_out --stderr n32_er_size600
mpisubmit.pl -p 64 test2size600 --stdout size600_n64_out --stderr n64_er_size600
mpisubmit.pl -p 80 test2size600 --stdout size600_n80_out --stderr n80_er_size600
mpicc -std=gnu99 mpi700.c -o test2size700
mpisubmit.pl -p 32 test2size700 --stdout size700_n32_out --stderr n32_er_size700
mpisubmit.pl -p 64 test2size700 --stdout size700_n64_out --stderr n64_er_size700
mpisubmit.pl -p 80 test2size700 --stdout size700_n80_out --stderr n80_er_size700
mpicc -std=gnu99 mpi800.c -o test2size800
mpisubmit.pl -p 32 test2size800 --stdout size800_n32_out --stderr n32_er_size800
mpisubmit.pl -p 64 test2size800 --stdout size800_n64_out --stderr n64_er_size800
mpisubmit.pl -p 80 test2size800 --stdout size800_n80_out --stderr n80_er_size800
mpicc -std=gnu99 mpi900.c -o test2size900
mpisubmit.pl -p 32 test2size900 --stdout size900_n32_out --stderr n32_er_size900
mpisubmit.pl -p 64 test2size900 --stdout size900_n64_out --stderr n64_er_size900
mpisubmit.pl -p 80 test2size900 --stdout size900_n80_out --stderr n80_er_size900
mpicc -std=gnu99 mpi1024.c -o test2size1024
mpisubmit.pl -p 32 test2size1024 --stdout size1024_n32_out --stderr n32_er_size1024
mpisubmit.pl -p 64 test2size1024 --stdout size1024_n64_out --stderr n64_er_size1024
mpisubmit.pl -p 80 test2size1024 --stdout size1024_n80_out --stderr n80_er_size1024
