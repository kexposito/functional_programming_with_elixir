defmodule TicTacToe do

    def winner(item) do
     case item do
            {a,a,a,_,_,_,_,_,_}  -> {:winner, a}
            {a,_,_,a,_,_,a,_,_}  -> {:winner, a}
            {a,_,_,_,a,_,_,_,a}  -> {:winner, a}
            {_,a,_,_,a,_,_,a,_}  -> {:winner, a}
            {_,_,a,_,a,_,a,_,_}  -> {:winner, a}
            {_,_,_,a,a,a,_,_,_}  -> {:winner, a}
            {_,_,a,_,_,a,_,_,a}  -> {:winner, a}
            {_,_,_,_,_,_,a,a,a}  -> {:winner, a}
            _ -> :no_winner
            end
    end   
end

defmodule TicTacToe2 do
    def winner({
        a, a, a,
        _, _, _,
        _, _, _
    }), do: {:winner, a}

    def winner({
        a, _, _,
        a, _, _,
        a, _, _
    }), do: {:winner, a}

    def winner({
        a, _, _,
        _, a, _,
        _, _, a
    }), do: {:winner, a}

    def winner({
        _, a, _,
        _, a, _,
        _, a, _
    }), do: {:winner, a}

    def winner({
        _, _, a,
        _, a, _,
        a, _, _
    }), do: {:winner, a}

    def winner({
        _, _, _,
        a, a, a,
        _, _, _
    }), do: {:winner, a}

    def winner({
        _, _, a,
        _, _, a,
        _, _, a
    }), do: {:winner, a}

    def winner({
        _, _, _,
        _, _, _,
        a, a, a
    }), do: {:winner, a}

    def winner(_a), do: :no_winner
end

IO.puts "TocTacToe.winner  ({:x, :o, :x, :o, :x, :o, :o, :o, :x})"
IO.inspect(TicTacToe.winner({:x, :o, :x, :o, :x, :o, :o, :o, :x}))

IO.puts "TocTacToe.winner  ({:x, :o, :x, :o, :x, :o, :o, :x, :o})"
IO.inspect(TicTacToe.winner({:x, :o, :x, :o, :x, :o, :o, :x, :o}))