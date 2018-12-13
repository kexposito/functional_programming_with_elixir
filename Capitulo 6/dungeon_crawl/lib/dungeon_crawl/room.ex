defmodule DungeonCrawl.Room do
    alias DungeonCrawl.Room
    alias DungeonCrawl.Room.Triggers

    import DungeonCrawl.Room.Action

    defstruct description: nil, actions: [], trigger: nil, chance: nil

    def all, do: [
        %Room{
            description: "You can see the light of day. You found the exit!.",
            actions: [forward()],
            trigger: Triggers.Exit,
            chance: %{medium: 0,hard: 10}, # no es lo mismo que esto   chance: %{"medium" => 0,hard: 0}
           
        },
        %Room{
            description: "You can see an enemy blocking your path.",
            actions: [forward()],
            trigger: Triggers.Enemy,
            chance: %{medium: 100, hard: 100},
        },
        %Room{
            description: "Nothing here.",
            actions: [forward()],
            trigger: Triggers.Empty,
            chance: %{medium: 0,hard: 50},
            

        },
        %Room{
            description: "Something shines..",
            actions: [forward()],
            trigger: Triggers.Treasure,
            chance: %{medium: 0,hard: 50},
       
        },
    ]
 
end