defmodule Math do
    def sum([]), do: 0
    def sum([head | tail]), do: head + sum(tail)
end

IO.puts("Math.sum([10,5,15])")
IO.inspect(Math.sum([10,5,15]))