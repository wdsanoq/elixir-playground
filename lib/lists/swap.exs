defmodule Swapper do
  def swap([]), do: []
  def swap([a, b | trail]), do: [b, a | swap(trail)]
  def swap([_]), do: raise("Can't swap a list with an odd number of elements")
end
