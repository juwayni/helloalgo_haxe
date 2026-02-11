defmodule HelloAlgo.ChapterGreedy.MaxCapacityWater do
  @moduledoc """
  File: MaxCapacityWater.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Maximum capacity water (container with most water)
  """
  def max_capacity(ht) do
    # Initialize two pointers at both ends
    i = 0
    j = length(ht) - 1
    res = 0

    do_max_capacity(ht, i, j, res)
  end

  defp do_max_capacity(_ht, i, j, res) when i >= j, do: res

  defp do_max_capacity(ht, i, j, res) do
    # Calculate current capacity: width * min height
    cap = (j - i) * min(Enum.at(ht, i), Enum.at(ht, j))
    res = max(res, cap)

    # Greedy choice: move the pointer with the smaller height
    if Enum.at(ht, i) < Enum.at(ht, j) do
      do_max_capacity(ht, i + 1, j, res)
    else
      do_max_capacity(ht, i, j - 1, res)
    end
  end

  def run() do
    ht = [1, 8, 6, 2, 5, 4, 8, 3, 7]
    IO.puts("Heights = #{inspect(ht)}")

    res = max_capacity(ht)
    IO.puts("Maximum water capacity = #{res}")
  end
end
