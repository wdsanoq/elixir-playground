defmodule Chop do
  defp _guess(actual, actual, _), do: IO.puts(actual)

  defp _guess(actual, guess, low.._high)
       when actual < guess,
       do: guess(actual, low..(guess - 1))

  defp _guess(actual, guess, _low..high)
       when actual > guess,
       do: guess(actual, (guess + 1)..high)

  def guess(actual, range = low..high) do
    guess = div(low + high, 2)
    IO.puts("Is it #{guess}")
    _guess(actual, guess, range)
  end
end

Chop.guess(273, 1..1000)
