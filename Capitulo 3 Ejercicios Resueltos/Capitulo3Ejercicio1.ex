defmodule Capitulo3Ejercicio1 do
    def points(%{strength: s, dexterity: d, intelligence: i}) do
        s * 2 + (d + i) * 3
    #    %{
    #        strength: item.strength * 2,  
    #        dexterity: item.dexterity * 3,
    #        intelligence: item.intelligence * 3
    #    }
    end
end

IO.puts "Capitulo3Ejercicio1.points (%{strength: 4, dexterity: 5, intelligence: 6})"
IO.inspect(Capitulo3Ejercicio1.points(%{strength: 4, dexterity: 5, intelligence: 6}))

IO.puts "Capitulo3Ejercicio1.points (%{strength: 1, dexterity: 2, intelligence: 3})"
IO.inspect(Capitulo3Ejercicio1.points(%{strength: 1, dexterity: 2, intelligence: 3}))
