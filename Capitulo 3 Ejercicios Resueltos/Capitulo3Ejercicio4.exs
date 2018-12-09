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

# user_input = IO.gets "Salary : \n"
# case Integer.parse(user_input) do

#     :error -> IO.puts "Invalid salary: #{user_input}  Try again"

#     {salary,_}  when salary <= 2000 -> 
        
#         IO.puts "Tax: #{trunc(Capitulo3Ejercicio3.tax(salary))}  Total:#{salary}"

#     {salary,_}  when salary <= 3000 -> 
#         IO.puts "Tax: #{trunc(Capitulo3Ejercicio3.tax(salary))} Total: #{salary - trunc(Capitulo3Ejercicio3.tax(salary))}"

#     {salary,_}  when salary <= 6000 -> 
#         IO.puts "Tax: #{trunc(Capitulo3Ejercicio3.tax(salary))} Total: #{salary - trunc(Capitulo3Ejercicio3.tax(salary))}" 
 
#     {salary,_}  -> 
#         IO.puts "Tax: #{trunc(Capitulo3Ejercicio3.tax(salary))} Total: #{salary - trunc(Capitulo3Ejercicio3.tax(salary))}"      
# end

user_input = IO.gets "Salary : \n"
case Integer.parse(user_input) do
    :error -> IO.puts "Invalid salary: #{user_input}  Try again"
    {salary,_} -> 
        tax = trunc(Capitulo3Ejercicio3.tax(salary))
        net_wage = salary - tax
        IO.puts("Tax: #{tax}  Total:#{net_wage}")
end
