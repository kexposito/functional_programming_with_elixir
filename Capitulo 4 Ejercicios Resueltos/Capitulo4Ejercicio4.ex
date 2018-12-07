defmodule Capitulo4Ejercicio4 do

    ############# Sum #############
    def tr_sum(n), do: sum(n,0)
    def sum(1, acc), do: 1
    def sum(n,acc) when n>0, do: sum(n-1,acc + n)
    
    ############# Math #############
    def tr_math(n), do: math(n,0)
    def math([],s), do: s
    def math([head | tail],s) do
          math(tail,s + head) 
    end

    ############# Sort #############
    defp merge([], list_b), do: list_b
    defp merge(list_a, []), do: list_a
    
    defp merge([head_a | tail_a], list_b = [head_b | _]) when head_a <= head_b do
        [head_a | merge(tail_a, list_b)]
    end
    defp merge(list_a = [head_a | _], [head_b | tail_b]) when head_a > head_b do
        [head_b | merge(list_a, tail_b)]
    end

    def ascending([]), do: []
    def ascending([a]), do: [a]
    def ascending(list) do
        half_size = div(Enum.count(list), 2) 
        {list_a, list_b} = Enum.split(list, half_size) 
        merge(
            ascending(list_a),
            ascending(list_b)
        )
    end
end

########### tr_sum TEST #####################
IO.puts("Capitulo4Ejercicio4(10).tr_sum(10)")
IO.inspect(Capitulo4Ejercicio4.tr_sum(10))

IO.puts("Capitulo4Ejercicio4(10).tr_sum(1)")
IO.inspect(Capitulo4Ejercicio4.tr_sum(1))

IO.puts("Capitulo4Ejercicio4(10).tr_sum(5)")
IO.inspect(Capitulo4Ejercicio4.tr_sum(5))

IO.puts("Capitulo4Ejercicio4(10).tr_sum(100)")
IO.inspect(Capitulo4Ejercicio4.tr_sum(100))

########### tr_math TEST #####################
IO.puts("Capitulo4Ejercicio4.tr_math([1,2,3,4,5,6,7,8,9,10])")
IO.inspect(Capitulo4Ejercicio4.tr_math([1,2,3,4,5,6,7,8,9,10]))

IO.puts("Capitulo4Ejercicio4.tr_math([10,5,15])")
IO.inspect(Capitulo4Ejercicio4.tr_math([10,5,15]))

IO.puts("Capitulo4Ejercicio4.tr_math([0,0,1,0,0])")
IO.inspect(Capitulo4Ejercicio4.tr_math([0,0,1,0,0]))


########### ascending sort TEST #####################
IO.puts("Sort.ascending([9, 5, 1, 5, 4])")
IO.inspect(Capitulo4Ejercicio4.ascending([9, 5, 1, 5, 4]))

IO.puts("Sort.ascending([2, 2, 3, 1])")
IO.inspect(Capitulo4Ejercicio4.ascending([2, 2, 3, 1]))

IO.puts("Sort.ascending([c, d, a, c])")
IO.inspect(Capitulo4Ejercicio4.ascending(["c", "d", "a", "c"]))