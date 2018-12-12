defmodule DungeonCrawl.Room.Triggers.Exit do
    @behaviour DungeonCrawl.Room.Trigger # se sigue del contrato de Roomtrigger con el behaviour
    def run(character, _), do: {character, :exit}
end