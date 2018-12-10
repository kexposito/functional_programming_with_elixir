defmodule Halloween do
    def give_candy(kids) do
        ~w(chocolate jelly mint) # ~w lista de palabras
        |> Stream.cycle
        |> Enum.zip(kids) # Enum.zip crea dos istas por la combinacion de elementos, Cada elemento es una tupla con los elementos de cada lista
    end # la lista de chocolates jelly y mint es una lista infinita , y la otra lista es finita con los nombres de los chicos
end # Enum.zip termina cuando la lista mas corta termina

# iex> c("halloween.ex")
# iex> Halloween.give_candy(~w(Mike Anna Ted Mary Alex Emma))
# [{"chocolate", "Mike"}, {"jelly", "Anna"}, {"mint", "Ted"},
# {"chocolate", "Mary"}, {"jelly", "Alex"}, {"mint", "Emma"}]