defmodule DungeonCrawl.Battle do
    alias DungeonCrawl.Character
    alias Mix.Shell.IO, as: Shell
    
    def fight(# chequeo si alguno de los dos tiene 0 de hit_points, y los devuelvo
        char_a = %{hit_points: hit_points_a},
        char_b = %{hit_points: hit_points_b}
    ) when hit_points_a == 0 or hit_points_b == 0, do: {char_a, char_b}

    # pelea si el personaje sale corriendo y almenos tiene que darle un golpe
    def fight(char_a, char_b, :no) do  
        IO.puts("#{char_b.name} wants to hit youbefore you run!")
        char_b_after_damage = attack(char_a, char_b)
       # char_a_after_damage = attack(char_b_after_damage, char_a)
        {char_a, char_b}
    #    fight(char_a_after_damage, char_b_after_damage)
    end

    def fight(char_a, char_b, _) do  # sino, cada uno de los personajes se ataca, usando la funcion attack
        char_b_after_damage = attack(char_a, char_b)
        char_a_after_damage = attack(char_b_after_damage, char_a)
        fight(char_a_after_damage, char_b_after_damage)
    end

    defp attack(%{hit_points: hit_points_a}, character_b) # si no tengo mas puntos de ataque no hago nada
        when hit_points_a == 0, do: character_b
    
    defp attack(char_a, char_b) do # sino realizo un ataque con dano random

        damage = Enum.random(char_a.damage_range)
        char_b_after_damage = Character.take_damage(char_b, damage)
    
        char_a
            |> attack_message(damage) # muestro en consola
            |> Shell.info

        char_b_after_damage
            |> receive_message(damage) # muestro en consola
            |> Shell.info

        char_b_after_damage
    end

    defp attack_message(character = %{name: "You"}, damage) do
        "You attack with #{character.attack_description} " <>
        "and deal #{damage}."
    end

    defp attack_message(character, damage) do
        "#{character.name} attack with " <>
        "#{character.attack_description} and " <>
        "deals #{damage} damage"
    end

    defp receive_message(character = %{name: "You"}, damage) do
        "You receive #{damage}. Current HP: #{character.hit_points}."
    end

    defp receive_message(character, damage) do 
        "#{character.name} receives #{damage}. " <>
        "Current HP: #{character.hit_points}."
    end
end