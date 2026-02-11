defmodule HelloAlgo.ChapterComputationalComplexity.Iteration do
  @moduledoc """
  File: Iteration.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Demonstrate a standard for loop
  """
  def for_loop(n) do
    # Sum 1, 2, ..., n
    Enum.reduce(1..n, 0, fn i, acc -> acc + i end)
  end

  @doc """
  Demonstrate a standard while loop
  """
  def while_loop(n) do
    # Initialize loop counter and sum
    # In Elixir, we use recursion to simulate a while loop
    do_while_loop(1, n, 0)
  end

  defp do_while_loop(i, n, res) when i <= n do
    # Increment loop counter and accumulate sum
    do_while_loop(i + 1, n, res + i)
  end

  defp do_while_loop(_i, _n, res), do: res

  @doc """
  Demonstrate a while loop with multiple update steps
  """
  def while_loop_ii(n) do
    do_while_loop_ii(1, n, 0)
  end

  defp do_while_loop_ii(i, n, res) when i <= n do
    # Sum values with irregular increment
    do_while_loop_ii((i + 1) * 2, n, res + i)
  end

  defp do_while_loop_ii(_i, _n, res), do: res

  @doc """
  Demonstrate nested for loops
  """
  def nested_for_loop(n) do
    res =
      # Outer loop
      for i <- 1..n do
        # Inner loop
        for j <- 1..n do
          "(#{i}, #{j}), "
        end
      end

    res |> List.flatten() |> Enum.join("")
  end

  def run() do
    n = 5
    res_sum = for_loop(n)
    IO.puts("\nSum from for loop: res = #{res_sum}")

    res_sum = while_loop(n)
    IO.puts("\nSum from while loop: res = #{res_sum}")

    res_sum = while_loop_ii(n)
    IO.puts("\nSum from while loop (two updates): res = #{res_sum}")

    res_str = nested_for_loop(n)
    IO.puts("\nTraversal result from nested for loop: #{res_str}")
  end
end
