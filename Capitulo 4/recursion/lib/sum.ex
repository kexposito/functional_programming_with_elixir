defmodule Sum do
    def up_to(0), do: 0
    def up_to(n), do: n + up_to(n-1)  
end

IO.puts("Sum.up_to(10)")
IO.inspect(Sum.up_to(10))