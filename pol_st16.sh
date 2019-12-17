mkdir test0
cp mpi* test0/
cd test0
mpicc -std=gnu99 mpi16.c -o test0size16
mpisubmit.pl -p 2 -w 00:15:00  test0size16 --stdout size16_n2_out --stderr n2_er_size16
mpisubmit.pl -p 4 -w 00:15:00  test0size16 --stdout size16_n4_out --stderr n4_er_size16
mpisubmit.pl -p 8 -w 00:15:00  test0size16 --stdout size16_n8_out --stderr n8_er_size16
mpisubmit.pl -p 16 -w 00:15:00  test0size16 --stdout size16_n16_out --stderr n16_er_size16
mpicc -std=gnu99 mpi32.c -o test0size32
mpisubmit.pl -p 2 -w 00:15:00  test0size32 --stdout size32_n2_out --stderr n2_er_size32
mpisubmit.pl -p 4 -w 00:15:00  test0size32 --stdout size32_n4_out --stderr n4_er_size32
mpisubmit.pl -p 8 -w 00:15:00  test0size32 --stdout size32_n8_out --stderr n8_er_size32
mpisubmit.pl -p 16 -w 00:15:00  test0size32 --stdout size32_n16_out --stderr n16_er_size32
mpicc -std=gnu99 mpi64.c -o test0size64
mpisubmit.pl -p 2 -w 00:15:00  test0size64 --stdout size64_n2_out --stderr n2_er_size64
mpisubmit.pl -p 4 -w 00:15:00  test0size64 --stdout size64_n4_out --stderr n4_er_size64
mpisubmit.pl -p 8 -w 00:15:00  test0size64 --stdout size64_n8_out --stderr n8_er_size64
mpisubmit.pl -p 16 -w 00:15:00  test0size64 --stdout size64_n16_out --stderr n16_er_size64
mpicc -std=gnu99 mpi128.c -o test0size128
mpisubmit.pl -p 2 -w 00:15:00  test0size128 --stdout size128_n2_out --stderr n2_er_size128
mpisubmit.pl -p 4 -w 00:15:00  test0size128 --stdout size128_n4_out --stderr n4_er_size128
mpisubmit.pl -p 8 -w 00:15:00  test0size128 --stdout size128_n8_out --stderr n8_er_size128
mpisubmit.pl -p 16 -w 00:15:00  test0size128 --stdout size128_n16_out --stderr n16_er_size128
mpicc -std=gnu99 mpi256.c -o test0size256
mpisubmit.pl -p 2 -w 00:15:00  test0size256 --stdout size256_n2_out --stderr n2_er_size256
mpisubmit.pl -p 4 -w 00:15:00  test0size256 --stdout size256_n4_out --stderr n4_er_size256
mpisubmit.pl -p 8 -w 00:15:00  test0size256 --stdout size256_n8_out --stderr n8_er_size256
mpisubmit.pl -p 16 -w 00:15:00  test0size256 --stdout size256_n16_out --stderr n16_er_size256
mpicc -std=gnu99 mpi512.c -o test0size512
mpisubmit.pl -p 2 -w 00:15:00  test0size512 --stdout size512_n2_out --stderr n2_er_size512
mpisubmit.pl -p 4 -w 00:15:00  test0size512 --stdout size512_n4_out --stderr n4_er_size512
mpisubmit.pl -p 8 -w 00:15:00  test0size512 --stdout size512_n8_out --stderr n8_er_size512
mpisubmit.pl -p 16 -w 00:15:00  test0size512 --stdout size512_n16_out --stderr n16_er_size512
mpicc -std=gnu99 mpi600.c -o test0size600
mpisubmit.pl -p 2 -w 00:15:00  test0size600 --stdout size600_n2_out --stderr n2_er_size600
mpisubmit.pl -p 4 -w 00:15:00  test0size600 --stdout size600_n4_out --stderr n4_er_size600
mpisubmit.pl -p 8 -w 00:15:00  test0size600 --stdout size600_n8_out --stderr n8_er_size600
mpisubmit.pl -p 16 -w 00:15:00  test0size600 --stdout size600_n16_out --stderr n16_er_size600
mpicc -std=gnu99 mpi700.c -o test0size700
mpisubmit.pl -p 2 -w 00:15:00  test0size700 --stdout size700_n2_out --stderr n2_er_size700
mpisubmit.pl -p 4 -w 00:15:00  test0size700 --stdout size700_n4_out --stderr n4_er_size700
mpisubmit.pl -p 8 -w 00:15:00  test0size700 --stdout size700_n8_out --stderr n8_er_size700
mpisubmit.pl -p 16 -w 00:15:00  test0size700 --stdout size700_n16_out --stderr n16_er_size700
mpicc -std=gnu99 mpi800.c -o test0size800
mpisubmit.pl -p 2 -w 00:15:00  test0size800 --stdout size800_n2_out --stderr n2_er_size800
mpisubmit.pl -p 4 -w 00:15:00  test0size800 --stdout size800_n4_out --stderr n4_er_size800
mpisubmit.pl -p 8 -w 00:15:00  test0size800 --stdout size800_n8_out --stderr n8_er_size800
mpisubmit.pl -p 16 -w 00:15:00  test0size800 --stdout size800_n16_out --stderr n16_er_size800
mpicc -std=gnu99 mpi900.c -o test0size900
mpisubmit.pl -p 2 -w 00:15:00  test0size900 --stdout size900_n2_out --stderr n2_er_size900
mpisubmit.pl -p 4 -w 00:15:00  test0size900 --stdout size900_n4_out --stderr n4_er_size900
mpisubmit.pl -p 8 -w 00:15:00  test0size900 --stdout size900_n8_out --stderr n8_er_size900
mpisubmit.pl -p 16 -w 00:15:00  test0size900 --stdout size900_n16_out --stderr n16_er_size900
mpicc -std=gnu99 mpi1024.c -o test0size1024
mpisubmit.pl -p 2 -w 00:15:00  test0size1024 --stdout size1024_n2_out --stderr n2_er_size1024
mpisubmit.pl -p 4 -w 00:15:00  test0size1024 --stdout size1024_n4_out --stderr n4_er_size1024
mpisubmit.pl -p 8 -w 00:15:00  test0size1024 --stdout size1024_n8_out --stderr n8_er_size1024
mpisubmit.pl -p 16 -w 00:15:00  test0size1024 --stdout size1024_n16_out --stderr n16_er_size1024
mkdir test1
cp mpi* test1/
cd test1
mpicc -std=gnu99 mpi16.c -o test1size16
mpisubmit.pl -p 2 -w 00:15:00  test1size16 --stdout size16_n2_out --stderr n2_er_size16
mpisubmit.pl -p 4 -w 00:15:00  test1size16 --stdout size16_n4_out --stderr n4_er_size16
mpisubmit.pl -p 8 -w 00:15:00  test1size16 --stdout size16_n8_out --stderr n8_er_size16
mpisubmit.pl -p 16 -w 00:15:00  test1size16 --stdout size16_n16_out --stderr n16_er_size16
mpicc -std=gnu99 mpi32.c -o test1size32
mpisubmit.pl -p 2 -w 00:15:00  test1size32 --stdout size32_n2_out --stderr n2_er_size32
mpisubmit.pl -p 4 -w 00:15:00  test1size32 --stdout size32_n4_out --stderr n4_er_size32
mpisubmit.pl -p 8 -w 00:15:00  test1size32 --stdout size32_n8_out --stderr n8_er_size32
mpisubmit.pl -p 16 -w 00:15:00  test1size32 --stdout size32_n16_out --stderr n16_er_size32
mpicc -std=gnu99 mpi64.c -o test1size64
mpisubmit.pl -p 2 -w 00:15:00  test1size64 --stdout size64_n2_out --stderr n2_er_size64
mpisubmit.pl -p 4 -w 00:15:00  test1size64 --stdout size64_n4_out --stderr n4_er_size64
mpisubmit.pl -p 8 -w 00:15:00  test1size64 --stdout size64_n8_out --stderr n8_er_size64
mpisubmit.pl -p 16 -w 00:15:00  test1size64 --stdout size64_n16_out --stderr n16_er_size64
mpicc -std=gnu99 mpi128.c -o test1size128
mpisubmit.pl -p 2 -w 00:15:00  test1size128 --stdout size128_n2_out --stderr n2_er_size128
mpisubmit.pl -p 4 -w 00:15:00  test1size128 --stdout size128_n4_out --stderr n4_er_size128
mpisubmit.pl -p 8 -w 00:15:00  test1size128 --stdout size128_n8_out --stderr n8_er_size128
mpisubmit.pl -p 16 -w 00:15:00  test1size128 --stdout size128_n16_out --stderr n16_er_size128
mpicc -std=gnu99 mpi256.c -o test1size256
mpisubmit.pl -p 2 -w 00:15:00  test1size256 --stdout size256_n2_out --stderr n2_er_size256
mpisubmit.pl -p 4 -w 00:15:00  test1size256 --stdout size256_n4_out --stderr n4_er_size256
mpisubmit.pl -p 8 -w 00:15:00  test1size256 --stdout size256_n8_out --stderr n8_er_size256
mpisubmit.pl -p 16 -w 00:15:00  test1size256 --stdout size256_n16_out --stderr n16_er_size256
mpicc -std=gnu99 mpi512.c -o test1size512
mpisubmit.pl -p 2 -w 00:15:00  test1size512 --stdout size512_n2_out --stderr n2_er_size512
mpisubmit.pl -p 4 -w 00:15:00  test1size512 --stdout size512_n4_out --stderr n4_er_size512
mpisubmit.pl -p 8 -w 00:15:00  test1size512 --stdout size512_n8_out --stderr n8_er_size512
mpisubmit.pl -p 16 -w 00:15:00  test1size512 --stdout size512_n16_out --stderr n16_er_size512
mpicc -std=gnu99 mpi600.c -o test1size600
mpisubmit.pl -p 2 -w 00:15:00  test1size600 --stdout size600_n2_out --stderr n2_er_size600
mpisubmit.pl -p 4 -w 00:15:00  test1size600 --stdout size600_n4_out --stderr n4_er_size600
mpisubmit.pl -p 8 -w 00:15:00  test1size600 --stdout size600_n8_out --stderr n8_er_size600
mpisubmit.pl -p 16 -w 00:15:00  test1size600 --stdout size600_n16_out --stderr n16_er_size600
mpicc -std=gnu99 mpi700.c -o test1size700
mpisubmit.pl -p 2 -w 00:15:00  test1size700 --stdout size700_n2_out --stderr n2_er_size700
mpisubmit.pl -p 4 -w 00:15:00  test1size700 --stdout size700_n4_out --stderr n4_er_size700
mpisubmit.pl -p 8 -w 00:15:00  test1size700 --stdout size700_n8_out --stderr n8_er_size700
mpisubmit.pl -p 16 -w 00:15:00  test1size700 --stdout size700_n16_out --stderr n16_er_size700
mpicc -std=gnu99 mpi800.c -o test1size800
mpisubmit.pl -p 2 -w 00:15:00  test1size800 --stdout size800_n2_out --stderr n2_er_size800
mpisubmit.pl -p 4 -w 00:15:00  test1size800 --stdout size800_n4_out --stderr n4_er_size800
mpisubmit.pl -p 8 -w 00:15:00  test1size800 --stdout size800_n8_out --stderr n8_er_size800
mpisubmit.pl -p 16 -w 00:15:00  test1size800 --stdout size800_n16_out --stderr n16_er_size800
mpicc -std=gnu99 mpi900.c -o test1size900
mpisubmit.pl -p 2 -w 00:15:00  test1size900 --stdout size900_n2_out --stderr n2_er_size900
mpisubmit.pl -p 4 -w 00:15:00  test1size900 --stdout size900_n4_out --stderr n4_er_size900
mpisubmit.pl -p 8 -w 00:15:00  test1size900 --stdout size900_n8_out --stderr n8_er_size900
mpisubmit.pl -p 16 -w 00:15:00  test1size900 --stdout size900_n16_out --stderr n16_er_size900
mpicc -std=gnu99 mpi1024.c -o test1size1024
mpisubmit.pl -p 2 -w 00:15:00  test1size1024 --stdout size1024_n2_out --stderr n2_er_size1024
mpisubmit.pl -p 4 -w 00:15:00  test1size1024 --stdout size1024_n4_out --stderr n4_er_size1024
mpisubmit.pl -p 8 -w 00:15:00  test1size1024 --stdout size1024_n8_out --stderr n8_er_size1024
mpisubmit.pl -p 16 -w 00:15:00  test1size1024 --stdout size1024_n16_out --stderr n16_er_size1024
mkdir test2
cp mpi* test2/
cd test2
mpicc -std=gnu99 mpi16.c -o test2size16
mpisubmit.pl -p 2 -w 00:15:00  test2size16 --stdout size16_n2_out --stderr n2_er_size16
mpisubmit.pl -p 4 -w 00:15:00  test2size16 --stdout size16_n4_out --stderr n4_er_size16
mpisubmit.pl -p 8 -w 00:15:00  test2size16 --stdout size16_n8_out --stderr n8_er_size16
mpisubmit.pl -p 16 -w 00:15:00  test2size16 --stdout size16_n16_out --stderr n16_er_size16
mpicc -std=gnu99 mpi32.c -o test2size32
mpisubmit.pl -p 2 -w 00:15:00  test2size32 --stdout size32_n2_out --stderr n2_er_size32
mpisubmit.pl -p 4 -w 00:15:00  test2size32 --stdout size32_n4_out --stderr n4_er_size32
mpisubmit.pl -p 8 -w 00:15:00  test2size32 --stdout size32_n8_out --stderr n8_er_size32
mpisubmit.pl -p 16 -w 00:15:00  test2size32 --stdout size32_n16_out --stderr n16_er_size32
mpicc -std=gnu99 mpi64.c -o test2size64
mpisubmit.pl -p 2 -w 00:15:00  test2size64 --stdout size64_n2_out --stderr n2_er_size64
mpisubmit.pl -p 4 -w 00:15:00  test2size64 --stdout size64_n4_out --stderr n4_er_size64
mpisubmit.pl -p 8 -w 00:15:00  test2size64 --stdout size64_n8_out --stderr n8_er_size64
mpisubmit.pl -p 16 -w 00:15:00  test2size64 --stdout size64_n16_out --stderr n16_er_size64
mpicc -std=gnu99 mpi128.c -o test2size128
mpisubmit.pl -p 2 -w 00:15:00  test2size128 --stdout size128_n2_out --stderr n2_er_size128
mpisubmit.pl -p 4 -w 00:15:00  test2size128 --stdout size128_n4_out --stderr n4_er_size128
mpisubmit.pl -p 8 -w 00:15:00  test2size128 --stdout size128_n8_out --stderr n8_er_size128
mpisubmit.pl -p 16 -w 00:15:00  test2size128 --stdout size128_n16_out --stderr n16_er_size128
mpicc -std=gnu99 mpi256.c -o test2size256
mpisubmit.pl -p 2 -w 00:15:00  test2size256 --stdout size256_n2_out --stderr n2_er_size256
mpisubmit.pl -p 4 -w 00:15:00  test2size256 --stdout size256_n4_out --stderr n4_er_size256
mpisubmit.pl -p 8 -w 00:15:00  test2size256 --stdout size256_n8_out --stderr n8_er_size256
mpisubmit.pl -p 16 -w 00:15:00  test2size256 --stdout size256_n16_out --stderr n16_er_size256
mpicc -std=gnu99 mpi512.c -o test2size512
mpisubmit.pl -p 2 -w 00:15:00  test2size512 --stdout size512_n2_out --stderr n2_er_size512
mpisubmit.pl -p 4 -w 00:15:00  test2size512 --stdout size512_n4_out --stderr n4_er_size512
mpisubmit.pl -p 8 -w 00:15:00  test2size512 --stdout size512_n8_out --stderr n8_er_size512
mpisubmit.pl -p 16 -w 00:15:00  test2size512 --stdout size512_n16_out --stderr n16_er_size512
mpicc -std=gnu99 mpi600.c -o test2size600
mpisubmit.pl -p 2 -w 00:15:00  test2size600 --stdout size600_n2_out --stderr n2_er_size600
mpisubmit.pl -p 4 -w 00:15:00  test2size600 --stdout size600_n4_out --stderr n4_er_size600
mpisubmit.pl -p 8 -w 00:15:00  test2size600 --stdout size600_n8_out --stderr n8_er_size600
mpisubmit.pl -p 16 -w 00:15:00  test2size600 --stdout size600_n16_out --stderr n16_er_size600
mpicc -std=gnu99 mpi700.c -o test2size700
mpisubmit.pl -p 2 -w 00:15:00  test2size700 --stdout size700_n2_out --stderr n2_er_size700
mpisubmit.pl -p 4 -w 00:15:00  test2size700 --stdout size700_n4_out --stderr n4_er_size700
mpisubmit.pl -p 8 -w 00:15:00  test2size700 --stdout size700_n8_out --stderr n8_er_size700
mpisubmit.pl -p 16 -w 00:15:00  test2size700 --stdout size700_n16_out --stderr n16_er_size700
mpicc -std=gnu99 mpi800.c -o test2size800
mpisubmit.pl -p 2 -w 00:15:00  test2size800 --stdout size800_n2_out --stderr n2_er_size800
mpisubmit.pl -p 4 -w 00:15:00  test2size800 --stdout size800_n4_out --stderr n4_er_size800
mpisubmit.pl -p 8 -w 00:15:00  test2size800 --stdout size800_n8_out --stderr n8_er_size800
mpisubmit.pl -p 16 -w 00:15:00  test2size800 --stdout size800_n16_out --stderr n16_er_size800
mpicc -std=gnu99 mpi900.c -o test2size900
mpisubmit.pl -p 2 -w 00:15:00  test2size900 --stdout size900_n2_out --stderr n2_er_size900
mpisubmit.pl -p 4 -w 00:15:00  test2size900 --stdout size900_n4_out --stderr n4_er_size900
mpisubmit.pl -p 8 -w 00:15:00  test2size900 --stdout size900_n8_out --stderr n8_er_size900
mpisubmit.pl -p 16 -w 00:15:00  test2size900 --stdout size900_n16_out --stderr n16_er_size900
mpicc -std=gnu99 mpi1024.c -o test2size1024
mpisubmit.pl -p 2 -w 00:15:00  test2size1024 --stdout size1024_n2_out --stderr n2_er_size1024
mpisubmit.pl -p 4 -w 00:15:00  test2size1024 --stdout size1024_n4_out --stderr n4_er_size1024
mpisubmit.pl -p 8 -w 00:15:00  test2size1024 --stdout size1024_n8_out --stderr n8_er_size1024
mpisubmit.pl -p 16 -w 00:15:00  test2size1024 --stdout size1024_n16_out --stderr n16_er_size1024
