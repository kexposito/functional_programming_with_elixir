def dir?(dir) do
    {:ok, %{type: type}} = File.lstat(dir) # obtenemos el content type. pasando un path retorna
    type == :directory # un File.Stat que contiene el atributo del tipo 'type' con un valor atom. (:device | :directory | :regular | :other)
end  # si es un directorio debuelve :directory. cuando es un link simpolico devuelve :symlink


# https://hexdocs.pm/elixir/File.Stat.html