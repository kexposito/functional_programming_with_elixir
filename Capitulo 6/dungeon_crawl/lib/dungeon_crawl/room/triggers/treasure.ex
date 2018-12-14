defmodule DungeonCrawl.Room.Triggers.Treasure do
    @behaviour DungeonCrawl.Room.Trigger

    import DungeonCrawl.CLI.BaseCommands 

    alias Mix.Shell.IO, as: Shell 
    def run(character, %DungeonCrawl.Room.Action{id: :forward}) do
        Shell.info("You find a trasure with a potion!")     
        {character, :forward}
    end
    def run(character, %DungeonCrawl.Room.Action{id: :search}) do
        Shell.info("You find a trasure with a potion!, Keep moving")   
        #Shell.info("5 points more for you")
        new_char = DungeonCrawl.Character.add_potion(character)     
        {new_char, :forward}
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

    defp confirm_dif(:exit, character) do
        Shell.cmd("clear")
        Shell.info("Sure you want to return?")
        if Shell.yes?("Confirm?"), do: character#run(character, %DungeonCrawl.Room.Action{id: :forward})
    end

end