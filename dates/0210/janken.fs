open System

let rng = Random()
let hands = [|"グー"; "チョキ"; "パー"|]
let pick () = hands.[rng.Next(hands.Length)]

let getIndex hand =
    Array.findIndex ((=) hand) hands

let playerHand = pick()
let cpuHand = pick()
printfn "あなた: %s, コンピュータ: %s" playerHand cpuHand

let playerIndex = getIndex playerHand
let cpuIndex = getIndex cpuHand

let result = (playerIndex - cpuIndex + 3) % 3
match result with
| 0 -> printfn "引き分け"
| 1 -> printfn "あなたの勝ち"
| 2 -> printfn "コンピュータの勝ち"
| _ -> () // ここには到達しないはず