defmodule HelloAlgo.ChapterComputationalComplexity.Recursion do
  @moduledoc """
  File: Recursion.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Standard recursion to calculate sum of 1..n
  """
  def recur(1), do: 1

  def recur(n) do
    # Base case check is implicit in the pattern matching above
    # Recursive call
    res = recur(n - 1)
    # Combine current value with recursive result
    n + res
  end

  @doc """
  Simulate recursion using an explicit stack and iteration
  """
  def for_loop_recur(n) do
    # Explicit stack to store values
    stack = Enum.to_list(n..1)
    # Accumulating sum by "popping" from the stack (recursion in Elixir)
    do_for_loop_recur(stack, 0)
  end

  defp do_for_loop_recur([], res), do: res

  defp do_for_loop_recur([val | rest], res) do
    # Popping values and accumulating sum
    do_for_loop_recur(rest, res + val)
  end

  @doc """
  Tail-recursive implementation of sum calculation
  """
  def tail_recur(0, res), do: res

  def tail_recur(n, res) do
    # Tail recursive call: computation is done before call
    tail_recur(n - 1, res + n)
  end

  @doc """
  Recursive calculation of the n-th Fibonacci number
  """
  # Base cases: f(1)=0, f(2)=1
  def fib(n) when n == 1 or n == 2, do: n - 1

  def fib(n) do
    # Exponential time complexity O(2^n)
    fib(n - 1) + fib(n - 2)
  end

  def run() do
    n = 5
    res = recur(n)
    IO.puts("\nSum from recursion: res = #{res}")

    res = for_loop_recur(n)
    IO.puts("\nSum from iteration simulating recursion: res = #{res}")

    res = tail_recur(n, 0)
    IO.puts("\nSum from tail recursion: res = #{res}")

    res = fib(n)
    IO.puts("\nFibonacci number at index #{n} is #{res}")
  end
end
