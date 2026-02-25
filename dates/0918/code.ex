defmodule Haiku do
    def start do
    self()
    |> spawn_line("古池や")
    |> spawn_line("蛙飛び込む")
    |> spawn_line("水の音")
    |> collect(3)
    |> Enum.join("\n")
    |> IO.puts()
    end

    defp spawn_line(parent, text) do
    spawn(fn -> send(parent, {:line, text}) end)
    parent
    end

    defp collect(parent, n) do
    Enum.map(1..n, fn _ ->
        receive do
        {:line, line} -> line
        end
    end)
    end
end

Haiku.start()