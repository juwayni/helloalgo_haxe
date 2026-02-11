defmodule HelloAlgo.ChapterDynamicProgramming.CoinChange do
  @moduledoc """
  File: CoinChange.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Minimum coins for change: Dynamic Programming
  """
  def coin_change_dp(coins, amt) do
    n = length(coins)
    # Initialize dp table with infinity (using a large number)
    max_val = amt + 1
    dp = Enum.map(0..n, fn _ -> List.duplicate(max_val, amt + 1) end)

    # Base case: amount 0 needs 0 coins
    dp = Enum.map(0..n, fn i ->
      row = Enum.at(dp, i)
      List.replace_at(row, 0, 0)
    end)

    dp = Enum.reduce(1..n, dp, fn i, acc_i ->
      Enum.reduce(1..amt, acc_i, fn a, acc_a ->
        coin = Enum.at(coins, i - 1)
        if coin > a do
          # Cannot use this coin
          prev_val = Enum.at(Enum.at(acc_a, i - 1), a)
          row = Enum.at(acc_a, i)
          List.replace_at(acc_a, i, List.replace_at(row, a, prev_val))
        else
          # Decide whether to use this coin
          no = Enum.at(Enum.at(acc_a, i - 1), a)
          yes = Enum.at(Enum.at(acc_a, i), a - coin) + 1
          row = Enum.at(acc_a, i)
          List.replace_at(acc_a, i, List.replace_at(row, a, min(no, yes)))
        end
      end)
    end)

    res = Enum.at(Enum.at(dp, n), amt)
    if res > amt, do: -1, else: res
  end

  @doc """
  Space-optimized DP
  """
  def coin_change_dp_comp(coins, amt) do
    max_val = amt + 1
    dp = List.duplicate(max_val, amt + 1)
    dp = List.replace_at(dp, 0, 0)

    Enum.reduce(coins, dp, fn coin, acc_coin ->
      Enum.reduce(coin..amt//1, acc_coin, fn a, acc_a ->
        List.replace_at(acc_a, a, min(Enum.at(acc_a, a), Enum.at(acc_a, a - coin) + 1))
      end)
    end)
    |> (fn acc ->
      res = Enum.at(acc, amt)
      if res > amt, do: -1, else: res
    end).()
  end

  def run() do
    coins = [1, 2, 5]
    amt = 11
    IO.puts("Coins = #{inspect(coins)}, Amount = #{amt}")

    res = coin_change_dp(coins, amt)
    IO.puts("Min coins needed (DP) = #{res}")

    res_comp = coin_change_dp_comp(coins, amt)
    IO.puts("Min coins needed (optimized DP) = #{res_comp}")
  end
end
