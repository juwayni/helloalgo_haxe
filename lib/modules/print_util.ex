defmodule HelloAlgo.Modules.PrintUtil do
  @moduledoc """
  File: PrintUtil.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.Modules.ListNode
  alias HelloAlgo.Modules.TreeNode

  @doc """
  Print matrix to console
  """
  def print_matrix(mat) do
    s = Enum.map(mat, fn arr ->
      "  [" <> Enum.join(arr, ", ") <> "]"
    end)
    IO.puts("[\n" <> Enum.join(s, ",\n") <> "\n]")
  end

  @doc """
  Print linked list in the format: val1 -> val2 -> val3
  """
  def print_linked_list(head) do
    arr = ListNode.linked_list_to_list(head)
    IO.puts(Enum.join(arr, " -> "))
  end

  @doc """
  Print binary tree structure visually
  """
  def print_tree(node), do: print_tree_helper(node, "", :root)

  defp print_tree_helper(nil, _indent, _type), do: :ok
  defp print_tree_helper(node, indent, type) do
    # Recursively print the right subtree first
    print_tree_helper(node.right, indent <> (if type == :left, do: "│   ", else: "    "), :right)

    IO.write(indent)
    case type do
      :root -> IO.write("——— ")
      :right -> IO.write("/——— ")
      :left -> IO.write("\\——— ")
    end
    IO.puts(node.val)

    # Recursively print the left subtree
    print_tree_helper(node.left, indent <> (if type == :right, do: "│   ", else: "    "), :left)
  end

  @doc """
  Print dictionary (Map) in the format: key -> value
  """
  def print_dict(hmap) do
    Enum.each(hmap, fn {key, val} ->
      IO.puts("#{inspect(key)} -> #{inspect(val)}")
    end)
  end

  @doc """
  Print heap (array representation and tree representation)
  """
  def print_heap(heap) do
    IO.puts("Heap array representation: #{inspect(heap)}")
    IO.puts("Heap tree representation:")
    # Build a tree from the array representation for visual printing
    root = TreeNode.list_to_tree(heap)
    print_tree(root)
  end
end
