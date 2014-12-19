ifndef $(nslave)
	nslave=2
endif
ifndef $(ndata)
	ndata=10
endif

# this is a makefile used to show testcases of rabit
.PHONY: model_recover local_recover speed


local_recover:
	../submit_mpi.py $(nslave) local test_local_recover $(ndata) rabit_local_replica=1

local_recover_10_10k:
	../submit_mpi.py 10 local test_local_recover 10000 rabit_local_replica=1

# this experiment test recovery with actually process exit, use keepalive to keep program alive
model_recover_10_10k:
	../submit_mpi.py 10 local keepalive.sh test_model_recover 10000