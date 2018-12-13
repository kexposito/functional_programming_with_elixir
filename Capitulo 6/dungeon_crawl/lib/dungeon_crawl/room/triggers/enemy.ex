defmodule DungeonCrawl.Room.Triggers.Enemy do
    @behaviour DungeonCrawl.Room.Trigger

    alias Mix.Shell.IO, as: Shell 
    def run(character, %DungeonCrawl.Room.Action{id: :forward}) do
        enemy = Enum.random(DungeonCrawl.Enemies.all)
        Shell.info(enemy.description)
        Shell.info("The enemy #{enemy.name} wants to fight.")
        Shell.info("You were prepared and attack first.")
        
        {updated_char, enemy} = DungeonCrawl.Battle.fight(character, enemy, ask_hero(enemy))
        {updated_char, :forward}
    end

    defp ask_hero(enemy) do
        Shell.cmd("clear")
        Shell.info("Sure you want to fight with #{enemy.name} ?")
        if Shell.yes?("Confirm?"), do: :yes, else: :no
    end

end