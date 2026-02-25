type BuildArray<N extends number, A extends unknown[] = []> = A['length'] extends N ? A : BuildArray<N, [...A, unknown]>;

type Sub<A extends number, B extends number> = BuildArray<A> extends [...infer U, ...BuildArray<B>] ? U['length'] : never;

type Mod<A extends number, B extends number> = B extends 0
    ? never : A extends 0 ? 0 : A extends B ? 0 : BuildArray<A> extends [...BuildArray<B>, ...infer Rest] ? Mod<Rest['length'], B> : A;

type HasDivisor<N extends number, D extends number> = D extends 1
    ? false : Mod<N, D> extends 0 ? true : HasDivisor<N, Sub<D, 1>>;

type IsPrime<N extends number> = N extends 2
    ? true : N extends 0 | 1 ? false : HasDivisor<N, Sub<N, 1>> extends true ? false : true;

type P17 = IsPrime<17>; // true
type P18 = IsPrime<18>; // false
