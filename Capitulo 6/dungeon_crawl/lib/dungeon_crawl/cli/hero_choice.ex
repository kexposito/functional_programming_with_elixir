defmodule DungeonCrawl.CLI.HeroChoice do
    alias Mix.Shell.IO, as: Shell
    import DungeonCrawl.CLI.BaseCommands # importo los comandos para usar display_options, generate_question, parse_answer

    def start do
        Shell.cmd("clear") # que interactue con la terminal para limpiar la pantalla
        Shell.info("Start by choosing your hero:")

        heroes = DungeonCrawl.Heroes.all()
        find_hero_by_index= &Enum.at(heroes, &1) # https://hexdocs.pm/elixir/Enum.html#at/3

        heroes
        #|> Enum.map(&(&1.name)) # https://hexdocs.pm/elixir/Enum.html#map/2
        |> display_options # importado desde  BaseCommands
        |> generate_question # importado desde  BaseCommands
        |> Shell.prompt
        |> parse_answer # importado desde  BaseCommands
        |> find_hero_by_index.()
        |> confirm_hero
    end

    defp confirm_hero(chosen_hero) do
        Shell.cmd("clear")
        Shell.info(chosen_hero.description)
        if Shell.yes?("Confirm?"), do: chosen_hero, else: start()
    end



end