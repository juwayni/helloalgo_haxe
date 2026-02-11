defmodule HelloAlgo.ChapterTree.ArrayBinaryTree do
  @moduledoc """
  File: ArrayBinaryTree.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.Modules.TreeNode
  alias HelloAlgo.Modules.PrintUtil

  defstruct [:tree]

  @doc """
  Constructor for a binary tree represented by an array
  """
  def new(arr) do
    %__MODULE__{tree: arr}
  end

  @doc """
  Get the number of nodes in the array representation
  """
  def size(abt), do: length(abt.tree)

  @doc """
  Get the value of the node at index i
  """
  def val(abt, i) do
    if i < 0 or i >= size(abt), do: nil, else: Enum.at(abt.tree, i)
  end

  @doc """
  Get the index of the left child of node at index i
  """
  def left(i), do: 2 * i + 1

  @doc """
  Get the index of the right child of node at index i
  """
  def right(i), do: 2 * i + 2

  @doc """
  Get the index of the parent of node at index i
  """
  def parent(i), do: div(i - 1, 2)

  @doc """
  Perform level-order traversal
  """
  def level_order(abt) do
    abt.tree |> Enum.reject(&is_nil/1)
  end

  @doc """
  Pre-order traversal
  """
  def pre_order(abt), do: dfs(abt, 0, :pre)

  @doc """
  In-order traversal
  """
  def in_order(abt), do: dfs(abt, 0, :in)

  @doc """
  Post-order traversal
  """
  def post_order(abt), do: dfs(abt, 0, :post)

  @doc """
  Recursive depth-first search helper
  """
  defp dfs(abt, i, order) do
    v = val(abt, i)

    if is_nil(v) do
      []
    else
      l_res = dfs(abt, left(i), order)
      r_res = dfs(abt, right(i), order)

      case order do
        # Pre-order logic
        :pre -> [v | l_res ++ r_res]
        # In-order logic
        :in -> l_res ++ [v | r_res]
        # Post-order logic
        :post -> l_res ++ r_res ++ [v]
      end
    end
  end

  def run() do
    # Initialize binary tree with an array (nil represents no node)
    arr = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
    root = TreeNode.list_to_tree(arr)
    IO.puts("\nInitialized binary tree\n")
    IO.puts("Array representation of binary tree:")
    IO.puts("#{inspect(arr)}")
    IO.puts("Linked list representation of binary tree:")
    PrintUtil.print_tree(root)

    # ArrayBinaryTree instance
    abt = new(arr)

    # Demonstrate child/parent indexing
    i = 1
    l = left(i)
    r = right(i)
    p = parent(i)

    IO.puts(
      "\nCurrent node index = #{i}, value = #{if v = val(abt, i), do: v, else: "None"}"
    )

    IO.puts("Left child index = #{l}, value = #{if v = val(abt, l), do: v, else: "None"}")
    IO.puts("Right child index = #{r}, value = #{if v = val(abt, r), do: v, else: "None"}")
    IO.puts("Parent index = #{p}, value = #{if v = val(abt, p), do: v, else: "None"}")

    # Perform and print various traversals
    IO.puts("\nLevel-order traversal: #{inspect(level_order(abt))}")
    IO.puts("Pre-order traversal: #{inspect(pre_order(abt))}")
    IO.puts("In-order traversal: #{inspect(in_order(abt))}")
    IO.puts("Post-order traversal: #{inspect(post_order(abt))}")
  end
end
