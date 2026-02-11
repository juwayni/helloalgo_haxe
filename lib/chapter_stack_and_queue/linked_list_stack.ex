defmodule HelloAlgo.ChapterStackAndQueue.LinkedListStack do
  @moduledoc """
  File: LinkedListStack.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.Modules.ListNode

  defstruct [:peek_node, :size_val]

  @doc """
  Constructor for a stack based on a singly linked list
  """
  def new() do
    %__MODULE__{peek_node: nil, size_val: 0}
  end

  @doc """
  Get the number of elements in the stack
  """
  def size(s), do: s.size_val

  @doc """
  Check if the stack is empty
  """
  def is_empty?(s), do: s.size_val == 0

  @doc """
  Push an element onto the stack
  """
  def push(s, val) do
    node = %ListNode{val: val, next: s.peek_node}
    %{s | peek_node: node, size_val: s.size_val + 1}
  end

  @doc """
  Peek at the top element without removing it
  """
  def peek(s) do
    if is_empty?(s), do: raise "Stack is empty"
    s.peek_node.val
  end

  @doc """
  Remove and return the top element from the stack
  """
  def pop(s) do
    num = peek(s)
    new_peek_node = s.peek_node.next
    {num, %{s | peek_node: new_peek_node, size_val: s.size_val - 1}}
  end

  @doc """
  Convert the stack to a standard list for display (reverses to show bottom-to-top)
  """
  def to_list(s) do
    arr = collect_vals(s.peek_node)
    # Reverse to match the typical array representation [bottom, ..., top]
    Enum.reverse(arr)
  end

  defp collect_vals(nil), do: []
  defp collect_vals(node), do: [node.val | collect_vals(node.next)]

  def run() do
    # Initialize stack
    stack = new()
    # Push some values
    stack = push(stack, 1)
    stack = push(stack, 3)
    stack = push(stack, 2)
    stack = push(stack, 5)
    stack = push(stack, 4)
    IO.puts("Stack stack = [#{Enum.join(to_list(stack), ", ")}]")

    # Peek top value
    peek_val = peek(stack)
    IO.puts("Top element peek = #{peek_val}")

    # Pop top value
    {pop_val, stack} = pop(stack)
    IO.puts("Popped element popVal = #{pop_val}")
    IO.puts("After popping, stack = [#{Enum.join(to_list(stack), ", ")}]")

    # Check size and emptiness
    IO.puts("Stack length size = #{size(stack)}")
    IO.puts("Is stack empty = #{is_empty?(stack)}")
  end
end
