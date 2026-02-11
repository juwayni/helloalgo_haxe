defmodule HelloAlgo.ChapterBacktracking.PreOrderTraversalIIICompact do
  @moduledoc """
  File: PreOrderTraversalIIICompact.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.Modules.TreeNode
  alias HelloAlgo.Modules.PrintUtil

  @doc """
  Pre-order traversal to find paths that reach a node with value 7 but don't contain value 3
  """
  def pre_order(root) do
    do_pre_order(root, [], [])
  end

  defp do_pre_order(nil, _path, res), do: res

  defp do_pre_order(root, path, res) do
    # Pruning: skip if node value is 3
    if root.val == 3 do
      res
    else
      # Add node to current path
      path = path ++ [root]

      # Record solution if node value is 7
      res = if root.val == 7, do: res ++ [path], else: res

      # Recurse through children
      res = do_pre_order(root.left, path, res)
      do_pre_order(root.right, path, res)
    end
  end

  def run() do
    # Initialize binary tree from a list
    root = TreeNode.list_to_tree([1, 7, 3, 4, 5, 6, 7])
    IO.puts("\nInitialized binary tree")
    PrintUtil.print_tree(root)

    # Pre-order traversal with pruning
    res = pre_order(root)

    IO.puts("\nOutput paths reaching node 7, excluding nodes in path containing value 3")
    Enum.each(res, fn path ->
      vals = Enum.map(path, & &1.val)
      IO.puts("[#{Enum.join(vals, ", ")}]")
    end)
  end
end
