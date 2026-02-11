defmodule HelloAlgo.ChapterComputationalComplexity.TimeComplexity do
  @moduledoc """
  File: TimeComplexity.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  O(1) Constant time: operations don't depend on n
  """
  def constant(_n) do
    count = 0
    size = 100_000
    Enum.reduce(0..(size - 1), count, fn _, acc -> acc + 1 end)
  end

  @doc """
  O(n) Linear time: single loop over n
  """
  def linear(n) do
    Enum.reduce(0..(n - 1), 0, fn _, acc -> acc + 1 end)
  end

  @doc """
  O(n) Linear time: traversing an array
  """
  def array_traversal(nums) do
    # Traverse each element in the list
    Enum.reduce(nums, 0, fn _, acc -> acc + 1 end)
  end

  @doc """
  O(n^2) Quadratic time: nested loops
  """
  def quadratic(n) do
    for _i <- 0..(n - 1), _j <- 0..(n - 1), reduce: 0 do
      acc -> acc + 1
    end
  end

  @doc """
  O(n^2) Quadratic time: bubble sort
  """
  def bubble_sort(nums) do
    # Outer loop defines the end of the unsorted portion
    do_bubble_sort(nums, length(nums) - 1, 0)
  end

  defp do_bubble_sort(_nums, i, count) when i <= 0, do: count

  defp do_bubble_sort(nums, i, count) do
    {new_nums, new_count} = bubble_pass(nums, i, 0, count)
    do_bubble_sort(new_nums, i - 1, new_count)
  end

  defp bubble_pass(nums, i, j, count) when j < i do
    val_j = Enum.at(nums, j)
    val_j1 = Enum.at(nums, j + 1)

    if val_j > val_j1 do
      new_nums =
        nums
        |> List.replace_at(j, val_j1)
        |> List.replace_at(j + 1, val_j)

      # Swapping involves 3 operations
      bubble_pass(new_nums, i, j + 1, count + 3)
    else
      bubble_pass(nums, i, j + 1, count)
    end
  end

  defp bubble_pass(nums, _i, _j, count), do: {nums, count}

  @doc """
  O(2^n) Exponential time: iterative doubling
  """
  def exponential(n) do
    Enum.reduce(0..(n - 1), {0, 1}, fn _, {count, base} ->
      new_count = Enum.reduce(0..(base - 1), count, fn _, acc -> acc + 1 end)
      {new_count, base * 2}
    end)
    |> elem(0)
  end

  @doc """
  O(2^n) Exponential time: recursive doubling
  """
  def exp_recur(1), do: 1

  def exp_recur(n) do
    exp_recur(n - 1) + exp_recur(n - 1) + 1
  end

  @doc """
  O(log n) Logarithmic time: iterative halving
  """
  def logarithmic(n) do
    do_logarithmic(n, 0)
  end

  defp do_logarithmic(n, count) when n > 1 do
    do_logarithmic(n / 2, count + 1)
  end

  defp do_logarithmic(_n, count), do: count

  @doc """
  O(log n) Logarithmic time: recursive halving
  """
  def log_recur(n) when n <= 1, do: 0

  def log_recur(n) do
    log_recur(n / 2) + 1
  end

  @doc """
  O(n log n) Linear-logarithmic time: recursive partitioning
  """
  def linear_log_recur(n) when n <= 1, do: 1

  def linear_log_recur(n) do
    count = linear_log_recur(div(n, 2)) + linear_log_recur(div(n, 2))
    Enum.reduce(0..(n - 1), count, fn _, acc -> acc + 1 end)
  end

  @doc """
  O(n!) Factorial time: recursive permutations
  """
  def factorial_recur(0), do: 1

  def factorial_recur(n) do
    Enum.reduce(0..(n - 1), 0, fn _, acc -> acc + factorial_recur(n - 1) end)
  end

  def run() do
    n = 8
    IO.puts("Input size n = #{n}")

    count = constant(n)
    IO.puts("Constant time O(1) ops = #{count}")

    count = linear(n)
    IO.puts("Linear time O(n) ops = #{count}")
    nums_arr = for _ <- 0..(n - 1), do: 0
    count = array_traversal(nums_arr)
    IO.puts("Linear time O(n) (traversal) ops = #{count}")

    count = quadratic(n)
    IO.puts("Quadratic time O(n^2) ops = #{count}")
    nums = Enum.to_list(n..1)
    count = bubble_sort(nums)
    IO.puts("Quadratic time O(n^2) (bubble sort) ops = #{count}")

    count = exponential(n)
    IO.puts("Exponential time O(2^n) (iterative) ops = #{count}")
    count = exp_recur(n)
    IO.puts("Exponential time O(2^n) (recursive) ops = #{count}")

    count = logarithmic(n)
    IO.puts("Logarithmic time O(log n) (iterative) ops = #{count}")
    count = log_recur(n)
    IO.puts("Logarithmic time O(log n) (recursive) ops = #{count}")

    count = linear_log_recur(n)
    IO.puts("Linear-logarithmic time O(n log n) ops = #{count}")

    count = factorial_recur(n)
    IO.puts("Factorial time O(n!) ops = #{count}")
  end
end
