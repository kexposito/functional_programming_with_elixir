defmodule MyString do
    def capitalize_words(title) do
        words = String.split(title) # separo cada una de las palabras
        capitalize_words = Enum.map(words, &String.capitalize/1) # paracada una de las palabras
        Enum.join(capitalize_words," ") # y las separo
    end   


# iex> c("my_string.ex")
# iex> MyString.capitalize_words("a whole new world")
# "A Whole New World"

######### usando pipe 1 ############
    def capitalize_words2(title) do
        title
        |> String.split
        |> Enum.map(&String.capitalize/1)
        |> Enum.join(" ")
    end



# paso a paso 
# iex> "a whole new world" |> String.split
# ["a", "whole", "new", "world"]

# iex> "a whole new world" |> String.split |> Enum.map(&String.capitalize/1)
# ["A", "Whole", "New", "World"]

######### usando pipe 3 ############

    def capitalize_words3(title) do
        title
        |> String.split
        |> capitalize_all
        |> join_with_whitespace
    end

    def capitalize_all(words) do
        Enum.mao(words, &String.capitalize/1)
    end
    
    def join_with_whitespace(words) do
        Enum.join(words, " ")
    end 


end