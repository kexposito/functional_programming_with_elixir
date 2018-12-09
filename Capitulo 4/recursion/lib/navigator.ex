defmodule Navigator do
    def navigate(dir) do
        expanded_dir = Path.expanded_dir(dir)
        go_through([expanded_dir])
    end 

    defp go_through([]), do: nil # condicion para detenerse
    defp go_through([content | rest]) do   # para cada uno intentamos imprimir el path
        print_and_navigate(content, File.dir?(content)) # y navegamos hacia sus hijos
        go_through(rest) # y llamamos recursivamente para recorrer el directorio
    end

    defp print_and_navigate(_dir, false), do: nil # condicion para detenerse, se detiene cuando encuentra algo que no es un directorio
    defp print_and_navigate(dir,true) do # sino chequea todo dentro del directio con la dir
        IO.puts dir
        children_dirs = File.ls!(dir)
        go_through(expand_dirs(children_dirs, dir))
    end

    defp expand_dirs([], _relative_to), do: []
    defp expand_dirs([dir | dirs], relative_to) do
        expanded_dir=Path.expand(dir, relative_to)
        [expanded_dir | expand_dirs(dirs, relative_to)]
    end
end