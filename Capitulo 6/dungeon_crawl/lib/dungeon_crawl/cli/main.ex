defmodule DungeonCrawl.CLI.Main do
    alias Mix.Shell.IO, as: Shell #esto nos permite interactuar con la terminal

    def start_game do
        welcome_message()
        Shell.prompt("Press Enter to continue")
        difficulty_choice()
        crawl(hero_choice(), DungeonCrawl.Room.all()) # random room
    end
    
    defp welcome_message do
        Shell.info("== Dungeon Crawl ===")
        Shell.info("You awake in a dungeon full of monsters.")
        Shell.info("You need to survive and find the exit.")
    end

    defp hero_choice do
        hero = DungeonCrawl.CLI.HeroChoice.start()
        %{hero | name: "You"}
    end

    defp difficulty_choice do
        hero = DungeonCrawl.CLI.DifficultyChoice.start()
        %{hero | name: "You"}
    end

    defp crawl(%{hits_points: 0}, _) do
        Shell.prompt("")
        Shell.cmd("clear")
        Shell.info("Unfortunately your wounds are too many to keep walking.")
        Shell.info("You fall onto the floor without strength to carry on.")
        Shell.info("Game over!")
        Shell.prompt("")
    end


    defp crawl(character, rooms) do
        Shell.info("You keep moving forward to the next room.")
        Shell.prompt("Press Enter to continue")
        Shell.cmd("clear")

        Shell.info(DungeonCrawl.Character.current_stats(character))
        mark = Enum.random(1..100)

        rooms
        |> Enum.filter(fn room -> Map.get(room.chance, :medium) >= mark end)  
       # |> Enum.filter(fn room -> (room.chance.medium) >= mark end)
        |> Enum.random()  
       # |> random_by_difficulty("medium")  #   |> Enum.filter(fn %{chance: x} -> Enum.member?(mark,x)) end)
        |> DungeonCrawl.CLI.RoomActionsChoice.start
        |> trigger_action(character)
        |> handle_action_result
    end

    def random_by_difficulty(rooms, difficulty) do
        mark = Enum.random(1..100)
        IO.puts "Numero aleatoreo"
        IO.inspect mark
        rooms
        |> Enum.filter(fn room -> room.chance[difficulty] >= mark end)
        |> Enum.random()
      end


    defp trigger_action({room, action}, character) do
        Shell.cmd("clear")
        room.trigger.run(character, action)
    end

    defp handle_action_result({_, :exit}),
        do: Shell.info("You found the exit. You won the game. Congratulations!")

    defp handle_action_result({character, _}),
        do: crawl(character, DungeonCrawl.Room.all())

    

    
end