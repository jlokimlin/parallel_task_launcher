
MAKE = /usr/bin/make

FC = gfortran

FFLAGS = -fimplicit-none -Wall

EXECUTABLE = ../main.exe

exe: \
main.f90
	$(FC) $(FFLAGS) -o $(EXECUTABLE) sleep_module.f90 main.f90
	$(EXECUTABLE)

run:
	$(MAKE) clean
	$(MAKE) exe

clean:
	rm -f $(EXECUTABLE) *.mod
