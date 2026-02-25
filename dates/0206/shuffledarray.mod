MODULE ShuffledArray;
FROM Random IMPORT RandomInt, Randomize;
FROM InOut IMPORT WriteInt, WriteString, WriteLn;
CONST Size = 100; VAR i:INTEGER; arr_: ARRAY[1..Size] OF INTEGER;

PROCEDURE InitArray;
BEGIN
    FOR i := 1 TO Size DO arr_[i] := i; END;
END InitArray;

PROCEDURE ShuffleArray;
CONST SwapCount = 1000;
VAR i, idx1, idx2, temp : INTEGER;
BEGIN
    Randomize;
    FOR i := 1 TO SwapCount DO
        idx1 := RandomInt(Size) + 1; idx2 := RandomInt(Size) + 1;
        temp := arr_[idx1]; arr_[idx1] := arr_[idx2]; arr_[idx2] := temp;
    END;
END ShuffleArray;

PROCEDURE PrintArray;
VAR i : INTEGER;
BEGIN
    FOR i := 1 TO Size DO WriteInt(arr_[i], 5); WriteString(' '); END;
    WriteLn;
END PrintArray;

BEGIN
    InitArray; ShuffleArray;  PrintArray;
END ShuffledArray.
