def checkout() do
    quantity = ask_number("Quantity?")
    price = ask_number("Price?")
    calculate(quantity, price)
end

def ask_number(message) do
        message <> "\n" #imprimo el mensaje
            |> IO.gets  #tomo el valor
            |> Integer.parse    # lo parseo
    end

def calculate(:error, _), do: IO.puts("Quantity is not a number")
def calculate(_, :error), do: IO.puts("Price is not a number")
def calculate({quantity, _}, {price, _}), do: quantity * price