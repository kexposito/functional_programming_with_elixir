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
            chance: %{medium: 0,hard: 0}, # no es lo mismo que esto   chance: %{"medium" => 0,hard: 0}
        },
        %Room{
            description: "You can see an enemy blocking your path.",
            actions: [forward(), inventary()],
            trigger: Triggers.Enemy,
            chance: %{medium: 30, hard: 100},
        },
        %Room{
            description: "Nothing here.",
            actions: [forward(), inventary(), rest()],
            trigger: Triggers.Empty,
            chance: %{medium: 100,hard: 50}, # valores por default chance: %{medium: 100,hard: 50},
            
        },
        %Room{
            description: "Something shines..",
            actions: [forward(), inventary(), search()],
            trigger: Triggers.Treasure,
            chance: %{medium: 50,hard: 50},
       
        },
        %Room{
            description: "Whoops! Trap here.",
            actions: [forward(), inventary()],
            trigger: Triggers.Trap,
            chance: %{medium: 100,hard: 50},
       
        },
    ]

    def update_rooms([], _), do: []
    def update_rooms([room = %{trigger: Triggers.Exit} | incoming_room], score) do
    #when room.chance[medium] < 100 and room.chance[hard] < 100 do
        # room = put_in(room[:chance][:medium], 150) 
        # room = put_in(room[:chance][:hard], 150)

        room = put_in(room.chance[:medium], 10 * score) 
        room = put_in(room.chance[:hard], 5 * score)
        IO.inspect(room)

       # room = put_in(room.chance[:medium], room.chance.medium + 20)
        #IO.inspect(room)
        [room | update_rooms(incoming_room, score)]
    end
    def update_rooms([room | incoming_room], score) do # si [item = %{magic: true} | incoming_item]
        [room | update_rooms(incoming_room, score)]
    end

# https://hexdocs.pm/elixir/Access.html
# The bracket-based syntax, user[:name], is used by dynamic structures, is extensible and returns nil on misisng keys.
# The dot-based syntax, user.name, is used exclusively to access atom keys in maps and structs, and it raises on missing keys.

 
end