defmodule DungeonCrawl.Character do

    @type t :: %DungeonCrawl.Character{ # este type tiene como nombre y y se define luego de  ::
        name: String.t,
        description: String.t,
        hit_points: non_neg_integer,
        max_hit_points: non_neg_integer,
        attack_description: String.t,
        damage_range: Range.t,
        #score: non_neg_integer
      
    }
    

    defstruct name: nil,
              description: nil,
              hit_points: 0,
              max_hit_points: 0,
              attack_description: nil,
              damage_range: nil,
              score: 0,
              potions: 0
              

        defimpl String.Chars do
            def to_string(character), do: character.name
         #   def to_string(character[:inventary]), do: character[:inventary]
        end

        def take_damage(character, damage) do
            new_hit_points = max(0, character.hit_points - damage)
            %{character | hit_points: new_hit_points} # actualizamos el valor
        end


        # def heal(character = %{potions: 0}, heal_value) do
        #     Sell.info("You dont have potions to use")
        #     %{character} # actualizamos el valor
        # end

        def heal(character, heal_value) do
            new_hit_points = min(
                character.hit_points + heal_value,
                character.max_hit_points
            )
             new = %{character | hit_points: new_hit_points}
             %{new | potions: new.potions -1}
           
             # actualizamos el valor
        end

        def add_score(character, points) do
              new_points = character.score + points
              %{character | score: new_points} 
        end

        def add_potion(character) do
            %{character | potions: character.potions + 1} 
      end

        def current_stats(character),
            do: "Player Stats\nHP: #{character.hit_points}/#{character.max_hit_points}"
end