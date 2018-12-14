defmodule DungeonCrawl.Room.Triggers.Treasure do
    @behaviour DungeonCrawl.Room.Trigger

    import DungeonCrawl.CLI.BaseCommands 

    alias Mix.Shell.IO, as: Shell 
    def run(character, %DungeonCrawl.Room.Action{id: :forward}) do
        Shell.info("You find a trasure with a potion!")   
        Shell.info("5 points more for you")
        new_char = DungeonCrawl.Character.add_score(character, 5)     
        {new_char, :forward}
    end

    def run(character, %DungeonCrawl.Room.Action{id: :inventary}) do
        # ver todo lo que guardeen el inventario enemy = Enum.random(DungeonCrawl.Enemies.all)
        # Shell.info(enemy.description)
        # invetary
       #    display_options
       # Shell.info("You were prepared and attack first.")
       # {updated_char, enemy} = DungeonCrawl.Battle.fight(character, enemy, :yes)
       # {updated_char, :inventary}
       inventary = [:potions]
        inventary
            |> display_options
       {character, :inventary}
    end


end