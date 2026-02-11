defmodule HelloAlgo.ChapterComputationalComplexity.SpaceComplexity do
  @moduledoc """
  File: SpaceComplexity.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.Modules.ListNode
  alias HelloAlgo.Modules.TreeNode
  alias HelloAlgo.Modules.PrintUtil

  @doc """
  Helper function to demonstrate constant space call
  """
  def function_sample(), do: 0

  @doc """
  Demonstrate O(1) constant space complexity
  """
  def constant(n) do
    _a = 0
    # Fixed size allocation is O(1)
    _nums = for _i <- 0..9999, do: 0
    _node = %ListNode{val: 0}

    # Variables defined in loop take O(1) total as they are reused
    for _i <- 0..(n - 1) do
      _c = 0
    end

    # Function calls in loop take O(1) stack space as they return immediately
    for _i <- 0..(n - 1) do
      function_sample()
    end
  end

  @doc """
  Demonstrate O(n) linear space complexity
  """
  def linear(n) do
    # Allocation proportional to n
    _nums = for _i <- 0..(n - 1), do: 0
    # Hash map size proportional to n
    _hmap = Enum.into(0..(n - 1), %{}, fn i -> {i, Integer.to_string(i)} end)
  end

  @doc """
  Demonstrate O(n) linear space complexity via recursion stack
  """
  def linear_recur(n) do
    IO.puts("Recursion n = #{n}")

    if n <= 1 do
      :ok
    else
      # Stack depth is n
      linear_recur(n - 1)
    end
  end

  @doc """
  Demonstrate O(n^2) quadratic space complexity
  """
  def quadratic(n) do
    # 2D matrix of size n x n
    _num_matrix =
      for _i <- 0..(n - 1) do
        for _j <- 0..(n - 1), do: 0
      end
  end

  @doc """
  Demonstrate O(n^2) quadratic space complexity via recursion
  """
  def quadratic_recur(n) do
    if n <= 0 do
      0
    else
      # Each call allocates O(n), total depth is n -> total O(n^2)
      _nums = for _i <- 0..(n - 1), do: 0
      quadratic_recur(n - 1)
    end
  end

  @doc """
  Demonstrate O(2^n) exponential space complexity by building a tree
  """
  def build_tree_sample(0), do: nil

  def build_tree_sample(n) do
    # Building a full binary tree with 2^n - 1 nodes
    %TreeNode{
      val: 0,
      left: build_tree_sample(n - 1),
      right: build_tree_sample(n - 1)
    }
  end

  def run() do
    n = 5
    # Constant space
    constant(n)
    # Linear space
    linear(n)
    linear_recur(n)
    # Quadratic space
    quadratic(n)
    quadratic_recur(n)
    # Exponential space
    root = build_tree_sample(n)
    PrintUtil.print_tree(root)
  end
end
