defmodule NumberCompare do
    def greater(number, other_number) do
        exp = number >= other_number
        check(exp, number, other_number)
    end

    defp check(true , number , _ ), do: number #private function
    defp check(false , _ , other_number ), do: other_number #private function
 
end


IO.puts("NumberCompare(6,2)")
IO.inspect(NumberCompare.greater(6, 2))

IO.puts("NumberCompare(1,8)")
IO.inspect(NumberCompare.greater(1, 8))

IO.puts("NumberCompare(2,2)")
IO.inspect(NumberCompare.greater(2, 2))
