defmodule HelloAlgo.ChapterArrayAndLinkedlist.LinkedList do
  @moduledoc """
  File: LinkedList.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.Modules.ListNode
  alias HelloAlgo.Modules.PrintUtil

  @doc """
  Insert node P after node n0 in the linked list
  Returns the new n0 (functionally)
  """
  def insert(n0, p) do
    n1 = n0.next
    p = %{p | next: n1}
    %{n0 | next: p}
  end

  @doc """
  Delete the first node after node n0 in the linked list
  Returns the new n0 (functionally)
  """
  def remove(n0) do
    if is_nil(n0.next) do
      n0
    else
      # n0 -> P -> n1
      p = n0.next
      n1 = p.next
      %{n0 | next: n1}
    end
  end

  @doc """
  Access the node at index in the linked list
  """
  def access(head, index) do
    do_access(head, index)
  end

  defp do_access(nil, _index), do: nil
  defp do_access(head, 0), do: head
  defp do_access(head, index), do: do_access(head.next, index - 1)

  @doc """
  Search for the first node with value target in the linked list and return its index
  """
  def find(head, target) do
    do_find(head, target, 0)
  end

  defp do_find(nil, _target, _index), do: -1

  defp do_find(head, target, index) do
    if head.val == target do
      index
    else
      do_find(head.next, target, index + 1)
    end
  end

  def run() do
    # Initialize linked list
    # Initialize nodes
    n4 = %ListNode{val: 4}
    n3 = %ListNode{val: 5, next: n4}
    n2 = %ListNode{val: 2, next: n3}
    n1 = %ListNode{val: 3, next: n2}
    n0 = %ListNode{val: 1, next: n1}

    IO.puts("Initialized linked list:")
    PrintUtil.print_linked_list(n0)

    # Insert node
    p = %ListNode{val: 0}
    n0 = insert(n0, p)
    IO.puts("Linked list after insertion:")
    PrintUtil.print_linked_list(n0)

    # Delete node
    n0 = remove(n0)
    IO.puts("Linked list after deletion:")
    PrintUtil.print_linked_list(n0)

    # Access node
    node = access(n0, 3)

    if node != nil do
      IO.puts("Value of node at index 3 in linked list = #{node.val}")
    end

    # Search node
    index = find(n0, 2)
    IO.puts("Index of node with value 2 in linked list = #{index}")
  end
end
