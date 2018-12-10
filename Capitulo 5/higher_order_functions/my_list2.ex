def map([], _function), do: []
def map([head | tail], function) do
    [function.(head) | map(tail, function)]
end