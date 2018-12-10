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
    def enchant_for_sale([item | incoming_item], func) do
        [func.(item) | enchant_for_sale(incoming_item, func)] # por ser func anonima . 
    end

    def enchant_item(%{magic: false, price: price, title: title}) do
        %{
           title: "#{@enchanter_name}'s #{title}",
            price: price * 3,
            magic: true
        } 
    end
    def enchant_item(item), do: item
end


IO.puts(" test ")
IO.inspect(
    EnchanterShop.enchant_for_sale(EnchanterShop.data_test, &EnchanterShop.enchant_item/1) 
)
