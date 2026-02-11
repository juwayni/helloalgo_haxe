defmodule HelloAlgo.ChapterGreedy.CoinChangeGreedy do
  @moduledoc """
  File: CoinChangeGreedy.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Coin change using greedy strategy (only works for certain denominations)
  """
  def coin_change_greedy(coins, amt) do
    # Sort coins in descending order
    coins = Enum.sort(coins, :desc)

    # Continuously pick the largest coin that fits
    {_remaining, count} = Enum.reduce(coins, {amt, 0}, fn coin, {rem, acc_count} ->
      # Number of coins of this denomination
      num = div(rem, coin)
      {rem - num * coin, acc_count + num}
    end)

    count
  end

  def run() do
    # For these denominations, greedy works
    coins = [1, 5, 10, 20, 50, 100]
    amt = 186
    IO.puts("Coins = #{inspect(coins)}, Amount = #{amt}")

    res = coin_change_greedy(coins, amt)
    IO.puts("Greedy coin change count = #{res}")

    # For these denominations, greedy fails to find optimal
    coins2 = [1, 20, 50]
    amt2 = 60
    IO.puts("\nCoins = #{inspect(coins2)}, Amount = #{amt2}")
    res2 = coin_change_greedy(coins2, amt2)
    IO.puts("Greedy count = #{res2} (Expected 3 * 20 = 3, but greedy gives 50 + 10 * 1 = 11)")
  end
end
