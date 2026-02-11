defmodule HelloAlgo.ChapterGreedy.MaxCapacity do
  @moduledoc """
  File: MaxCapacity.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Solve the max capacity problem (Container With Most Water) using two pointers
  """
  def max_capacity(ht) do
    do_max_capacity(ht, 0, length(ht) - 1, 0)
  end

  defp do_max_capacity(_ht, i, j, res) when i >= j, do: res

  defp do_max_capacity(ht, i, j, res) do
    h_i = Enum.at(ht, i)
    h_j = Enum.at(ht, j)
    h = min(h_i, h_j)
    cap = h * (j - i)
    new_res = max(res, cap)

    if h_i < h_j do
      do_max_capacity(ht, i + 1, j, new_res)
    else
      do_max_capacity(ht, i, j - 1, new_res)
    end
  end

  def run() do
    ht = [3, 8, 5, 2, 7, 7, 3, 4]
    res = max_capacity(ht)
    IO.puts("Max capacity = #{res}")
  end
end
