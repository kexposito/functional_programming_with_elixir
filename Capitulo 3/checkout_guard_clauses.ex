defmodule CheckoutWithGuardClauses do
    def total_cost(price, tax_rate) when price >=0 and tax_rate >=0 do
        price * (tax_rate + 1)
    end    
end

IO.puts("CheckoutWithGuardClauses(40, 0.1)")
IO.inspect(CheckoutWithGuardClauses.total_cost(40, 0.1))

#IO.puts("CheckoutWithGuardClauses(-2, 0.2)")
#IO.inspect(CheckoutWithGuardClauses.total_cost(-2, 0.2))
# error por ser negativo
