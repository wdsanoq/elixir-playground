defmodule MyList do
  def span(from, to) when from > to, do: []
  def span(from, to), do: [from | span(from + 1, to)]

  def primes_up_to(n) do
    range = span(2, n)
    range -- for a <- range, b <- range, a <= b, a * b <= n, do: a * b
  end

  def add_total(order = [id: _, ship_to: state, net_amount: net], tax_rates) do
    tax_rate = Keyword.get(tax_rates, state, 0)
    tax = net * tax_rate
    total = net + tax
    Keyword.put(order, :total_amount, total)
  end

  def get_taxes(orders, tax_rates) do
    orders |> Enum.map(&add_total(&1, tax_rates))
  end
end

IO.inspect(MyList.primes_up_to(40))

tax_rates = [NC: 0.075, TX: 0.08]

orders = [
  [id: 123, ship_to: :NC, net_amount: 100.00],
  [id: 124, ship_to: :OK, net_amount: 35.50],
  [id: 125, ship_to: :TX, net_amount: 24.00],
  [id: 126, ship_to: :TX, net_amount: 44.80],
  [id: 127, ship_to: :NC, net_amount: 25.00],
  [id: 128, ship_to: :MA, net_amount: 10.00],
  [id: 129, ship_to: :CA, net_amount: 102.00],
  [id: 130, ship_to: :NC, net_amount: 50.00]
]

IO.inspect(MyList.get_taxes(orders, tax_rates))
