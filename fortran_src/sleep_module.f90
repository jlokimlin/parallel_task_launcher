module sleep_module

  use, intrinsic :: iso_c_binding, only: &
       C_INT

  ! Explicit typing only
  implicit none

  ! Everything is private unless stated otherwise
  private
  public :: fortran_sleep

  
  ! Declare interface to invoke
  ! C standard library (cstdlib)'s sleep function
  interface
     function fortran_sleep (seconds) &
          result (return_value) bind (C, name="sleep")
          import :: C_INT
          integer (C_INT)                     :: return_value
          integer (C_INT), intent (in), value :: seconds
      end function fortran_sleep
   end interface

   
end module sleep_module
