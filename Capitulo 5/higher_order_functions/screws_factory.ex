defmodule ScrewsFactory do

        # iex> c("screws_factory.ex")
        # iex> metal_pieces = Enum.take(Stream.cycle(["-"]), 1000)
        # iex> ScrewsFactory.run(metal_pieces)

    def run(pieces) do # EAGER ( si no necesitamos los resultados instantaneamente, procesa todos par luego mandarlos juntos) 
        pieces                          # LAZY v1
        |> Enum.map(&add_thread/1) #  |> Stream.map(&add_head/1)
        |> Enum.map(&add_head/1)   #  |> Stream.map(&add_head/1)
        |> Enum.each(&output/1)    #  |> Enum.each(&output/1)
    end
    # diferencias entre Enum.map y Strean.map
    def run2(pieces) do # LAZY v2 ( los manda a medida que salen) # MEGA RAPIDO 
        pieces
        |> Stream.chunk(50) # acumula items antes de mandarlos a la siguiente funcion
        |> Stream.flat_map(&add_thread/1)
        |> Stream.chunk(100)
        |> Stream.flat_map(&add_head/1)
        |> Enum.each(&output/1)
    end
    # como funciona le chunk
    # iex> Enum.chunk([1, 2, 3, 4, 5, 6], 2)
    # [[1, 2], [3, 4], [5, 6]]

    # como funciona el flat_map
    # iex> Enum.flat_map([[1, 2], [3, 4], [5, 6]], &(&1))
    # [1, 2, 3, 4, 5, 6]
    
    defp add_thread(pieces) do
        Process.sleep(50)
        Enum.map(pieces, &(&1 <> "--"))
    end
    defp add_head(pieces) do
        Process.sleep(100)
        Enum.map(pieces, &("o" <> &1))
    end

    defp output(screw) do
        IO.inspect(screw)
    end
end