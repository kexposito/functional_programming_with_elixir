defmodule DungeonCrawl.Room.Trigger do
    alias DungeonCrawl.Character
    alias DungeonCrawl.Room.Action
    
    # con @callback queremos definir una regla
    @callback run(Character.t , Action.t) :: {Character.t, atom} # esperamos un character y un room
end