defmodule HelloAlgo.ChapterDivideAndConquer.BuildTree do
  @moduledoc """
  File: BuildTree.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.Modules.TreeNode
  alias HelloAlgo.Modules.PrintUtil

  @doc """
  Build binary tree from pre-order and in-order traversals
  """
  def dfs(preorder, inorder_map, i, l, r) do
    # Base case: no elements in current range
    if r < l do
      nil
    else
      # Pre-order index 'i' points to the root of the current subtree
      root_val = Enum.at(preorder, i)
      root = %TreeNode{val: root_val}

      # Find the index of root in in-order traversal to split left and right subtrees
      m = Map.get(inorder_map, root_val)

      # Build left subtree
      root = %{root | left: dfs(preorder, inorder_map, i + 1, l, m - 1)}
      # Build right subtree
      # Root of right subtree in preorder is at: i + (size of left subtree) + 1
      # Size of left subtree is: m - 1 - l + 1 = m - l
      root = %{root | right: dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)}

      root
    end
  end

  @doc """
  Construct binary tree
  """
  def build_tree(preorder, inorder) do
    # Map values to their indices in in-order traversal for O(1) lookup
    inorder_map = Enum.with_index(inorder) |> Map.new()
    dfs(preorder, inorder_map, 0, 0, length(inorder) - 1)
  end

  def run() do
    preorder = [3, 9, 2, 1, 7]
    inorder = [9, 3, 1, 2, 7]
    IO.puts("Pre-order = [#{Enum.join(preorder, ", ")}]")
    IO.puts("In-order = [#{Enum.join(inorder, ", ")}]")

    root = build_tree(preorder, inorder)
    IO.puts("Constructed binary tree:")
    PrintUtil.print_tree(root)
  end
end
