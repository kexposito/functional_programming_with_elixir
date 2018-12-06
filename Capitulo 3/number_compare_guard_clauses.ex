defmodule NumberCompareWithGuardClauses do
    def greater( number , other_number) when number >= other_number, do: number
    def greater(_, other_number ), do: other_number
end


IO.puts("NumberCompareWithGuardClauses(6,2)")
IO.inspect(NumberCompareWithGuardClauses.greater(6, 2))

IO.puts("NumberCompareWithGuardClauses(1,8)")
IO.inspect(NumberCompareWithGuardClauses.greater(1, 8))

IO.puts("NumberCompareWithGuardclauses(2,2)")
IO.inspect(NumberCompareWithGuardClauses.greater(2, 2))
