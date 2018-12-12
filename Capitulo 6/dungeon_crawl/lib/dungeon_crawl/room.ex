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
            chance: %{medium: 0,hard: 0} # no es lo mismo que esto   chance: %{"medium" => 0,hard: 0}


        },
        %Room{
            description: "You can see an enemy blocking your path.",
            actions: [forward()],
            trigger: Triggers.Enemy,
            chance: %{medium: 0, hard: 0}

        },
        %Room{
            description: "Nothing here.",
            actions: [forward()],
            trigger: Triggers.Empty,
            chance: %{medium: 100,hard: 0}

        },
        # %Room{
        #     description: "Nothing here.",
        #     actions: [forward()],
        #     trigger: Triggers.Treasure,
        #     medium: 100, 
        #     hard: 0 #chance: %{medium: 30, hard: 20}
        # },
    ]
 
end