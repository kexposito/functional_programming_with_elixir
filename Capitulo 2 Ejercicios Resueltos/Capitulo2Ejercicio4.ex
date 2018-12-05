defmodule MatchstickFactory do 
    def boxes (item)  do 
        bb=div(item,50)
        a=rem(item,50)

        mb=div(a,20)
        b=rem(a,20)

        sb=div(b,5)
        r=rem(b,5)

        %{big: bb , medium: mb ,rem: r, small: sb}
    
    end
end

#[a: 1]
#{:a, 1}
#%{a: 1}
#[:a, 1]
IO.puts("boxes(98)")
IO.inspect(MatchstickFactory.boxes(98))
IO.puts("boxes(39)")
IO.inspect(MatchstickFactory.boxes(39))
 #big fifty 
 #medium twenty 
 #small five

 #dive es l adivision
 #rem es el modulo