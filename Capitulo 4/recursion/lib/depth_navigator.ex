defmodule DepthNavigator do
 @max_depth 2 # que ten largo quiero que recorra, podemos pasar de valor inicial 0
    def navigate(dir) do
        expanded_dir = Path.expanded_dir(dir)
        go_through([expanded_dir],0)
    end 

    defp go_through([], _current_depth), do: nil  # agregue _current_depth
    defp go_through(_dirs, current_depth) when current_depth > @max_depth, do: nil # agregue esta linea entera
    defp go_through([content | rest], current_depth) do   # agregue _current_depth
        print_and_navigate(content, File.dir?(content), current_depth) # agregue _current_depth
        go_through(rest, current_depth)   # agregue current_depth
    end

    defp print_and_navigate(_dir, false, _current_depth), do: nil # agregue _current_depth
    defp print_and_navigate(dir, true, current_depth) do # agregue current_depth
        IO.puts dir
        children_dirs = File.ls!(dir)
        go_through(expand_dirs(children_dirs, dir),current_depth + 1) # agregue _current_depth + 1
    end

    defp expand_dirs([], _relative_to), do: []
    defp expand_dirs([dir | dirs], relative_to) do
        expanded_dir=Path.expand(dir, relative_to)
        [expanded_dir | expand_dirs(dirs, relative_to)]
    end
end