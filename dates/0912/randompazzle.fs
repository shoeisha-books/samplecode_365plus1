// RandomPuzzle.fs
open System

[<EntryPoint>]
let main argv =
    let rng = Random()
    let width = 10
    let height = 5

    printfn "🎲 ランダム算数パズル 🎲"
    for y in 1..height do
        for x in 1..width do
            let a = rng.Next(1, 10)
            let b = rng.Next(1, 10)
            let op = if rng.Next(2) = 0 then '+' else '*'
            let result =
                match op with
                | '+' -> a + b
                | '*' -> a * b
                | _ -> 0
            printf "%d%c%d=%-2d  " a op b result
        printfn ""

    printfn "\n💡 数字のパズル表示終了！"
    0
