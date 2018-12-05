defmodule Capitulo2Ejercicio3 do 
    def apply_tax(item)  do
      IO.puts("Price: #{item} - Tax: #{item*0.12}")
    end
end

Enum.each([1,2,3], &Capitulo2Ejercicio3.apply_tax/1)

