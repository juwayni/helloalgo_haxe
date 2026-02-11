defmodule HelloAlgo.Modules.TreeNode do
  @moduledoc """
  File: TreeNode.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  defstruct val: 0, height: 0, left: nil, right: nil

  @doc """
  Deserialize a list into a binary tree: recursive
  """
  def list_to_tree_dfs(arr, i) do
    if i < 0 || i >= length(arr) || is_nil(Enum.at(arr, i)) do
      nil
    else
      %__MODULE__{
        val: Enum.at(arr, i),
        left: list_to_tree_dfs(arr, 2 * i + 1),
        right: list_to_tree_dfs(arr, 2 * i + 2)
      }
    end
  end

  @doc """
  Deserialize a list into a binary tree
  """
  def list_to_tree(arr) do
    list_to_tree_dfs(arr, 0)
  end

  @doc """
  Serialize a binary tree into a list: recursive
  """
  def tree_to_list_dfs(root, i, res) do
    if is_nil(root) do
      res
    else
      # Use a map to store values at their corresponding array indices
      res = Map.put(res, i, root.val)
      res = tree_to_list_dfs(root.left, 2 * i + 1, res)
      res = tree_to_list_dfs(root.right, 2 * i + 2, res)
      res
    end
  end

  @doc """
  Serialize a binary tree into a list
  """
  def tree_to_list(root) do
    res = tree_to_list_dfs(root, 0, %{})
    if Map.equal?(res, %{}) do
      []
    else
      max_i = res |> Map.keys() |> Enum.max()
      # Construct the list including potential nil values for missing nodes
      for i <- 0..max_i, do: Map.get(res, i)
    end
  end
end
