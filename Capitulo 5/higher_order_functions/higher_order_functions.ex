defmodule HigherOrderFunctions do
    def compose(f, g) do    # combina dos funciones  
        fn arg -> f.(g.(arg)) end
    end
end

# iex> c("higher_order_functions.ex")
# iex> import HighOrderFunctions
# iex> first_letter_and_upcase = compose(&String.upcase/1, &String.first/1)
# iex> first_letter_and_upcase.("works")
# "W"
# iex> first_letter_and_upcase.("combined")
# "C"


######## lo mismo que lo anterior pero usando el ' pipe '

# iex> first_letter_and_upcase = &(&1 |> String.first |> String.upcase)
# iex> first_letter_and_upcase.("works")
# "W"
# iex> first_letter_and_upcase.("combined")
# "C"

# como funciona
# iex> first_letter_and_upcase = &(&1 |> String.first |> String.upcase)
# iex> first_letter_and_upcase.("works")
# "W"
# iex> first_letter_and_upcase.("combined")
# "C"
# iex> "works" |> String.first |> String.upcase
# "W"
