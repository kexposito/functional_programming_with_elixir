defmodule Capitulo3Ejercicio3 do

    def tax(salary) when salary <= 2000 do
        0
    end

    def tax(salary) when salary <= 3000 do
        salary * 0.05
    end

    def tax(salary) when salary <= 6000 do
        salary * 0.1
    end

    def tax(salary) do
        salary * 0.15
    end
end


IO.puts "Capitulo3Ejercicio3.tax (100)"
IO.inspect(Capitulo3Ejercicio3.tax(100))

IO.puts "Capitulo3Ejercicio3.tax (2100)"
IO.inspect(Capitulo3Ejercicio3.tax(2100))

IO.puts "Capitulo3Ejercicio3.tax (3100)"
IO.inspect(Capitulo3Ejercicio3.tax(3100))

IO.puts "Capitulo3Ejercicio3.tax (6100)"
IO.inspect(Capitulo3Ejercicio3.tax(6100))