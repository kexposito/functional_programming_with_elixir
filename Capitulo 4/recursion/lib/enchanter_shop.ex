defmodule EnchanterShop do
    
 def test_data do
     [
         %{title: "Longsword", price: 50, magic: false},
         %{title: "Healing Potion", price: 60, magic: true},
         %{title: "Rope", price: 10, magic: false},
         %{title: "Dragons's Spear", price: 100, magic: true},

     ]
 end


 @enchanter_name "Edwing"

 def enchant_for_sale([]), do: []
 def enchant_for_sale([item = %{magic: true} | incoming_item]) do # si [item = %{magic: true} | incoming_item]
    [item | enchant_for_sale(incoming_item)]
 end
 def enchant_for_sale([item | incoming_item]) do
    new_item= %{
        title: "#{@enchanter_name}'s #{item.title}",
        price: item.price * 3,
        magic: true
    }

    [new_item | enchant_for_sale(incoming_item)] 
 end
end