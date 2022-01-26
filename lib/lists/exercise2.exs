defmodule MyList do
  def all?(list), do: all?(list, fn x -> !!x end)
  def all?([], _fun), do: true

  def all?([head | tail], fun) do
    if fun.(head) do
      all?(tail, fun)
    else
      false
    end
  end

  def each([], _fun), do: []

  def each([head | tail], fun) do
    [fun.(head) | each(tail, fun)]
  end

  def filter([], _fun), do: []

  def filter([head | tail], fun) do
    if fun.(head) do
      [head, filter(tail, fun)]
    else
      [filter(tail, fun)]
    end
  end

  def split(list, count), do: _split(list, [], count)
  defp _split([], acc, _), do: [Enum.reverse(acc), []]
  defp _split(tail, acc, 0), do: [Enum.reverse(acc), tail]

  defp _split([head | tail], acc, count) do
    _split(tail, [head | acc], count - 1)
  end

  def take(list, n), do: hd(split(list, n))
end

IO.puts(MyList.all?([nil, true, false]))
IO.inspect(MyList.each([2, 1, 4], &(&1 * 2)))
IO.inspect(MyList.filter([1, 2, 3, 4], &(&1 > 2)))
IO.inspect(MyList.split([1, 2, 3, 4, 5], 3))
IO.inspect(MyList.take([1, 2, 3, 4, 5], 2))
