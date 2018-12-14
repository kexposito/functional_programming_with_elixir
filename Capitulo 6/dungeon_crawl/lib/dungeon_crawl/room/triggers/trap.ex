defmodule DungeonCrawl.Room.Triggers.Trap do
    @behaviour DungeonCrawl.Room.Trigger

    import DungeonCrawl.CLI.BaseCommands 


    alias Mix.Shell.IO, as: Shell 
    def run(character, %DungeonCrawl.Room.Action{id: :forward}) do
        Shell.info("You find a trap!")   
        Shell.info(" -3 HP !")
        updated_char = DungeonCrawl.Character.take_damage(character, 3)            # esto hace que lo que devuelve DungeonCrawl.Character.take_damage se GUARDE y se devuelva lo que se guardo
        updated_char = DungeonCrawl.Character.add_score(updated_char, 1)
        {updated_char, :forward}
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

    defp confirm_dif(:potions, character = %{potions: 0}) do
        Shell.cmd("clear")
        Shell.info("You dont have potions")
    end

    defp confirm_dif(:potions, character) do
        Shell.cmd("clear")
        character = DungeonCrawl.Character.heal(character, 3)
    end

    defp confirm_dif(:exit, character) do
        Shell.cmd("clear")
        Shell.info("Sure you want to return?")
        if Shell.yes?("Confirm?"), do: DungeonCrawl.CLI.RoomActionsChoice.start()
    end
end 