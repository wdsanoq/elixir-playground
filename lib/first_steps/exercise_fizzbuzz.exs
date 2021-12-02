fb = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, c -> c
end

IO.puts(fb.(0, 0, 4))
IO.puts(fb.(0, 2, 4))
IO.puts(fb.(1, 0, 4))
IO.puts(fb.(1, 1, 4))

fbr = fn n -> fb.(rem(n, 3), rem(n, 5), n) end

IO.inspect(Enum.map(10..16, fbr))
