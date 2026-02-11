defmodule HelloAlgo.ChapterGreedy.MaxProductCutting do
  @moduledoc """
  File: MaxProductCutting.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Maximum product cutting using greedy strategy
  """
  def max_product_cutting(n) do
    # Base cases for small n
    if n <= 3 do
      n - 1
    else
      # Greedy strategy: cut as many pieces of length 3 as possible
      a = div(n, 3)
      b = rem(n, 3)

      cond do
        # Remainder is 0: product of all 3s
        b == 0 -> :math.pow(3, a) |> round()
        # Remainder is 1: combine one 3 with the 1 to make two 2s (2*2=4 > 3*1=3)
        b == 1 -> (:math.pow(3, a - 1) * 4) |> round()
        # Remainder is 2: product of all 3s and one 2
        true   -> (:math.pow(3, a) * 2) |> round()
      end
    end
  end

  def run() do
    n = 10
    IO.puts("Rope length = #{n}")

    res = max_product_cutting(n)
    IO.puts("Maximum product of cutting = #{res}")
  end
end
