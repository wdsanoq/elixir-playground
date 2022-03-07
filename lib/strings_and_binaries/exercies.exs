defmodule MyString do
  def printable_ascii(s), do: Enum.all?(s, fn ch -> ch in ?\s..?~ end)

  def anagram?(word1, word2), do: Enum.sort(word1) == Enum.sort(word2)

  def calculate(expression) do
    {number1, rest} = parse_number(expression)
    rest = skip_spaces(rest)
    {operator, rest} = parse_operator(rest)
    rest = skip_spaces(rest)
    {number2, []} = parse_number(rest)
    operator.(number1, number2)
  end

  defp parse_number(expression), do: _parse_number({0, expression})

  defp _parse_number({value, [digit | rest]}) when digit in ?0..?9 do
    _parse_number({value * 10 + digit - ?0, rest})
  end

  defp _parse_number(result), do: result

  defp skip_spaces([?\s | rest]), do: skip_spaces(rest)
  defp skip_spaces(rest), do: rest
  defp parse_operator([?+ | rest]), do: {&(&1 + &2), rest}
  defp parse_operator([?- | rest]), do: {&(&1 - &2), rest}
  defp parse_operator([?* | rest]), do: {&(&1 * &2), rest}
  defp parse_operator([?/ | rest]), do: {&div(&1, &2), rest}

  def center(strings) do
    Enum.each(strings, &IO.puts(&1))
  end
end

IO.inspect(MyString.printable_ascii('test!'))
IO.inspect(MyString.anagram?('cat', 'act'))
IO.inspect(MyString.calculate('123 + 27'))
MyString.center(["cat", "zebra", "elephant"])
