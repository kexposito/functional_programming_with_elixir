defmodule DungeonCrawl.Room.Triggers.Treasure do
    @behaviour DungeonCrawl.Room.Trigger

    alias Mix.Shell.IO, as: Shell 
    def run(character, %DungeonCrawl.Room.Action{id: :forward}) do
        Shell.info("You find a trasure with a potion!")   
        Shell.info("5 points more for you")
       # Shell.info(DungeonCrawl.Character.add_score(character, 5))     
        {character, :forward}
    end
end