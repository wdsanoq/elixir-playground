defmodule MyString do
  def printable_ascii(s), do: Enum.all?(s, fn ch -> ch in ?\s..?~ end)

  def anagram?(word1, word2), do: Enum.sort(word1) == Enum.sort(word2)
end

IO.inspect(MyString.printable_ascii('test!'))
IO.inspect(MyString.anagram?('cat', 'act'))
