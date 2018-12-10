#https://hexdocs.pm/elixir/Stream.html#unfold/2

#  unfold(next_acc, next_fun) 
#  unfold(acc(), (acc() -> {element(), acc()} | nil)) :: Enumerable.t()

#   example
#  Stream.unfold(5, fn
#   0 -> nil
#   n -> {n, n - 1}
# end) |> Enum.to_list()
# [5, 4, 3, 2, 1]
defmodule Fibonacci do

# fibonacci usando Stream.unfold

    def fib(n) do
       # Stream.unfold(0, fn # el primer parametro es el acumulador, el segundo es la funcion acumuladora
            # 0 -> nil 
             Stream.unfold({1, 1}, fn 
             {a, b} -> {a, {b, a + b}}
            end)
            # 1 -> 1
            # n -> {n, n + fib(n-1)}
        #end) |> Enum.to_list()
    end

    # Stream.unfold({1, 1}, fn 
    # {a, b} -> {a, {b, a + b}}
    # end)
# fibonacci recursivo del Tip
    def fibRec(0), do: 0
    def fibRec(1), do: 1
    def fibRec(n), do: n + fibRec(n-1)
# fibonacci usando Stream.iterate
    def fibIterate(0), do: 0
    def fibIterate(1), do: 1
    def fibIterate(n) when n  > 1 do
         Stream.iterate(1, &(&1 + 1))
             |> Enum.take(n)
             |> Enum.reduce(&(&1+ &2))
     end
    
end

# IO.puts "fib(0)"
# IO.inspect(Fibonacci.fib(0)) 

# IO.puts "fib(1)"
# IO.inspect(Fibonacci.fib(1)) 

IO.puts "fib(3)"
IO.inspect(Fibonacci.fib(3)) 

IO.puts "fib(5)"
IO.inspect(Fibonacci.fib(5)) 
# iterate  https://hexdocs.pm/elixir/Stream.html#iterate/2
    # iterate(start_value, next_fun) View Source
    # iterate(element(), (element() -> element())) :: Enumerable.t()

#     Stream.iterate(0, &(&1 + 1)) |> Enum.take(5)
#       [0, 1, 2, 3, 4]