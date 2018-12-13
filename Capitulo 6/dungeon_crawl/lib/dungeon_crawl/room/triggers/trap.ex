defmodule DungeonCrawl.Room.Triggers.Trap do
    @behaviour DungeonCrawl.Room.Trigger

    alias Mix.Shell.IO, as: Shell 
    def run(character, %DungeonCrawl.Room.Action{id: :forward}) do
        Shell.info("You find a trap!")   
        Shell.info(" -3 HP !")
        

        updated_char = DungeonCrawl.Character.take_damage(character, 3)            # esto hace que lo que devuelve DungeonCrawl.Character.take_damage se GUARDE y se devuelva lo que se guardo
        updated_char = DungeonCrawl.Character.add_score(updated_char, 1)
        {updated_char, :forward}
    end
end 