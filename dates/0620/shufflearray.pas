program shuffledarray;
const Size = 100;
var arr_: array[1..Size] of integer;

procedure InitArray;
var i : integer;
begin
    for i := 1 to Size do arr_[i] := i;
end;

procedure ShuffleArray;
const SwapCount = 1000;
var i, idx1, idx2, temp : integer;
begin
    Randomize;
    for i := 1 to SwapCount do
    begin
        idx1 := Random(Size) + 1; idx2 := Random(Size) + 1;
        temp := arr_[idx1]; arr_[idx1] := arr_[idx2]; arr_[idx2] := temp;
    end;
end;

procedure PrintArray;
var i : integer;
begin
    for i := 1 to Size do Write(arr_[i], ' ');
    Writeln;
end;
begin
    InitArray; ShuffleArray;  PrintArray;
end.
