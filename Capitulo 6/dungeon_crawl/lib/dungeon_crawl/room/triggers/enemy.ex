defmodule DungeonCrawl.Room.Triggers.Enemy do
    @behaviour DungeonCrawl.Room.Trigger

    import DungeonCrawl.CLI.BaseCommands 


    alias Mix.Shell.IO, as: Shell 
    def run(character, %DungeonCrawl.Room.Action{id: :forward}) do
        enemy = Enum.random(DungeonCrawl.Enemies.all)
        Shell.info(enemy.description)
        Shell.info("The enemy #{enemy.name} wants to fight.")
        Shell.info("You were prepared and attack first.")
        {updated_char, enemy} = DungeonCrawl.Battle.fight(character, enemy, :yes)
        {updated_char, :forward}
    end

    def run(character, %DungeonCrawl.Room.Action{id: :inventary}) do
        # ver todo lo que guardeen el inventario enemy = Enum.random(DungeonCrawl.Enemies.all)
        # Shell.info(enemy.description)
        # invetary
       #    display_options
       # Shell.info("You were prepared and attack first.")
       # {updated_char, enemy} = DungeonCrawl.Battle.fight(character, enemy, :yes)
       # {updated_char, :inventary}
        #inventary = character[:inventary]
        inventary = [:potions]
        inventary
            |> display_options
       {character, :inventary}
    end

end