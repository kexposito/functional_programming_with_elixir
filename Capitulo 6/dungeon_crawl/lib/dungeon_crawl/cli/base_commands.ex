defmodule DungeonCrawl.CLI.BaseCommands do
    alias Mix.Shell.IO, as: Shell

    def display_options(options) do
        options
        |> Enum.with_index(1)
        |> Enum.each(fn {option, index} -> 
            Shell.info("#{index} - #{option}") # #{DungeonCrawl.Display.info(option)}"
        end)
        options
    end

    def generate_question(options) do
        options = Enum.join(1..Enum.count(options), ",")
        "Wich One? [#{options}]\n"
    end

    def parse_answer(answer) do
        {option, _} = Integer.parse(answer)
        option - 1
    end
end


# A green evil creature. Wears armor and an axe.
# The enemy Orc wants to fight.
# You were prepared and attack first.
# You attack with a sword and deal 4.
# Orc receives 4. Current HP: 4.
# ** (UndefinedFunctionError) function :ok.damage_range/0 is undefined (module :ok is not available)
#     :ok.damage_range()
#     lib/dungeon_crawl/battle.ex:20: DungeonCrawl.Battle.attack/2
#     lib/dungeon_crawl/battle.ex:12: DungeonCrawl.Battle.fight/2
#     lib/dungeon_crawl/room/triggers/enemy.ex:11: DungeonCrawl.Room.Triggers.Enemy.run/2
#     lib/dungeon_crawl/cli/main.ex:30: DungeonCrawl.CLI.Main.crawl/2
#     (mix) lib/mix/task.ex:316: Mix.Task.run_task/3
#     (mix) lib/mix/cli.ex:79: Mix.CLI.run_task/2