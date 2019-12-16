cd test0
mpicc -std=gnu99 mpi16.c -o test0size16
mpisubmit.bg -n 2 -w 00:15:00  test0size16 --stdout size16_n2_out --stderr n2_er_size16
mpisubmit.bg -n 4 -w 00:15:00  test0size16 --stdout size16_n4_out --stderr n4_er_size16
mpisubmit.bg -n 8 -w 00:15:00  test0size16 --stdout size16_n8_out --stderr n8_er_size16
mpisubmit.bg -n 16 -w 00:15:00  test0size16 --stdout size16_n16_out --stderr n16_er_size16
mpicc -std=gnu99 mpi32.c -o test0size32
mpisubmit.bg -n 2 -w 00:15:00  test0size32 --stdout size32_n2_out --stderr n2_er_size32
mpisubmit.bg -n 4 -w 00:15:00  test0size32 --stdout size32_n4_out --stderr n4_er_size32
mpisubmit.bg -n 8 -w 00:15:00  test0size32 --stdout size32_n8_out --stderr n8_er_size32
mpisubmit.bg -n 16 -w 00:15:00  test0size32 --stdout size32_n16_out --stderr n16_er_size32
mpisubmit.bg -n 32 -w 00:15:00  test0size32 --stdout size32_n32_out --stderr n32_er_size32
mpicc -std=gnu99 mpi64.c -o test0size64
mpisubmit.bg -n 2 -w 00:15:00  test0size64 --stdout size64_n2_out --stderr n2_er_size64
mpisubmit.bg -n 4 -w 00:15:00  test0size64 --stdout size64_n4_out --stderr n4_er_size64
mpisubmit.bg -n 8 -w 00:15:00  test0size64 --stdout size64_n8_out --stderr n8_er_size64
mpisubmit.bg -n 16 -w 00:15:00  test0size64 --stdout size64_n16_out --stderr n16_er_size64
mpisubmit.bg -n 32 -w 00:15:00  test0size64 --stdout size64_n32_out --stderr n32_er_size64
mpisubmit.bg -n 64 -w 00:15:00  test0size64 --stdout size64_n64_out --stderr n64_er_size64
mpicc -std=gnu99 mpi128.c -o test0size128
mpisubmit.bg -n 2 -w 00:15:00  test0size128 --stdout size128_n2_out --stderr n2_er_size128
mpisubmit.bg -n 4 -w 00:15:00  test0size128 --stdout size128_n4_out --stderr n4_er_size128
mpisubmit.bg -n 8 -w 00:15:00  test0size128 --stdout size128_n8_out --stderr n8_er_size128
mpisubmit.bg -n 16 -w 00:15:00  test0size128 --stdout size128_n16_out --stderr n16_er_size128
mpisubmit.bg -n 32 -w 00:15:00  test0size128 --stdout size128_n32_out --stderr n32_er_size128
mpisubmit.bg -n 64 -w 00:15:00  test0size128 --stdout size128_n64_out --stderr n64_er_size128
mpisubmit.bg -n 128 -w 00:15:00  test0size128 --stdout size128_n128_out --stderr n128_er_size128
mpicc -std=gnu99 mpi256.c -o test0size256
mpisubmit.bg -n 2 -w 00:15:00  test0size256 --stdout size256_n2_out --stderr n2_er_size256
mpisubmit.bg -n 4 -w 00:15:00  test0size256 --stdout size256_n4_out --stderr n4_er_size256
mpisubmit.bg -n 8 -w 00:15:00  test0size256 --stdout size256_n8_out --stderr n8_er_size256
mpisubmit.bg -n 16 -w 00:15:00  test0size256 --stdout size256_n16_out --stderr n16_er_size256
mpisubmit.bg -n 32 -w 00:15:00  test0size256 --stdout size256_n32_out --stderr n32_er_size256
mpisubmit.bg -n 64 -w 00:15:00  test0size256 --stdout size256_n64_out --stderr n64_er_size256
mpisubmit.bg -n 128 -w 00:15:00  test0size256 --stdout size256_n128_out --stderr n128_er_size256
mpicc -std=gnu99 mpi512.c -o test0size512
mpisubmit.bg -n 2 -w 00:15:00  test0size512 --stdout size512_n2_out --stderr n2_er_size512
mpisubmit.bg -n 4 -w 00:15:00  test0size512 --stdout size512_n4_out --stderr n4_er_size512
mpisubmit.bg -n 8 -w 00:15:00  test0size512 --stdout size512_n8_out --stderr n8_er_size512
mpisubmit.bg -n 16 -w 00:15:00  test0size512 --stdout size512_n16_out --stderr n16_er_size512
mpisubmit.bg -n 32 -w 00:15:00  test0size512 --stdout size512_n32_out --stderr n32_er_size512
mpisubmit.bg -n 64 -w 00:15:00  test0size512 --stdout size512_n64_out --stderr n64_er_size512
mpisubmit.bg -n 128 -w 00:15:00  test0size512 --stdout size512_n128_out --stderr n128_er_size512
mpicc -std=gnu99 mpi600.c -o test0size600
mpisubmit.bg -n 2 -w 00:15:00  test0size600 --stdout size600_n2_out --stderr n2_er_size600
mpisubmit.bg -n 4 -w 00:15:00  test0size600 --stdout size600_n4_out --stderr n4_er_size600
mpisubmit.bg -n 8 -w 00:15:00  test0size600 --stdout size600_n8_out --stderr n8_er_size600
mpisubmit.bg -n 16 -w 00:15:00  test0size600 --stdout size600_n16_out --stderr n16_er_size600
mpisubmit.bg -n 32 -w 00:15:00  test0size600 --stdout size600_n32_out --stderr n32_er_size600
mpisubmit.bg -n 64 -w 00:15:00  test0size600 --stdout size600_n64_out --stderr n64_er_size600
mpisubmit.bg -n 128 -w 00:15:00  test0size600 --stdout size600_n128_out --stderr n128_er_size600
