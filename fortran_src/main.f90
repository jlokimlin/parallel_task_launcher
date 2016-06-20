program main

    use, intrinsic :: iso_fortran_env, only: &
        wp => REAL64, &
        stdout => OUTPUT_UNIT, &
        compiler_version, &
        compiler_options

    use, intrinsic :: iso_c_binding, only: &
         C_INT
    
    use sleep_module, only: &
         sleep => fortran_sleep
    
    ! Explicit typing only
    implicit none

    !----------------------------------------------------------------------
    ! Dictionary: calling arguments
    !----------------------------------------------------------------------
    character (len=32) :: arg
    real (wp)          :: real_arg
    !----------------------------------------------------------------------

    ! Read string from the command line
    call get_command_argument(1, arg)

    ! Cast string to IEEE 64-bit float
    read( arg, '(e23.15e3)') real_arg

    ! Ignore initial compilation to generate executable .exe
    if (command_argument_count() /= 0) call perform_task(real_arg)

    ! Print compiler info to standard output
    write( stdout, '(/4a/)' ) &
         'This file was compiled by ', &
         compiler_version(), ' using the options ', &
         compiler_options()

    
  contains

  
  subroutine perform_task(var)
        !-------------------------------------------------------
        ! Dictionary: calling arguments
        !-------------------------------------------------------
        real (wp), intent (in)      :: var
        !-------------------------------------------------------
        ! Dictionary: local variables
        !-------------------------------------------------------
        integer (C_INT), parameter :: WAIT_10_SECONDS = 10
        integer (C_INT)            :: c_return
        !-------------------------------------------------------
          
        write( stdout, '(/a,e23.15e3/)') 'Perform Fortran task with var = ', var

        ! Wait 10 seconds before launching next task
        c_return = sleep(WAIT_10_SECONDS)

        write( stdout, '(/a/)') 'Awoke after sleeping for 10 seconds'
       
   end subroutine perform_task


end program main
