defmodule MyList do
  def mapsum([], _func), do: 0
  def mapsum([head | tail], func), do: func.(head) + mapsum(tail, func)

  defp _max([], value), do: value
  defp _max([head | tail], value) when head < value, do: _max(tail, value)
  defp _max([head | tail], _), do: _max(tail, head)
  def max([head | tail]), do: _max(tail, head)
  # def max([head | tail]), do: Kernel.max(head, max(tail))

  def caesar([], _), do: []

  def caesar([head | tail], n) when [head + n] > 'z' do
    caesar([head - ?z + ?a - 1 | tail], n)
  end

  def caesar([head | tail], n) do
    [head + n | caesar(tail, n)]
  end
end

IO.puts(MyList.caesar('ryvkve', 13))
