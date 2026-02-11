defmodule HelloAlgo.ChapterBacktracking.PreOrderTraversalICompact do
  @moduledoc """
  File: PreOrderTraversalICompact.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.Modules.TreeNode
  alias HelloAlgo.Modules.PrintUtil

  @doc """
  Pre-order traversal to find all nodes with value 7
  """
  def pre_order(root) do
    do_pre_order(root, [])
  end

  defp do_pre_order(nil, res), do: res

  defp do_pre_order(root, res) do
    # Record solution if node value matches target
    res = if root.val == 7, do: res ++ [root], else: res
    # Recursively visit left and right children
    res = do_pre_order(root.left, res)
    do_pre_order(root.right, res)
  end

  def run() do
    # Initialize binary tree from a list (level-order representation)
    root = TreeNode.list_to_tree([1, 7, 3, 4, 5, 6, 7])
    IO.puts("\nInitialized binary tree")
    PrintUtil.print_tree(root)

    # Pre-order traversal to collect nodes with value 7
    res = pre_order(root)

    IO.puts("\nOutput all nodes with value 7")
    vals = Enum.map(res, & &1.val)
    IO.puts("[#{Enum.join(vals, ", ")}]")
  end
end
