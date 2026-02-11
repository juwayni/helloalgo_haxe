defmodule HelloAlgo.ChapterGreedy.FractionalKnapsack do
  @moduledoc """
  File: FractionalKnapsack.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  defstruct [:w, :v]

  @doc """
  Fractional knapsack using greedy strategy
  """
  def fractional_knapsack(w, v, cap) do
    # Calculate value-to-weight ratio for each item
    items = Enum.zip(w, v)
    |> Enum.map(fn {weight, value} -> %__MODULE__{w: weight, v: value} end)

    # Sort items by ratio in descending order
    sorted_items = Enum.sort(items, fn a, b ->
      a.v / a.w > b.v / b.w
    end)

    # Fill knapsack greedily
    {_remaining, total_value} = Enum.reduce(sorted_items, {cap, 0.0}, fn item, {rem, acc_val} ->
      if rem <= 0 do
        {rem, acc_val}
      else
        # Take either the whole item or a fraction of it
        take_w = min(item.w, rem)
        val = take_w * (item.v / item.w)
        {rem - take_w, acc_val + val}
      end
    end)

    total_value
  end

  def run() do
    w = [10, 20, 30]
    v = [60, 100, 120]
    cap = 50
    IO.puts("Weights = #{inspect(w)}")
    IO.puts("Values = #{inspect(v)}")
    IO.puts("Capacity = #{cap}")

    res = fractional_knapsack(w, v, cap)
    IO.puts("Fractional knapsack max value = #{res}")
  end
end
