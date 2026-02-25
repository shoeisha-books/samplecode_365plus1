let errorMsg () = printfn "Args: Year(YYYY) and Month[1-12]."

let countdates year month = 
    if month > 0 && month < 13 then
        match month with
        | 1 | 3 | 5 | 7 | 8 | 10 | 12 -> 31
        | 4 | 6 | 9 | 11 -> 30
        | _ -> // February 
            if year % 4 = 0 then
                if year % 100 <> 0 then 29
                else if year % 400 = 0 then 29
                else 28
            else 28
    else -1

[<EntryPoint>]
let main argv =
    let mutable year = 2025;
    let mutable month = 9;
    if argv.Length = 2 &&
        System.Int32.TryParse(argv[0], &year) &&
            System.Int32.TryParse(argv[1], &month) then
        let retval = countdates year month
        printfn "%d" retval
        retval
    else
        errorMsg()
        -1