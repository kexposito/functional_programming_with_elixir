defprotocol DungeonCrawl.Display do# definicion de protocolo
    def info(value)#creamos el def sin cuerpo
end


defimpl DungeonCrawl.Display, for: DungeonCrawl.Room.Action do # a quien se aplica
    def info(action), do: action.label # como se aplica 
end

defimpl DungeonCrawl.Display, for: DungeonCrawl.Character do
    def info(character), do: character.name
end