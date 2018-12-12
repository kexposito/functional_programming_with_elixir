defmodule DungeonCrawl.Room.Triggers.Empty do
    @behaviour DungeonCrawl.Room.Trigger

    alias Mix.Shell.IO, as: Shell 
    def run(character, %DungeonCrawl.Room.Action{id: :forward}) do
        Shell.info("Its an empty room, Well you are safe at least. ")        
        {character, :forward}
    end
end