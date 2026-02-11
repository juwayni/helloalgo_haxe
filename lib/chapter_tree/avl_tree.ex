defmodule HelloAlgo.ChapterTree.AVLTree do
  @moduledoc """
  File: AVLTree.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.Modules.TreeNode
  alias HelloAlgo.Modules.PrintUtil

  defstruct [:root]

  @doc """
  Constructor for an empty AVL Tree
  """
  def new() do
    %__MODULE__{root: nil}
  end

  @doc """
  Get the height of a given node (-1 for null)
  """
  def height(nil), do: -1
  def height(node), do: node.height

  @doc """
  Update a node's height based on its children
  """
  defp update_height(node) do
    h_l = height(node.left)
    h_r = height(node.right)
    %{node | height: max(h_l, h_r) + 1}
  end

  @doc """
  Calculate the balance factor of a node (left height - right height)
  """
  def balance_factor(nil), do: 0
  def balance_factor(node), do: height(node.left) - height(node.right)

  @doc """
  Perform a right rotation on a node
  """
  defp right_rotate(node) do
    child = node.left
    grand_child = child.right
    # Rotate
    node = %{node | left: grand_child}
    child = %{child | right: node}
    # Update heights
    node = update_height(node)
    child = update_height(child)
    child
  end

  @doc """
  Perform a left rotation on a node
  """
  defp left_rotate(node) do
    child = node.right
    grand_child = child.left
    # Rotate
    node = %{node | right: grand_child}
    child = %{child | left: node}
    # Update heights
    node = update_height(node)
    child = update_height(child)
    child
  end

  @doc """
  Rebalance a subtree via rotations based on its balance factor
  """
  defp rotate(node) do
    bf = balance_factor(node)

    cond do
      # Left heavy
      bf > 1 ->
        if balance_factor(node.left) >= 0 do
          right_rotate(node)
        else
          node = %{node | left: left_rotate(node.left)}
          right_rotate(node)
        end

      # Right heavy
      bf < -1 ->
        if balance_factor(node.right) <= 0 do
          left_rotate(node)
        else
          node = %{node | right: right_rotate(node.right)}
          left_rotate(node)
        end

      true ->
        node
    end
  end

  @doc """
  Insert a value into the AVL tree
  """
  def insert(avl, val) do
    %{avl | root: do_insert(avl.root, val)}
  end

  defp do_insert(nil, val), do: %TreeNode{val: val, height: 0}

  defp do_insert(node, val) do
    node =
      cond do
        val < node.val -> %{node | left: do_insert(node.left, val)}
        val > node.val -> %{node | right: do_insert(node.right, val)}
        true -> node # Duplicate not allowed
      end

    node = update_height(node)
    rotate(node)
  end

  @doc """
  Remove a value from the AVL tree
  """
  def remove(avl, val) do
    %{avl | root: do_remove(avl.root, val)}
  end

  defp do_remove(nil, _val), do: nil

  defp do_remove(node, val) do
    node =
      cond do
        val < node.val ->
          %{node | left: do_remove(node.left, val)}

        val > node.val ->
          %{node | right: do_remove(node.right, val)}

        true ->
          # Found node to delete
          if is_nil(node.left) or is_nil(node.right) do
            # 0 or 1 child case
            node.left || node.right
          else
            # 2 children case: find successor
            successor = get_min(node.right)
            %{node | val: successor.val, right: do_remove(node.right, successor.val)}
          end
      end

    if is_nil(node) do
      nil
    else
      node = update_height(node)
      rotate(node)
    end
  end

  defp get_min(node) do
    if is_nil(node.left), do: node, else: get_min(node.left)
  end

  @doc """
  Search for a value in the tree
  """
  def search(avl, val) do
    do_search(avl.root, val)
  end

  defp do_search(nil, _val), do: nil

  defp do_search(node, val) do
    cond do
      node.val < val -> do_search(node.right, val)
      node.val > val -> do_search(node.left, val)
      true -> node
    end
  end

  def run() do
    avl_tree = new()

    # Sequential test insertions
    avl_tree =
      Enum.reduce([1, 2, 3, 4, 5, 8, 7, 9, 10, 6], avl_tree, fn val, acc ->
        acc = insert(acc, val)
        IO.puts("\nAfter inserting node #{val}, AVL tree is")
        PrintUtil.print_tree(acc.root)
        acc
      end)

    # Test duplicate insertion
    avl_tree = insert(avl_tree, 7)

    IO.puts("\nAfter removing node 8 (degree 0)")
    avl_tree = remove(avl_tree, 8)
    PrintUtil.print_tree(avl_tree.root)

    IO.puts("\nAfter removing node 5 (degree 1)")
    avl_tree = remove(avl_tree, 5)
    PrintUtil.print_tree(avl_tree.root)

    IO.puts("\nAfter removing node 4 (degree 2)")
    avl_tree = remove(avl_tree, 4)
    PrintUtil.print_tree(avl_tree.root)

    res_node = search(avl_tree, 7)
    IO.puts("\nFound node: #{if res_node, do: res_node.val, else: "null"}")
  end
end
