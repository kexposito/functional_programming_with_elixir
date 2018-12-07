defmodule MyList do

    def mini([]), do: 0
    def mini([a]), do: a
    def mini([a | cola])  do
        min(a, mini(cola))
    end

    def maxi([]), do: 0
    def maxi([a]), do: a
    def maxi([a | cola])  do
         max(a, maxi(cola))
    end

    #def min([]), do: []
    #def min([a]), do: [a]
    #def min([a | cola]),  do: findMin(cola, a)
    #defp findMin([head | tail], m) when head >= m, do: findMin(tail, m)
    #defp findMin([head | tail], m) when head < m, do: findMin(tail, head)
    #defp findMin(a,b) when a < b, do: a
    #defp findMin(a,b) when a >= b, do: b

    
end

############## Testing Mini ##################
IO.puts("MyList.mini([1, 3, 4, 2])")
IO.inspect(MyList.mini([1, 3, 4, 2]))

IO.puts("MyList.mini([5, 2, 4, 2, 1])")
IO.inspect(MyList.mini([5, 2, 4, 2, 1]))

IO.puts("MyList.mini([5])")
IO.inspect(MyList.mini([5]))

IO.puts("MyList.mini([5, 6])")
IO.inspect(MyList.mini([5, 6]))

IO.puts("MyList.mini([])")
IO.inspect(MyList.mini([]))
############## Testing Maxi ##################
IO.puts("MyList.maxi([1, 3, 4, 2])")
IO.inspect(MyList.maxi([1, 3, 4, 2]))

IO.puts("MyList.maxi([5, 2, 4, 2, 1])")
IO.inspect(MyList.maxi([5, 2, 4, 2, 1]))

IO.puts("MyList.maxi([5])")
IO.inspect(MyList.maxi([5]))

IO.puts("MyList.maxi([5, 6])")
IO.inspect(MyList.maxi([5, 6]))

IO.puts("MyList.maxi([])")
IO.inspect(MyList.maxi([]))

