user_input = IO.gets "Write your ability score: \n"
case Integer.parse(user_input) do
    :error -> IO.puts "Invalid ability score: #{user_input}"
    {ability_score,_}  when ability_score >=0 -> # ability_score lo capturo con lo ingresado
        ability_modifier = (ability_score - 10) / 2
        IO.puts "Your ability modifier is #{ability_modifier}"

        # en caso de querer agregar mas condiciones como que si es negativo me imrima la aaa:
    #{ability_score,_}  when ability_score <0 -> # ability_score lo capturo con lo ingresado
     #   ability_modifier = (ability_score - 10) / 2
      #  IO.puts "aaaa #{ability_modifier}"

end

#parse(binary, base \\ 10) View Source
#parse(binary(), 2..36) :: {integer(), binary()} | :error
# elixir ability_modifier_ControlFlows.exs