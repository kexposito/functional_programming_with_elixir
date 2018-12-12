defmodule DungeonCrawl.Room.Triggers.Treasure do
    @behaviour DungeonCrawl.Room.Trigger

    alias Mix.Shell.IO, as: Shell 
    def run(character, %DungeonCrawl.Room.Action{id: :forward}) do
        Shell.info("You find a trasure with a potion!")        
        {character, :forward}
    end
end