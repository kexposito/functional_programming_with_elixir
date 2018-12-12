defmodule DungeonCrawl.CLI.DifficultyChoice do
    alias Mix.Shell.IO, as: Shell
    import DungeonCrawl.CLI.BaseCommands 

    def start do
        Shell.cmd("clear") 
        Shell.info("Choose Difficulty :")

        difficult = [:medium, :hard]        # no es lo mismo que  difficult = ["medium", "hard"]
        find_dif_by_index= &Enum.at(difficult, &1) 

        difficult
        |> display_options
        |> generate_question 
        |> Shell.prompt
        |> parse_answer
        |> find_dif_by_index.()
        |> confirm_dif
    end

    defp confirm_dif(chosen_dif) do
        Shell.cmd("clear")
        Shell.info("Sure you want to play #{chosen_dif} mode?")
        if Shell.yes?("Confirm?"), do: chosen_dif, else: start()
    end
end