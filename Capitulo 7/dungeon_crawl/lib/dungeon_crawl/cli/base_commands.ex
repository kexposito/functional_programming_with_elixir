defmodule DungeonCrawl.CLI.BaseCommands do
    use Monad.Operators
    alias Mix.Shell.IO, as: Shell
    import Monad.Result, only: [success: 1, success?: 1, error: 1, return: 1]
# en caso de usar TRY CATCH THROW
    # def ask_for_option(options) do
    #     try do
    #     options
    #     |> display_options
    #     |> generate_question
    #     |> Shell.prompt
    #     |> parse_answer
    #     |> find_option_by_index(options)
    #     catch
    #     {:error, message} ->
    #     display_error(message)
    #     ask_for_option(options)
    #     end
    #     end

    # def display_error(message) do
    #     Shell.cmd("clear")
    #     Shell.error(message)
    #     Shell.prompt("Press Enter to continue.")
    #     Shell.cmd("clear")
    #     end

    # OR
    # def ask_for_option(options) do
    #     options
    #     |> display_options
    #     |> generate_question
    #     |> Shell.prompt
    #     |> parse_answer
    #     |> find_option_by_index(options)
    #     catch
    #     {:error, message} ->
    #     display_error(message)
    #     ask_for_option(options)
    #     end




    def ask_for_option(options) do
        result =
          return(options)
            ~>> (&display_options/1) # monad depende de una funcion anonima
            ~>> (&generate_question/1)
            ~>> (&Shell.prompt/1)
            ~>> (&parse_answer/1)
            ~>> (&(find_option_by_index(&1, options)))
    
        if success?(result) do
          result.value
        else
          display_error(result.error)
          ask_for_option(options)
        end
      end
    
      def display_error(message) do
        Shell.cmd("clear")
        Shell.error(message)
        Shell.prompt("Press Enter to continue.")
        Shell.cmd("clear")
      end
    
      def display_options(options) do
        options
        |> Enum.with_index(1)
        |> Enum.each(fn {option, index} ->
          Shell.info("#{index} - #{option}")
        end)
    
        return(options)
      end
    
      def generate_question(options) do
        options = Enum.join(1..Enum.count(options),",")
        "Which one? [#{options}]\n"
      end
    
      def parse_answer(answer) do
        case Integer.parse(answer) do
          :error -> error("Invalid option")
          {option, _} -> success(option - 1)
        end
      end
    
      def find_option_by_index(index, options) do
        case Enum.at(options, index) do
          nil -> error("Invalid option")
          chosen_option -> success(chosen_option)
        end
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