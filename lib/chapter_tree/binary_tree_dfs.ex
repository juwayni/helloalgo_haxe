defmodule HelloAlgo.ChapterTree.BinaryTreeDfs do
  @moduledoc """
  File: BinaryTreeDfs.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.Modules.TreeNode
  alias HelloAlgo.Modules.PrintUtil

  @doc """
  Recursive pre-order traversal (Root -> Left -> Right)
  """
  def pre_order(nil), do: []

  def pre_order(node) do
    [node.val] ++ pre_order(node.left) ++ pre_order(node.right)
  end

  @doc """
  Recursive in-order traversal (Left -> Root -> Right)
  """
  def in_order(nil), do: []

  def in_order(node) do
    in_order(node.left) ++ [node.val] ++ in_order(node.right)
  end

  @doc """
  Recursive post-order traversal (Left -> Right -> Root)
  """
  def post_order(nil), do: []

  def post_order(node) do
    post_order(node.left) ++ post_order(node.right) ++ [node.val]
  end

  def run() do
    # Build binary tree from a level-order array representation
    arr = [1, 2, 3, 4, 5, 6, 7]
    root = TreeNode.list_to_tree(arr)
    IO.puts("\nInitialized binary tree\n")
    PrintUtil.print_tree(root)

    # Pre-order traversal sequence
    res_pre = pre_order(root)
    IO.puts("\nPre-order traversal sequence = [#{Enum.join(res_pre, ", ")}]")

    # In-order traversal sequence
    res_in = in_order(root)
    IO.puts("\nIn-order traversal sequence = [#{Enum.join(res_in, ", ")}]")

    # Post-order traversal sequence
    res_post = post_order(root)
    IO.puts("\nPost-order traversal sequence = [#{Enum.join(res_post, ", ")}]")
  end
end
