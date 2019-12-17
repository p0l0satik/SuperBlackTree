size = (16,  32, 64, 128, 256, 512, 600, 700, 800, 900, 1024)
cores = (32, 64, 80)

for test in range(3):
    print("mkdir test{0}".format(test))
    print("cp mpi* test{0}/".format(test))
    print("cd test{0}".format(test))
    for cur_size in size:
        print("mpicc -std=gnu99 mpi{1}.c -o test{0}size{1}".format(test, cur_size))
        for core in cores:
            if (core <= cur_size):
                print("mpisubmit.pl -p {2} test{1}size{0} --stdout size{0}_n{2}_out --stderr n{2}_er_size{0}".format(cur_size,test,  core))

