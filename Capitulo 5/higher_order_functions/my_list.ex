# iex> enchanted_items = [
# %{title: "Edwin's Longsword", price: 150},
# %{title: "Healing Potion", price: 60},
# %{title: "Edwin's Rope", price: 30},
# %{title: "Dragon's Spear", price: 100}
# ]

defmodule MyList do
    def each([], _function), do: nil
    def each([head | tail], function) do
        function.(head)
        each(tail, function)
    end

# iex> c("my_list.ex")
# iex> MyList.each(enchanted_items, fn item -> IO.puts item.title end)
# Edwin's Longsword
# Healing Potion
# Edwin's Rope
# Dragon's Spear

    def map([], _function), do: []
    def map([head | tail], function) do
        [function.(head) | map(tail, function)]
    end
#     iex> c("my_list.ex")
# iex> increase_price = fn i -> %{title: i.title, price: i.price * 1.1} end
# iex> MyList.map(enchanted_items, increase_price)
# [%{price: 165.0, title: "Edwin's Longsword"},
# %{price: 66.0, title: "Healing Potion"},
# %{price: 33.0, title: "Edwin's Rope"},
# %{price: 110.00000000000001, title: "Dragon's Spear"}]

# iex> increase_price = fn item -> update_in(item.price, &(&1 * 1.1)) end
# iex> MyList.map(enchanted_items, increase_price)
# [%{price: 165.0, title: "Edwin's Longsword"},
# %{price: 66.0, title: "Healing Potion"},
# %{price: 33.0, title: "Edwin's Rope"},
# %{price: 110.00000000000001, title: "Dragon's Spear"}]


# items = ["dogs", "cats", "flowers"]
# iex> MyList.map(items, &String.capitalize/1)
# ["Dogs", "Cats", "Flowers"]
# iex> MyList.map(items, &String.upcase/1)
# ["DOGS", "CATS", "FLOWERS"]
# iex> MyList.map(["45.50", "32.12", "86.0"], &String.to_float/1)
# [45.5, 32.12, 86.0]

    def reduce([], acc, _function), do: acc
    def reduce([head | tail], acc, function) do
        reduce(tail, function.(head, acc), function)
    end

# iex> c("my_list.ex")
# iex> sum_price = fn item, sum -> item.price + sum end
# iex> MyList.reduce(enchanted_items, 0, sum_price)
# 340

    def filter([], _function), do: []
    def filter([head | tail], function) do
        if function.(head) do
            [head | filter(tail, function)] 
        else
            filter(tail, function)
        end
    end

    
end

