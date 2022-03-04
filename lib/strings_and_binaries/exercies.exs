defmodule MyString do
  def printable_ascii(s), do: Enum.all?(s, fn ch -> ch in ?\s..?~ end)
end

IO.inspect(MyString.printable_ascii('test!'))
