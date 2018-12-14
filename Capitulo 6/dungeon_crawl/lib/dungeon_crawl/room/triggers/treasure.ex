defmodule DungeonCrawl.Room.Triggers.Treasure do
    @behaviour DungeonCrawl.Room.Trigger

    import DungeonCrawl.CLI.BaseCommands
    import DungeonCrawl.Room
    import DungeonCrawl.CLI.RoomActionsChoice

    alias Mix.Shell.IO, as: Shell 
    def run(character, %DungeonCrawl.Room.Action{id: :forward}) do
        Shell.info("You find a trasure with a potion!")     
        {character, :forward}
    end

    def run(character, %DungeonCrawl.Room.Action{id: :search}) do
        character = DungeonCrawl.Character.add_score(character, 2)
        Shell.info("You find a trasure with a potion!, Keep moving")   
        #Shell.info("5 points more for you")
        new_char = DungeonCrawl.Character.add_potion(character)     
        {new_char, :search}
    end

    def run(character, %DungeonCrawl.Room.Action{id: :inventary}) do
        my_inventary = [:potions, :exit]
        find_dif_by_index= &Enum.at(my_inventary, &1) 

        my_inventary
        |> display_options(character)
        |> generate_question 
        |> Shell.prompt
        |> parse_answer
        |> find_dif_by_index.()
        |> confirm_dif(character)

        {character, :inventary}
    end

    defp confirm_dif(:potions, %{potions: 0}) do
        Shell.cmd("clear")
        Shell.info("You dont have potions")
    end

    defp confirm_dif(:potions, character) do
        Shell.cmd("clear")
        new_character = DungeonCrawl.Character.heal(character, 3)
        new_character
    end

    defp confirm_dif(:exit, character) do # le tengo q pasar un cuarto como de manera
        Shell.cmd("clear")
        Shell.info("Sure you want to return?")
        rooms = DungeonCrawl.Room.all()
        filter_type = DungeonCrawl.Room.filter_rooms(rooms,Triggers.Treasure)
        #IO.inspect(List.first(filter_type))
        if Shell.yes?("Confirm?"), do: DungeonCrawl.CLI.RoomActionsChoice.start(List.first(filter_type)) # aca le tengo q pasar el Room
    end

end