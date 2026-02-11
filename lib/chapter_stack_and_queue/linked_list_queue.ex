defmodule HelloAlgo.ChapterStackAndQueue.LinkedListQueue do
  @moduledoc """
  File: LinkedListQueue.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.Modules.ListNode

  # Head node, Tail node, size
  defstruct [:front_node, :rear_node, :size_val]

  @doc """
  Constructor for a queue based on a singly linked list
  """
  def new() do
    %__MODULE__{front_node: nil, rear_node: nil, size_val: 0}
  end

  @doc """
  Get the number of elements in the queue
  """
  def size(q), do: q.size_val

  @doc """
  Check if the queue is empty
  """
  def is_empty?(q), do: q.size_val == 0

  @doc """
  Add an element to the rear of the queue
  """
  def push(q, num) do
    node = %ListNode{val: num}

    if is_nil(q.front_node) do
      %{q | front_node: node, rear_node: node, size_val: 1}
    else
      # In Elixir, due to immutability, we must rebuild the list to "append" at the end.
      # This is O(n), unlike the O(1) in Haxe with a tail pointer.
      new_front = append_node(q.front_node, node)
      %{q | front_node: new_front, rear_node: node, size_val: q.size_val + 1}
    end
  end

  defp append_node(nil, new_node), do: new_node

  defp append_node(curr, new_node) do
    %{curr | next: append_node(curr.next, new_node)}
  end

  @doc """
  Peek at the front element without removing it
  """
  def peek(q) do
    if is_empty?(q), do: raise "Queue is empty"
    q.front_node.val
  end

  @doc """
  Remove and return the front element from the queue
  """
  def pop(q) do
    num = peek(q)
    new_front = q.front_node.next
    new_rear = if is_nil(new_front), do: nil, else: q.rear_node
    {num, %{q | front_node: new_front, rear_node: new_rear, size_val: q.size_val - 1}}
  end

  @doc """
  Convert the queue to a standard list for display
  """
  def to_list(q) do
    collect_vals(q.front_node)
  end

  defp collect_vals(nil), do: []
  defp collect_vals(node), do: [node.val | collect_vals(node.next)]

  def run() do
    # Initialize queue
    queue = new()
    # Enqueue some elements
    queue = push(queue, 1)
    queue = push(queue, 3)
    queue = push(queue, 2)
    queue = push(queue, 5)
    queue = push(queue, 4)
    IO.puts("Queue queue = [#{Enum.join(to_list(queue), ", ")}]")

    # Peek front element
    peek_val = peek(queue)
    IO.puts("Front element peek = #{peek_val}")

    # Dequeue an element
    {pop_val, queue} = pop(queue)
    IO.puts("Dequeued element pop = #{pop_val}")
    IO.puts("After dequeueing, queue = [#{Enum.join(to_list(queue), ", ")}]")

    # Check size and emptiness
    IO.puts("Queue length size = #{size(queue)}")
    IO.puts("Is queue empty = #{is_empty?(queue)}")
  end
end
