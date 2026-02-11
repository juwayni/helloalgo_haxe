defmodule HelloAlgo.ChapterSearching.LinearSearch do
  @moduledoc """
  File: LinearSearch.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.Modules.ListNode

  @doc """
  Perform linear search on an array
  """
  def linear_search_array(nums, target) do
    # Iterate through each element in the array
    # If match is found, return the index
    Enum.find_index(nums, fn x -> x == target end) || -1
  end

  @doc """
  Perform linear search on a linked list
  """
  def linear_search_linked_list(nil, _target), do: nil

  def linear_search_linked_list(head, target) do
    # Traverse the linked list starting from head
    # If node's value matches target, return the node
    if head.val == target do
      head
    else
      linear_search_linked_list(head.next, target)
    end
  end

  def run() do
    target = 3

    # Part 1: Linear search in an array
    nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
    index = linear_search_array(nums, target)
    IO.puts("Index of target element 3 = #{index}")

    # Part 2: Linear search in a linked list
    head = ListNode.list_to_linked_list(nums)
    node = linear_search_linked_list(head, target)
    res_str = if node, do: "#{node.val}", else: "null"
    IO.puts("Target node with value 3: #{res_str}")
  end
end
