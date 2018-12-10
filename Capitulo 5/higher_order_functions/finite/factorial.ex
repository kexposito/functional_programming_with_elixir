defmodule Factorial do
    def of(0), do: 1
    def of(n) when n > 0 do
        1..10_000_000
            |> Enum.take(n)
            |> Enum.reduce(&(&1* &2))
    end

    # iex> c("factorial.ex")
    # iex> Factorial.of(5)
    # 120
    

    # podemos mejorar esto realizando:
    # iex> integers = Stream.iterate(1, fn previous -> previous + 1 end)
    # iex> Enum.take(integers, 5)
    # [1, 2, 3, 4, 5]
    # iex> Enum.each(integers, &IO.puts/1)
    # 1
    # 2
    # 3
    # # ...
    def of1(0), do: 1
    def of1(n) when n > 0 do 
        Stream.iterate(1, &(&1 + 1))
            |> Enum.take(n)
            |> Enum.reduce(&(&1* &2))
    end 

    # iex> c("factorial.ex")
    # iex> Factorial.of1(5)
    # 120
    # iex> Factorial.of1(10)
    # 3628800


end