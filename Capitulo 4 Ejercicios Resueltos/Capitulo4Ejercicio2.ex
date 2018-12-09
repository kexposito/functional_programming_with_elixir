defmodule GeneralStore do

    def test_data do
      [
         %{title: "Longsword", price: 50, magic: false},
         %{title: "Healing Potion", price: 60, magic: true},
         %{title: "Rope", price: 10, magic: false},
         %{title: "Dragons's Spear", price: 100, magic: true},
      ]
    end


    def filter_items([], _), do: []

    def filter_items([ item = %{magic: x} | incoming_items], magic: x )  do 
        [item | filter_items(incoming_items, magic: x )]
    end

    # def filter_items([ item = %{magic: false} | incoming_items], magic: false )  do 
    #     [item | filter_items(incoming_items, magic: false )]
    # end
    # def filter_items([ item = %{magic: true} | incoming_items], magic: true )  do 
    #     [item | filter_items(incoming_items, magic: true )]
    # end

     def filter_items([item | rest], magic: filter_magic) do
         filter_items(rest, magic: filter_magic)
     end
    
end

IO.puts(" GeneralStore.filter_items(GeneralStore.test_data, magic: true) ")
IO.inspect(GeneralStore.filter_items(GeneralStore.test_data, magic: true))

IO.puts(" GeneralStore.filter_items(GeneralStore.test_data, magic: false) ")
IO.inspect(GeneralStore.filter_items(GeneralStore.test_data, magic: false))



