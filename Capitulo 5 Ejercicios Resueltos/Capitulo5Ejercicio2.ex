defmodule ScrewFactory do

    def pack(screws) do
        screws
        |> Stream.chunk(5) # 30 por paquete ,  chunk junta 30
        |> Stream.flat_map(&add_thread/1) # flat_map aplica la funcion 
        |> Stream.chunk(10)
        |> Stream.flat_map(&add_head/1)
        |> Stream.chunk(3) 
        |> Stream.flat_map(&pack_in_box/1)
        |> Enum.each(&output/1)
    end
    
    defp add_thread(screws) do
        Process.sleep(50)   
        Enum.map(screws, &(&1 <> "--")) # resultado final "|o--|"
    end

    defp add_head(screws) do
        Process.sleep(100)
        Enum.map(screws, &("o" <> &1))
    end

    defp pack_in_box(screws) do
        Process.sleep(70)
        Enum.map(screws, &("|"<> &1 <>"|"))
    end

    defp output(screw) do
        IO.inspect(screw)
    end
end

# iex> c("Capitulo5Ejercicio2.ex")
# iex> metal_pieces = Enum.take(Stream.cycle(["-"]), 1000)
# iex> ScrewFactory.pack(metal_pieces)
