mkdir test0
cp mpi* test0/
cd test0
mpicc -std=gnu99 mpi1024.c -o test0size1024
bsub -q normal -n 2 -W 0:30 -o size1024_n2_out -e n2_er_size1024 mpiexec ./test0size1024
bsub -q normal -n 4 -W 0:30 -o size1024_n4_out -e n4_er_size1024 mpiexec ./test0size1024
bsub -q normal -n 8 -W 0:30 -o size1024_n8_out -e n8_er_size1024 mpiexec ./test0size1024
bsub -q normal -n 16 -W 0:30 -o size1024_n16_out -e n16_er_size1024 mpiexec ./test0size1024
bsub -q normal -n 32 -W 0:30 -o size1024_n32_out -e n32_er_size1024 mpiexec ./test0size1024
bsub -q normal -n 64 -W 0:30 -o size1024_n64_out -e n64_er_size1024 mpiexec ./test0size1024
bsub -q normal -n 80 -W 0:30 -o size1024_n80_out -e n80_er_size1024 mpiexec ./test0size1024
mpicc -std=gnu99 mpi1100.c -o test0size1100
bsub -q normal -n 2 -W 0:30 -o size1100_n2_out -e n2_er_size1100 mpiexec ./test0size1100
bsub -q normal -n 4 -W 0:30 -o size1100_n4_out -e n4_er_size1100 mpiexec ./test0size1100
bsub -q normal -n 8 -W 0:30 -o size1100_n8_out -e n8_er_size1100 mpiexec ./test0size1100
bsub -q normal -n 16 -W 0:30 -o size1100_n16_out -e n16_er_size1100 mpiexec ./test0size1100
bsub -q normal -n 32 -W 0:30 -o size1100_n32_out -e n32_er_size1100 mpiexec ./test0size1100
bsub -q normal -n 64 -W 0:30 -o size1100_n64_out -e n64_er_size1100 mpiexec ./test0size1100
bsub -q normal -n 80 -W 0:30 -o size1100_n80_out -e n80_er_size1100 mpiexec ./test0size1100
mpicc -std=gnu99 mpi1200.c -o test0size1200
bsub -q normal -n 2 -W 0:30 -o size1200_n2_out -e n2_er_size1200 mpiexec ./test0size1200
bsub -q normal -n 4 -W 0:30 -o size1200_n4_out -e n4_er_size1200 mpiexec ./test0size1200
bsub -q normal -n 8 -W 0:30 -o size1200_n8_out -e n8_er_size1200 mpiexec ./test0size1200
bsub -q normal -n 16 -W 0:30 -o size1200_n16_out -e n16_er_size1200 mpiexec ./test0size1200
bsub -q normal -n 32 -W 0:30 -o size1200_n32_out -e n32_er_size1200 mpiexec ./test0size1200
bsub -q normal -n 64 -W 0:30 -o size1200_n64_out -e n64_er_size1200 mpiexec ./test0size1200
bsub -q normal -n 80 -W 0:30 -o size1200_n80_out -e n80_er_size1200 mpiexec ./test0size1200
mpicc -std=gnu99 mpi1300.c -o test0size1300
bsub -q normal -n 2 -W 0:30 -o size1300_n2_out -e n2_er_size1300 mpiexec ./test0size1300
bsub -q normal -n 4 -W 0:30 -o size1300_n4_out -e n4_er_size1300 mpiexec ./test0size1300
bsub -q normal -n 8 -W 0:30 -o size1300_n8_out -e n8_er_size1300 mpiexec ./test0size1300
bsub -q normal -n 16 -W 0:30 -o size1300_n16_out -e n16_er_size1300 mpiexec ./test0size1300
bsub -q normal -n 32 -W 0:30 -o size1300_n32_out -e n32_er_size1300 mpiexec ./test0size1300
bsub -q normal -n 64 -W 0:30 -o size1300_n64_out -e n64_er_size1300 mpiexec ./test0size1300
bsub -q normal -n 80 -W 0:30 -o size1300_n80_out -e n80_er_size1300 mpiexec ./test0size1300
mpicc -std=gnu99 mpi1400.c -o test0size1400
bsub -q normal -n 2 -W 0:30 -o size1400_n2_out -e n2_er_size1400 mpiexec ./test0size1400
bsub -q normal -n 4 -W 0:30 -o size1400_n4_out -e n4_er_size1400 mpiexec ./test0size1400
bsub -q normal -n 8 -W 0:30 -o size1400_n8_out -e n8_er_size1400 mpiexec ./test0size1400
bsub -q normal -n 16 -W 0:30 -o size1400_n16_out -e n16_er_size1400 mpiexec ./test0size1400
bsub -q normal -n 32 -W 0:30 -o size1400_n32_out -e n32_er_size1400 mpiexec ./test0size1400
bsub -q normal -n 64 -W 0:30 -o size1400_n64_out -e n64_er_size1400 mpiexec ./test0size1400
bsub -q normal -n 80 -W 0:30 -o size1400_n80_out -e n80_er_size1400 mpiexec ./test0size1400
mpicc -std=gnu99 mpi1500.c -o test0size1500
bsub -q normal -n 2 -W 0:30 -o size1500_n2_out -e n2_er_size1500 mpiexec ./test0size1500
bsub -q normal -n 4 -W 0:30 -o size1500_n4_out -e n4_er_size1500 mpiexec ./test0size1500
bsub -q normal -n 8 -W 0:30 -o size1500_n8_out -e n8_er_size1500 mpiexec ./test0size1500
bsub -q normal -n 16 -W 0:30 -o size1500_n16_out -e n16_er_size1500 mpiexec ./test0size1500
bsub -q normal -n 32 -W 0:30 -o size1500_n32_out -e n32_er_size1500 mpiexec ./test0size1500
bsub -q normal -n 64 -W 0:30 -o size1500_n64_out -e n64_er_size1500 mpiexec ./test0size1500
bsub -q normal -n 80 -W 0:30 -o size1500_n80_out -e n80_er_size1500 mpiexec ./test0size1500
mpicc -std=gnu99 mpi1600.c -o test0size1600
bsub -q normal -n 2 -W 0:30 -o size1600_n2_out -e n2_er_size1600 mpiexec ./test0size1600
bsub -q normal -n 4 -W 0:30 -o size1600_n4_out -e n4_er_size1600 mpiexec ./test0size1600
bsub -q normal -n 8 -W 0:30 -o size1600_n8_out -e n8_er_size1600 mpiexec ./test0size1600
bsub -q normal -n 16 -W 0:30 -o size1600_n16_out -e n16_er_size1600 mpiexec ./test0size1600
bsub -q normal -n 32 -W 0:30 -o size1600_n32_out -e n32_er_size1600 mpiexec ./test0size1600
bsub -q normal -n 64 -W 0:30 -o size1600_n64_out -e n64_er_size1600 mpiexec ./test0size1600
bsub -q normal -n 80 -W 0:30 -o size1600_n80_out -e n80_er_size1600 mpiexec ./test0size1600
mpicc -std=gnu99 mpi1800.c -o test0size1800
bsub -q normal -n 2 -W 0:30 -o size1800_n2_out -e n2_er_size1800 mpiexec ./test0size1800
bsub -q normal -n 4 -W 0:30 -o size1800_n4_out -e n4_er_size1800 mpiexec ./test0size1800
bsub -q normal -n 8 -W 0:30 -o size1800_n8_out -e n8_er_size1800 mpiexec ./test0size1800
bsub -q normal -n 16 -W 0:30 -o size1800_n16_out -e n16_er_size1800 mpiexec ./test0size1800
bsub -q normal -n 32 -W 0:30 -o size1800_n32_out -e n32_er_size1800 mpiexec ./test0size1800
bsub -q normal -n 64 -W 0:30 -o size1800_n64_out -e n64_er_size1800 mpiexec ./test0size1800
bsub -q normal -n 80 -W 0:30 -o size1800_n80_out -e n80_er_size1800 mpiexec ./test0size1800
mpicc -std=gnu99 mpi2000.c -o test0size2000
bsub -q normal -n 2 -W 0:30 -o size2000_n2_out -e n2_er_size2000 mpiexec ./test0size2000
bsub -q normal -n 4 -W 0:30 -o size2000_n4_out -e n4_er_size2000 mpiexec ./test0size2000
bsub -q normal -n 8 -W 0:30 -o size2000_n8_out -e n8_er_size2000 mpiexec ./test0size2000
bsub -q normal -n 16 -W 0:30 -o size2000_n16_out -e n16_er_size2000 mpiexec ./test0size2000
bsub -q normal -n 32 -W 0:30 -o size2000_n32_out -e n32_er_size2000 mpiexec ./test0size2000
bsub -q normal -n 64 -W 0:30 -o size2000_n64_out -e n64_er_size2000 mpiexec ./test0size2000
bsub -q normal -n 80 -W 0:30 -o size2000_n80_out -e n80_er_size2000 mpiexec ./test0size2000
mkdir test1
cp mpi* test1/
cd test1
mpicc -std=gnu99 mpi1024.c -o test1size1024
bsub -q normal -n 2 -W 0:30 -o size1024_n2_out -e n2_er_size1024 mpiexec ./test1size1024
bsub -q normal -n 4 -W 0:30 -o size1024_n4_out -e n4_er_size1024 mpiexec ./test1size1024
bsub -q normal -n 8 -W 0:30 -o size1024_n8_out -e n8_er_size1024 mpiexec ./test1size1024
bsub -q normal -n 16 -W 0:30 -o size1024_n16_out -e n16_er_size1024 mpiexec ./test1size1024
bsub -q normal -n 32 -W 0:30 -o size1024_n32_out -e n32_er_size1024 mpiexec ./test1size1024
bsub -q normal -n 64 -W 0:30 -o size1024_n64_out -e n64_er_size1024 mpiexec ./test1size1024
bsub -q normal -n 80 -W 0:30 -o size1024_n80_out -e n80_er_size1024 mpiexec ./test1size1024
mpicc -std=gnu99 mpi1100.c -o test1size1100
bsub -q normal -n 2 -W 0:30 -o size1100_n2_out -e n2_er_size1100 mpiexec ./test1size1100
bsub -q normal -n 4 -W 0:30 -o size1100_n4_out -e n4_er_size1100 mpiexec ./test1size1100
bsub -q normal -n 8 -W 0:30 -o size1100_n8_out -e n8_er_size1100 mpiexec ./test1size1100
bsub -q normal -n 16 -W 0:30 -o size1100_n16_out -e n16_er_size1100 mpiexec ./test1size1100
bsub -q normal -n 32 -W 0:30 -o size1100_n32_out -e n32_er_size1100 mpiexec ./test1size1100
bsub -q normal -n 64 -W 0:30 -o size1100_n64_out -e n64_er_size1100 mpiexec ./test1size1100
bsub -q normal -n 80 -W 0:30 -o size1100_n80_out -e n80_er_size1100 mpiexec ./test1size1100
mpicc -std=gnu99 mpi1200.c -o test1size1200
bsub -q normal -n 2 -W 0:30 -o size1200_n2_out -e n2_er_size1200 mpiexec ./test1size1200
bsub -q normal -n 4 -W 0:30 -o size1200_n4_out -e n4_er_size1200 mpiexec ./test1size1200
bsub -q normal -n 8 -W 0:30 -o size1200_n8_out -e n8_er_size1200 mpiexec ./test1size1200
bsub -q normal -n 16 -W 0:30 -o size1200_n16_out -e n16_er_size1200 mpiexec ./test1size1200
bsub -q normal -n 32 -W 0:30 -o size1200_n32_out -e n32_er_size1200 mpiexec ./test1size1200
bsub -q normal -n 64 -W 0:30 -o size1200_n64_out -e n64_er_size1200 mpiexec ./test1size1200
bsub -q normal -n 80 -W 0:30 -o size1200_n80_out -e n80_er_size1200 mpiexec ./test1size1200
mpicc -std=gnu99 mpi1300.c -o test1size1300
bsub -q normal -n 2 -W 0:30 -o size1300_n2_out -e n2_er_size1300 mpiexec ./test1size1300
bsub -q normal -n 4 -W 0:30 -o size1300_n4_out -e n4_er_size1300 mpiexec ./test1size1300
bsub -q normal -n 8 -W 0:30 -o size1300_n8_out -e n8_er_size1300 mpiexec ./test1size1300
bsub -q normal -n 16 -W 0:30 -o size1300_n16_out -e n16_er_size1300 mpiexec ./test1size1300
bsub -q normal -n 32 -W 0:30 -o size1300_n32_out -e n32_er_size1300 mpiexec ./test1size1300
bsub -q normal -n 64 -W 0:30 -o size1300_n64_out -e n64_er_size1300 mpiexec ./test1size1300
bsub -q normal -n 80 -W 0:30 -o size1300_n80_out -e n80_er_size1300 mpiexec ./test1size1300
mpicc -std=gnu99 mpi1400.c -o test1size1400
bsub -q normal -n 2 -W 0:30 -o size1400_n2_out -e n2_er_size1400 mpiexec ./test1size1400
bsub -q normal -n 4 -W 0:30 -o size1400_n4_out -e n4_er_size1400 mpiexec ./test1size1400
bsub -q normal -n 8 -W 0:30 -o size1400_n8_out -e n8_er_size1400 mpiexec ./test1size1400
bsub -q normal -n 16 -W 0:30 -o size1400_n16_out -e n16_er_size1400 mpiexec ./test1size1400
bsub -q normal -n 32 -W 0:30 -o size1400_n32_out -e n32_er_size1400 mpiexec ./test1size1400
bsub -q normal -n 64 -W 0:30 -o size1400_n64_out -e n64_er_size1400 mpiexec ./test1size1400
bsub -q normal -n 80 -W 0:30 -o size1400_n80_out -e n80_er_size1400 mpiexec ./test1size1400
mpicc -std=gnu99 mpi1500.c -o test1size1500
bsub -q normal -n 2 -W 0:30 -o size1500_n2_out -e n2_er_size1500 mpiexec ./test1size1500
bsub -q normal -n 4 -W 0:30 -o size1500_n4_out -e n4_er_size1500 mpiexec ./test1size1500
bsub -q normal -n 8 -W 0:30 -o size1500_n8_out -e n8_er_size1500 mpiexec ./test1size1500
bsub -q normal -n 16 -W 0:30 -o size1500_n16_out -e n16_er_size1500 mpiexec ./test1size1500
bsub -q normal -n 32 -W 0:30 -o size1500_n32_out -e n32_er_size1500 mpiexec ./test1size1500
bsub -q normal -n 64 -W 0:30 -o size1500_n64_out -e n64_er_size1500 mpiexec ./test1size1500
bsub -q normal -n 80 -W 0:30 -o size1500_n80_out -e n80_er_size1500 mpiexec ./test1size1500
mpicc -std=gnu99 mpi1600.c -o test1size1600
bsub -q normal -n 2 -W 0:30 -o size1600_n2_out -e n2_er_size1600 mpiexec ./test1size1600
bsub -q normal -n 4 -W 0:30 -o size1600_n4_out -e n4_er_size1600 mpiexec ./test1size1600
bsub -q normal -n 8 -W 0:30 -o size1600_n8_out -e n8_er_size1600 mpiexec ./test1size1600
bsub -q normal -n 16 -W 0:30 -o size1600_n16_out -e n16_er_size1600 mpiexec ./test1size1600
bsub -q normal -n 32 -W 0:30 -o size1600_n32_out -e n32_er_size1600 mpiexec ./test1size1600
bsub -q normal -n 64 -W 0:30 -o size1600_n64_out -e n64_er_size1600 mpiexec ./test1size1600
bsub -q normal -n 80 -W 0:30 -o size1600_n80_out -e n80_er_size1600 mpiexec ./test1size1600
mpicc -std=gnu99 mpi1800.c -o test1size1800
bsub -q normal -n 2 -W 0:30 -o size1800_n2_out -e n2_er_size1800 mpiexec ./test1size1800
bsub -q normal -n 4 -W 0:30 -o size1800_n4_out -e n4_er_size1800 mpiexec ./test1size1800
bsub -q normal -n 8 -W 0:30 -o size1800_n8_out -e n8_er_size1800 mpiexec ./test1size1800
bsub -q normal -n 16 -W 0:30 -o size1800_n16_out -e n16_er_size1800 mpiexec ./test1size1800
bsub -q normal -n 32 -W 0:30 -o size1800_n32_out -e n32_er_size1800 mpiexec ./test1size1800
bsub -q normal -n 64 -W 0:30 -o size1800_n64_out -e n64_er_size1800 mpiexec ./test1size1800
bsub -q normal -n 80 -W 0:30 -o size1800_n80_out -e n80_er_size1800 mpiexec ./test1size1800
mpicc -std=gnu99 mpi2000.c -o test1size2000
bsub -q normal -n 2 -W 0:30 -o size2000_n2_out -e n2_er_size2000 mpiexec ./test1size2000
bsub -q normal -n 4 -W 0:30 -o size2000_n4_out -e n4_er_size2000 mpiexec ./test1size2000
bsub -q normal -n 8 -W 0:30 -o size2000_n8_out -e n8_er_size2000 mpiexec ./test1size2000
bsub -q normal -n 16 -W 0:30 -o size2000_n16_out -e n16_er_size2000 mpiexec ./test1size2000
bsub -q normal -n 32 -W 0:30 -o size2000_n32_out -e n32_er_size2000 mpiexec ./test1size2000
bsub -q normal -n 64 -W 0:30 -o size2000_n64_out -e n64_er_size2000 mpiexec ./test1size2000
bsub -q normal -n 80 -W 0:30 -o size2000_n80_out -e n80_er_size2000 mpiexec ./test1size2000
mkdir test2
cp mpi* test2/
cd test2
mpicc -std=gnu99 mpi1024.c -o test2size1024
bsub -q normal -n 2 -W 0:30 -o size1024_n2_out -e n2_er_size1024 mpiexec ./test2size1024
bsub -q normal -n 4 -W 0:30 -o size1024_n4_out -e n4_er_size1024 mpiexec ./test2size1024
bsub -q normal -n 8 -W 0:30 -o size1024_n8_out -e n8_er_size1024 mpiexec ./test2size1024
bsub -q normal -n 16 -W 0:30 -o size1024_n16_out -e n16_er_size1024 mpiexec ./test2size1024
bsub -q normal -n 32 -W 0:30 -o size1024_n32_out -e n32_er_size1024 mpiexec ./test2size1024
bsub -q normal -n 64 -W 0:30 -o size1024_n64_out -e n64_er_size1024 mpiexec ./test2size1024
bsub -q normal -n 80 -W 0:30 -o size1024_n80_out -e n80_er_size1024 mpiexec ./test2size1024
mpicc -std=gnu99 mpi1100.c -o test2size1100
bsub -q normal -n 2 -W 0:30 -o size1100_n2_out -e n2_er_size1100 mpiexec ./test2size1100
bsub -q normal -n 4 -W 0:30 -o size1100_n4_out -e n4_er_size1100 mpiexec ./test2size1100
bsub -q normal -n 8 -W 0:30 -o size1100_n8_out -e n8_er_size1100 mpiexec ./test2size1100
bsub -q normal -n 16 -W 0:30 -o size1100_n16_out -e n16_er_size1100 mpiexec ./test2size1100
bsub -q normal -n 32 -W 0:30 -o size1100_n32_out -e n32_er_size1100 mpiexec ./test2size1100
bsub -q normal -n 64 -W 0:30 -o size1100_n64_out -e n64_er_size1100 mpiexec ./test2size1100
bsub -q normal -n 80 -W 0:30 -o size1100_n80_out -e n80_er_size1100 mpiexec ./test2size1100
mpicc -std=gnu99 mpi1200.c -o test2size1200
bsub -q normal -n 2 -W 0:30 -o size1200_n2_out -e n2_er_size1200 mpiexec ./test2size1200
bsub -q normal -n 4 -W 0:30 -o size1200_n4_out -e n4_er_size1200 mpiexec ./test2size1200
bsub -q normal -n 8 -W 0:30 -o size1200_n8_out -e n8_er_size1200 mpiexec ./test2size1200
bsub -q normal -n 16 -W 0:30 -o size1200_n16_out -e n16_er_size1200 mpiexec ./test2size1200
bsub -q normal -n 32 -W 0:30 -o size1200_n32_out -e n32_er_size1200 mpiexec ./test2size1200
bsub -q normal -n 64 -W 0:30 -o size1200_n64_out -e n64_er_size1200 mpiexec ./test2size1200
bsub -q normal -n 80 -W 0:30 -o size1200_n80_out -e n80_er_size1200 mpiexec ./test2size1200
mpicc -std=gnu99 mpi1300.c -o test2size1300
bsub -q normal -n 2 -W 0:30 -o size1300_n2_out -e n2_er_size1300 mpiexec ./test2size1300
bsub -q normal -n 4 -W 0:30 -o size1300_n4_out -e n4_er_size1300 mpiexec ./test2size1300
bsub -q normal -n 8 -W 0:30 -o size1300_n8_out -e n8_er_size1300 mpiexec ./test2size1300
bsub -q normal -n 16 -W 0:30 -o size1300_n16_out -e n16_er_size1300 mpiexec ./test2size1300
bsub -q normal -n 32 -W 0:30 -o size1300_n32_out -e n32_er_size1300 mpiexec ./test2size1300
bsub -q normal -n 64 -W 0:30 -o size1300_n64_out -e n64_er_size1300 mpiexec ./test2size1300
bsub -q normal -n 80 -W 0:30 -o size1300_n80_out -e n80_er_size1300 mpiexec ./test2size1300
mpicc -std=gnu99 mpi1400.c -o test2size1400
bsub -q normal -n 2 -W 0:30 -o size1400_n2_out -e n2_er_size1400 mpiexec ./test2size1400
bsub -q normal -n 4 -W 0:30 -o size1400_n4_out -e n4_er_size1400 mpiexec ./test2size1400
bsub -q normal -n 8 -W 0:30 -o size1400_n8_out -e n8_er_size1400 mpiexec ./test2size1400
bsub -q normal -n 16 -W 0:30 -o size1400_n16_out -e n16_er_size1400 mpiexec ./test2size1400
bsub -q normal -n 32 -W 0:30 -o size1400_n32_out -e n32_er_size1400 mpiexec ./test2size1400
bsub -q normal -n 64 -W 0:30 -o size1400_n64_out -e n64_er_size1400 mpiexec ./test2size1400
bsub -q normal -n 80 -W 0:30 -o size1400_n80_out -e n80_er_size1400 mpiexec ./test2size1400
mpicc -std=gnu99 mpi1500.c -o test2size1500
bsub -q normal -n 2 -W 0:30 -o size1500_n2_out -e n2_er_size1500 mpiexec ./test2size1500
bsub -q normal -n 4 -W 0:30 -o size1500_n4_out -e n4_er_size1500 mpiexec ./test2size1500
bsub -q normal -n 8 -W 0:30 -o size1500_n8_out -e n8_er_size1500 mpiexec ./test2size1500
bsub -q normal -n 16 -W 0:30 -o size1500_n16_out -e n16_er_size1500 mpiexec ./test2size1500
bsub -q normal -n 32 -W 0:30 -o size1500_n32_out -e n32_er_size1500 mpiexec ./test2size1500
bsub -q normal -n 64 -W 0:30 -o size1500_n64_out -e n64_er_size1500 mpiexec ./test2size1500
bsub -q normal -n 80 -W 0:30 -o size1500_n80_out -e n80_er_size1500 mpiexec ./test2size1500
mpicc -std=gnu99 mpi1600.c -o test2size1600
bsub -q normal -n 2 -W 0:30 -o size1600_n2_out -e n2_er_size1600 mpiexec ./test2size1600
bsub -q normal -n 4 -W 0:30 -o size1600_n4_out -e n4_er_size1600 mpiexec ./test2size1600
bsub -q normal -n 8 -W 0:30 -o size1600_n8_out -e n8_er_size1600 mpiexec ./test2size1600
bsub -q normal -n 16 -W 0:30 -o size1600_n16_out -e n16_er_size1600 mpiexec ./test2size1600
bsub -q normal -n 32 -W 0:30 -o size1600_n32_out -e n32_er_size1600 mpiexec ./test2size1600
bsub -q normal -n 64 -W 0:30 -o size1600_n64_out -e n64_er_size1600 mpiexec ./test2size1600
bsub -q normal -n 80 -W 0:30 -o size1600_n80_out -e n80_er_size1600 mpiexec ./test2size1600
mpicc -std=gnu99 mpi1800.c -o test2size1800
bsub -q normal -n 2 -W 0:30 -o size1800_n2_out -e n2_er_size1800 mpiexec ./test2size1800
bsub -q normal -n 4 -W 0:30 -o size1800_n4_out -e n4_er_size1800 mpiexec ./test2size1800
bsub -q normal -n 8 -W 0:30 -o size1800_n8_out -e n8_er_size1800 mpiexec ./test2size1800
bsub -q normal -n 16 -W 0:30 -o size1800_n16_out -e n16_er_size1800 mpiexec ./test2size1800
bsub -q normal -n 32 -W 0:30 -o size1800_n32_out -e n32_er_size1800 mpiexec ./test2size1800
bsub -q normal -n 64 -W 0:30 -o size1800_n64_out -e n64_er_size1800 mpiexec ./test2size1800
bsub -q normal -n 80 -W 0:30 -o size1800_n80_out -e n80_er_size1800 mpiexec ./test2size1800
mpicc -std=gnu99 mpi2000.c -o test2size2000
bsub -q normal -n 2 -W 0:30 -o size2000_n2_out -e n2_er_size2000 mpiexec ./test2size2000
bsub -q normal -n 4 -W 0:30 -o size2000_n4_out -e n4_er_size2000 mpiexec ./test2size2000
bsub -q normal -n 8 -W 0:30 -o size2000_n8_out -e n8_er_size2000 mpiexec ./test2size2000
bsub -q normal -n 16 -W 0:30 -o size2000_n16_out -e n16_er_size2000 mpiexec ./test2size2000
bsub -q normal -n 32 -W 0:30 -o size2000_n32_out -e n32_er_size2000 mpiexec ./test2size2000
bsub -q normal -n 64 -W 0:30 -o size2000_n64_out -e n64_er_size2000 mpiexec ./test2size2000
bsub -q normal -n 80 -W 0:30 -o size2000_n80_out -e n80_er_size2000 mpiexec ./test2size2000
