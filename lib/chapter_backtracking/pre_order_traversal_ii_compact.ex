defmodule HelloAlgo.ChapterBacktracking.PreOrderTraversalIICompact do
  @moduledoc """
  File: PreOrderTraversalIICompact.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.Modules.TreeNode
  alias HelloAlgo.Modules.PrintUtil

  @doc """
  Pre-order traversal to find all paths that reach a node with value 7
  """
  def pre_order(root) do
    do_pre_order(root, [], [])
  end

  defp do_pre_order(nil, _path, res), do: res

  defp do_pre_order(root, path, res) do
    # Add node to current path
    path = path ++ [root]

    # If node value matches target, record current path to results
    res = if root.val == 7, do: res ++ [path], else: res

    # Recursively visit left and right children
    res = do_pre_order(root.left, path, res)
    do_pre_order(root.right, path, res)
  end

  def run() do
    # Initialize binary tree from a list (level-order representation)
    root = TreeNode.list_to_tree([1, 7, 3, 4, 5, 6, 7])
    IO.puts("\nInitialized binary tree")
    PrintUtil.print_tree(root)

    # Pre-order traversal to collect paths ending at nodes with value 7
    res = pre_order(root)

    IO.puts("\nOutput all paths reaching nodes with value 7")
    Enum.each(res, fn path ->
      vals = Enum.map(path, & &1.val)
      IO.puts("[#{Enum.join(vals, ", ")}]")
    end)
  end
end
