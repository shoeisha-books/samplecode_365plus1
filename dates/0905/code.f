program mandelbrot
    implicit none
    integer :: i, j, k, maxiter, ix, iy
    real :: x, y, dx, dy
    complex :: c, z

    maxiter = 30
    dx = 0.05
    dy = 0.1

    do iy = 0, 20
        y = 1.0 - iy * dy
        do ix = 0, 60
            x = -2.0 + ix * dx
            c = cmplx(x, y)
            z = cmplx(0.0, 0.0)

            do k = 1, maxiter
                z = z*z + c
                if (abs(z) > 2.0) exit
            end do

            if (abs(z) <= 2.0) then
                write(*,'(a)', advance='no') '*'
            else
                write(*,'(a)', advance='no') ' '
            end if
        end do
        print *
    end do
end program mandelbrot