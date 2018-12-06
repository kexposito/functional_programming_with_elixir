defmodule EvenOrOddtWithGuardClauses do
    require Integer

    def check(number) when Integer.is_even(number), do: "even"
    def check(number) when Integer.is_odd(number), do: "odd"
end


IO.puts("EvenOrOddtWithGuardClauses(42)")
IO.inspect(EvenOrOddtWithGuardClauses.check(42))

IO.puts("EvenOrOddtWithGuardClauses(43)")
IO.inspect(EvenOrOddtWithGuardClauses.check(43))

