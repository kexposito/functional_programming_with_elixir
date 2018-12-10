defmodule Capitulo5Ejercicio4 do

    def quicksort([]), do: [] #caso base
    def quicksort([pivot | tail]) do
        {smaller, bigger} = Enum.split_with(tail, &(&1 <= pivot)) # https://hexdocs.pm/elixir/Enum.html#split_with/2
        quicksort(smaller) ++ [pivot] ++ quicksort(bigger)
    end
     
end

IO.puts("test quicksort [5, 2, 7, 8, 1]")
IO.inspect(Capitulo5Ejercicio4.quicksort([5, 2, 7, 8, 1]))

IO.puts("test quicksort [1, 1, 1, 8, 1]")
IO.inspect(Capitulo5Ejercicio4.quicksort([1, 1, 1, 8, 1]))

IO.puts("test quicksort [1, 2, 3, 4, 5]")
IO.inspect(Capitulo5Ejercicio4.quicksort([1, 2, 3, 4, 5]))