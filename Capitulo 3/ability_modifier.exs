user_input = IO.gets "Write your ability score:\n"
{ability_score,_} = Integer.parse(user_input) # usuario ingresa numero donde se guardara en ability_score
ability_modifier = ( ability_score - 10 ) / 2
IO.puts "Your ability modifier is #{ability_modifier}" 

# para correr este compilado se usa elixir ability_modifier.exs