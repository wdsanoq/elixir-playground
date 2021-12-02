defmodule Greeter do
  def for(name, greeting) do
    fn
      ^name -> "#{greeting} #{name}"
      _ -> "I don't know you"
    end
  end
end

mg = Greeter.for("Hose", "oi")

IO.puts(mg.("Hose"))
IO.puts(mg.("Fose"))
