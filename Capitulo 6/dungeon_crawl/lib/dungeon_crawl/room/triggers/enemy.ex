defmodule DungeonCrawl.Room.Triggers.Enemy do
    @behaviour DungeonCrawl.Room.Trigger

    import DungeonCrawl.CLI.BaseCommands 


    alias Mix.Shell.IO, as: Shell 
    def run(character, %DungeonCrawl.Room.Action{id: :forward}) do
        enemy = Enum.random(DungeonCrawl.Enemies.all)
        character = DungeonCrawl.Character.add_score(character, 1)

        Shell.info(enemy.description)
        Shell.info("The enemy #{enemy.name} wants to fight.")
        Shell.info("You were prepared and attack first.")
        {updated_char, enemy} = DungeonCrawl.Battle.fight(character, enemy, :yes)
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

    # defp trigger_action({room, action}, character) do
    #     Shell.cmd("clear")
    #     room.trigger.run(character, action)
    # end

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
        if Shell.yes?("Confirm?"), do: run(character, %DungeonCrawl.Room.Action{id: :forward})
    end

end