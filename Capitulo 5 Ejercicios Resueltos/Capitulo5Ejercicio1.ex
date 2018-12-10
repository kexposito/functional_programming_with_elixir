defmodule EnchanterShop do
    def data_test do
        [
             %{title: "Longsword", price: 50, magic: false},
             %{title: "Healing Potion", price: 60, magic: true},
             %{title: "Rope", price: 10, magic: false},
             %{title: "Dragons's Spear", price: 100, magic: true},
        ]
    end
    @enchanter_name "Edwing"

    def enchant_for_sale([], _), do: []
    def enchant_for_sale([item = %{magic: true} | incoming_item], func) do
        
        [item | enchant_for_sale(incoming_item, func)]
    end


    def enchant_for_sale([item | incoming_item], func) do
        [func.(item) | enchant_for_sale(incoming_item, func)] 
    end

end


IO.puts(" prueba ")
IO.inspect(EnchanterShop.enchant_for_sale(EnchanterShop.data_test, 
            fn item -> %{
                            title: "Edwing's #{item.title}",
                            price: item.price * 3,
                            magic: true
                        } 
            end)
        )
