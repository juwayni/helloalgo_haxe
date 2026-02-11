defmodule HelloAlgo.ChapterTree.BinaryTreeBfs do
  @moduledoc """
  File: BinaryTreeBfs.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.Modules.TreeNode
  alias HelloAlgo.Modules.PrintUtil

  @doc """
  Perform level-order traversal (Breadth-First Search) on the binary tree
  """
  def level_order(nil), do: []

  def level_order(root) do
    # Initialize a queue for BFS and add the root
    # List to store the visited node values
    do_level_order([root], [])
  end

  defp do_level_order([], res), do: Enum.reverse(res)

  defp do_level_order([node | rest], res) do
    # Dequeue from front, record visited vertex
    # Enqueue children if they exist
    new_rest = rest ++ Enum.reject([node.left, node.right], &is_nil/1)
    do_level_order(new_rest, [node.val | res])
  end

  def run() do
    # Build binary tree from a level-order array representation
    arr = [1, 2, 3, 4, 5, 6, 7]
    root = TreeNode.list_to_tree(arr)
    IO.puts("\nInitialized binary tree\n")
    PrintUtil.print_tree(root)

    # Perform traversal and print the sequence
    res = level_order(root)
    IO.puts("\nLevel-order traversal sequence = [#{Enum.join(res, ", ")}]")
  end
end
