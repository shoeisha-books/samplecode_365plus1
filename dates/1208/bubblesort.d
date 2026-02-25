import core.stdc.stdio;
import std.algorithm;

void bubbleSort(T)(ref T[] arr) {
    foreach (i; 0 .. arr.length - 1) {
        foreach (j; i + 1 .. arr.length) {
            if (arr[i] > arr[j]) {
                swap(arr[i], arr[j]);
            }
        }
    }
}

void main()
{
    int[] vec = [7, 5, 8, 6, 10, 4, 1, 3, 2, 9];
    bubbleSort(vec);
    vec.each!(val => printf("%d,", val));
}