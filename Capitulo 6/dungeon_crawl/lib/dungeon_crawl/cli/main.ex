defmodule DungeonCrawl.CLI.Main do
    alias Mix.Shell.IO, as: Shell #esto nos permite interactuar con la terminal

    def start_game do
        welcome_message()
        
        Shell.prompt("Press Enter to continue")
        crawl(hero_choice(),difficulty_choice() , DungeonCrawl.Room.all()) # random room
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
        dif = DungeonCrawl.CLI.DifficultyChoice.start()
        %{chance: dif}
    end

    
    defp crawl(character = %{hit_points: 0}, _, _) do # como saco el heroe de aca : %{hit_points: 0}
        Shell.prompt("")
        Shell.cmd("clear")
        Shell.info("Unfortunately your wounds are too many to keep walking.")
        Shell.info("You fall onto the floor without strength to carry on.")
        Shell.info("Game over!")
        player_name = Shell.prompt("Write your name: ")
        # https://hexdocs.pm/elixir/File.html
        File.open("Score.txt", [:append], &(IO.write(&1,"Player Name: #{player_name}Hero: #{character.name} -- Score: #{character.score} \n" ))) #cambiar por el score
        Shell.prompt("")
    end

    
    defp crawl(character, dif, rooms) do
        Shell.info("You keep moving forward to the next room.")
        Shell.prompt("Press Enter to continue")
        Shell.cmd("clear")
        IO.inspect(character.hit_points)
        Shell.info(DungeonCrawl.Character.current_stats(character))
        Shell.info("Player Score\nScore: #{character.score}")
        mark = Enum.random(1..100)


     #   rooms = DungeonCrawl.Room.update_exit(rooms, dif);
       # IO.inspect(rooms)

        #IO.inspect(dif.chance)
        #|> Enum.filter(fn room -> Map.get(room.chance,  dif.chance) >= mark end)  
        #|> Enum.filter(fn room -> (room.chance.dif) >= mark end)
        #|> random_by_difficulty("medium")  #   |> Enum.filter(fn %{chance: x} -> Enum.member?(mark,x)) end)
        IO.inspect(rooms)
        rooms = DungeonCrawl.Room.update_rooms(rooms, character.score)
        

        rooms
        |> Enum.filter(fn room -> room.chance[dif.chance] >= mark end)
        |> Enum.random()  
        |> DungeonCrawl.CLI.RoomActionsChoice.start
        |> trigger_action(character)
        |> handle_action_result(dif)
    end
    
    # def random_by_difficulty(rooms, dif) do
    #     mark = Enum.random(1..100)
    #     IO.puts "Numero aleatoreo"
    #     IO.inspect mark
    #     rooms
    #     |> Enum.filter(fn room -> room.chance[dif] >= mark end)
    #     |> IO.inspect
    #     |> Enum.random()
    #   end


    defp trigger_action({room, action}, character) do
        Shell.cmd("clear")
        room.trigger.run(character, action)
    end

    defp handle_action_result({_,:exit},_),
        do: Shell.info("You found the exit. You won the game. Congratulations!")

    defp handle_action_result({character,_},dif),
        do: crawl(character, dif,DungeonCrawl.Room.all()) # error que me los  vuelve a cargar



    
end

##### mayores errores ####
# iex(1)> %{a: 1}
# %{a: 1}
# iex(2)> %{a: 1}
# %{a: 1}
# iex(3)> quote do
# ...(3)> %{a: 1}
# ...(3)> end
# {:%{}, [], [a: 1]}
# iex(4)> %{a: 1}
# %{a: 1}
# iex(5)> %{a: 1} == %{:a => 1}
# true
# iex(6)> %{"a" => 1} == %{:a => 1}
# false
# iex(7)> map = %{"a" => 1}
# %{"a" => 1}
# iex(8)> map[:a]
# nil
# iex(9)> map["a"]
# 1
# iex(10)>