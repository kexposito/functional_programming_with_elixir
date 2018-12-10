defmodule WordBuilder do 

    # este va a dar error ya que Start.at requiere dos parametros, la palabra y el indice 
    # at(string, position) View Source
    # at(t(), integer()) :: grapheme() | nil
    def build(alphabet, position) do
        letters = Enum.map(position, Start.at(alphabet))
        Enum.join(letters)
    end

    # iex> c("word_builder.ex")
    # iex> WordBuilder.build("world", [4, 1, 1, 2])
    # ** (UndefinedFunctionError) undefined function: String.at/1

    def build2(alphabet, position) do
        partial = fn at -> String.at(alphabet,at) end
        letters = Enum.map(position, partial) # para cada una de las posiciones, saco la letra con la funcion anterior
        Enum.join(letters)
    end

    # iex> c("word_builder.ex")
    # iex> WordBuilder.build("world", [4, 1, 1, 2])
    # "door"


    def build3(alphabet, position) do
        letters = Enum.map(position, &(String.at(alphabet, &1))) # aplica la funcion (izq) a el conjunto de la (der)
        Enum.join(letters)
    end

end