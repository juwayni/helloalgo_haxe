defmodule HelloAlgo.ChapterTree.BinarySearchTree do
  @moduledoc """
  File: BinarySearchTree.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.Modules.TreeNode
  alias HelloAlgo.Modules.PrintUtil

  defstruct [:root]

  @doc """
  Constructor for an empty BST
  """
  def new() do
    %__MODULE__{root: nil}
  end

  @doc """
  Search for a node with value num
  """
  def search(bst, num) do
    # Iterative search logic via recursion
    do_search(bst.root, num)
  end

  defp do_search(nil, _num), do: nil

  defp do_search(node, num) do
    cond do
      node.val < num -> do_search(node.right, num)
      node.val > num -> do_search(node.left, num)
      true -> node
    end
  end

  @doc """
  Insertion of a value into the BST
  """
  def insert(bst, num) do
    %{bst | root: do_insert(bst.root, num)}
  end

  defp do_insert(nil, num), do: %TreeNode{val: num}

  defp do_insert(node, num) do
    cond do
      node.val < num -> %{node | right: do_insert(node.right, num)}
      node.val > num -> %{node | left: do_insert(node.left, num)}
      true -> node # Value already exists
    end
  end

  @doc """
  Removal of a value from the BST
  """
  def remove(bst, num) do
    %{bst | root: do_remove(bst.root, num)}
  end

  defp do_remove(nil, _num), do: nil

  defp do_remove(node, num) do
    cond do
      node.val < num ->
        %{node | right: do_remove(node.right, num)}

      node.val > num ->
        %{node | left: do_remove(node.left, num)}

      true ->
        # Found the node to remove
        if is_nil(node.left) or is_nil(node.right) do
          # Case 1 & 2: Node has 0 or 1 child
          node.left || node.right
        else
          # Case 3: Node has 2 children
          # Replace with inorder successor (leftmost in right subtree)
          successor = get_min(node.right)
          %{node | val: successor.val, right: do_remove(node.right, successor.val)}
        end
    end
  end

  defp get_min(node) do
    if is_nil(node.left), do: node, else: get_min(node.left)
  end

  def run() do
    bst = new()
    nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]

    bst =
      Enum.reduce(nums, bst, fn num, acc ->
        insert(acc, num)
      end)

    IO.puts("\nInitialized binary search tree\n")
    PrintUtil.print_tree(bst.root)

    node = search(bst, 7)
    IO.puts("\nFound node: #{if node, do: node.val, else: "null"}")

    bst = insert(bst, 16)
    IO.puts("\nAfter inserting node 16\n")
    PrintUtil.print_tree(bst.root)

    # Sequential removals for testing
    IO.puts("\nAfter removing node 1")
    bst = remove(bst, 1)
    PrintUtil.print_tree(bst.root)

    IO.puts("\nAfter removing node 2")
    bst = remove(bst, 2)
    PrintUtil.print_tree(bst.root)

    IO.puts("\nAfter removing node 4")
    bst = remove(bst, 4)
    PrintUtil.print_tree(bst.root)
  end
end
