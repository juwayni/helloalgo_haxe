defmodule HelloAlgo.ChapterDynamicProgramming.CoinChangeII do
  @moduledoc """
  File: CoinChangeII.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Total ways to make change: Dynamic Programming
  """
  def coin_change_ii_dp(coins, amt) do
    n = length(coins)
    # dp[i][a] represents the number of ways to make amount 'a' using first 'i' coins
    dp = Enum.map(0..n, fn _ -> List.duplicate(0, amt + 1) end)

    # Base case: 1 way to make amount 0 (no coins)
    dp = Enum.map(0..n, fn i ->
      row = Enum.at(dp, i)
      List.replace_at(row, 0, 1)
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
          # Decide whether to use this coin: sum of ways without coin + ways with at least one such coin
          no = Enum.at(Enum.at(acc_a, i - 1), a)
          yes = Enum.at(Enum.at(acc_a, i), a - coin)
          row = Enum.at(acc_a, i)
          List.replace_at(acc_a, i, List.replace_at(row, a, no + yes))
        end
      end)
    end)

    Enum.at(Enum.at(dp, n), amt)
  end

  @doc """
  Space-optimized DP
  """
  def coin_change_ii_dp_comp(coins, amt) do
    dp = List.duplicate(0, amt + 1)
    dp = List.replace_at(dp, 0, 1)

    Enum.reduce(coins, dp, fn coin, acc_coin ->
      Enum.reduce(coin..amt//1, acc_coin, fn a, acc_a ->
        List.replace_at(acc_a, a, Enum.at(acc_a, a) + Enum.at(acc_a, a - coin))
      end)
    end)
    |> Enum.at(amt)
  end

  def run() do
    coins = [1, 2, 5]
    amt = 5
    IO.puts("Coins = #{inspect(coins)}, Amount = #{amt}")

    res = coin_change_ii_dp(coins, amt)
    IO.puts("Total ways to make change (DP) = #{res}")

    res_comp = coin_change_ii_dp_comp(coins, amt)
    IO.puts("Total ways to make change (optimized DP) = #{res_comp}")
  end
end
