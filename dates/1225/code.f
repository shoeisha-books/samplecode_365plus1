C   グレゴリー・ライプニッツ級数で円周率を求める
        PROGRAM PI
        INTEGER I,N,SIGN
        REAL ACC
        N=100                     ! 項の数
        SIGN=1                    ! 符号
        DO 100 I=1,N
        ACC=ACC+SIGN*1.0/(I*2-1)
        SIGN=-SIGN
100     CONTINUE
        WRITE(*,*) ACC*4.0        !  => 3.13159251
        END PROGRAM PI
