defmodule HelloAlgo.ChapterSearching.HashingSearch do
  @moduledoc """
  File: HashingSearch.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.Modules.ListNode

  @doc """
  Perform search using a hash map for O(1) average lookup time (Array input)
  """
  def hashing_search_array(hmap, target) do
    # Retrieve index from map; return -1 if not found
    Map.get(hmap, target, -1)
  end

  @doc """
  Perform search using a hash map for O(1) average lookup time (Linked list nodes)
  """
  def hashing_search_linked_list(hmap, target) do
    # Retrieve node from map; return nil if not found
    Map.get(hmap, target)
  end

  def run() do
    target = 3

    # Part 1: Hashing search in an array context
    nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
    # Build the hash map mapping element values to their indices
    map0 =
      nums
      |> Enum.with_index()
      |> Enum.reduce(%{}, fn {num, i}, acc -> Map.put(acc, num, i) end)

    index = hashing_search_array(map0, target)
    IO.puts("Index of target element 3 = #{index}")

    # Part 2: Hashing search in a linked list context
    head = ListNode.list_to_linked_list(nums)
    # Build the hash map mapping node values to node objects
    map1 = build_node_map(head, %{})

    node = hashing_search_linked_list(map1, target)
    res_str = if node, do: "#{node.val}", else: "null"
    IO.puts("Target node with value 3: #{res_str}")
  end

  defp build_node_map(nil, acc), do: acc

  defp build_node_map(node, acc) do
    build_node_map(node.next, Map.put(acc, node.val, node))
  end
end
