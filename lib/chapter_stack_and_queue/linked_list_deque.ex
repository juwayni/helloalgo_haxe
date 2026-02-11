defmodule HelloAlgo.ChapterStackAndQueue.LinkedListDeque do
  @moduledoc """
  File: LinkedListDeque.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  # For Elixir port, we use a native List to represent the Deque.
  # Although Haxe uses a doubly linked list, in a functional language
  # like Elixir, using a native List or two lists is more appropriate.
  # Here we use a single list for simplicity, acknowledging O(n) for rear operations.

  defstruct [:items, :size_val]

  @doc """
  Constructor for a deque based on a doubly linked list
  """
  def new() do
    %__MODULE__{items: [], size_val: 0}
  end

  @doc """
  Get the number of elements in the deque
  """
  def size(d), do: d.size_val

  @doc """
  Check if the deque is empty
  """
  def is_empty?(d), do: d.size_val == 0

  @doc """
  Add element at the front
  """
  def push_first(d, num) do
    %{d | items: [num | d.items], size_val: d.size_val + 1}
  end

  @doc """
  Add element at the rear
  """
  def push_last(d, num) do
    %{d | items: d.items ++ [num], size_val: d.size_val + 1}
  end

  @doc """
  Remove and return the front element
  """
  def pop_first(d) do
    if is_empty?(d), do: raise "Deque is empty"
    [head | tail] = d.items
    {head, %{d | items: tail, size_val: d.size_val - 1}}
  end

  @doc """
  Remove and return the rear element
  """
  def pop_last(d) do
    if is_empty?(d), do: raise "Deque is empty"
    val = List.last(d.items)
    new_items = List.delete_at(d.items, -1)
    {val, %{d | items: new_items, size_val: d.size_val - 1}}
  end

  @doc """
  Peek at the front element
  """
  def peek_first(d) do
    if is_empty?(d), do: raise "Deque is empty"
    List.first(d.items)
  end

  @doc """
  Peek at the rear element
  """
  def peek_last(d) do
    if is_empty?(d), do: raise "Deque is empty"
    List.last(d.items)
  end

  @doc """
  Convert the deque to a list for display
  """
  def to_array(d), do: d.items

  def run() do
    # Initialize deque
    deque = new()
    deque = push_last(deque, 3)
    deque = push_last(deque, 2)
    deque = push_last(deque, 5)
    IO.puts("Deque deque = #{inspect(to_array(deque))}")

    # Peek operations
    IO.puts("Front element peekFirst = #{peek_first(deque)}")
    IO.puts("Rear element peekLast = #{peek_last(deque)}")

    # Push operations
    deque = push_last(deque, 4)
    IO.puts("After pushing 4 to last, deque = #{inspect(to_array(deque))}")
    deque = push_first(deque, 1)
    IO.puts("After pushing 1 to first, deque = #{inspect(to_array(deque))}")

    # Pop operations
    {pop_last_val, deque} = pop_last(deque)
    IO.puts("Popped last element = #{pop_last_val}, after popping last, deque = #{inspect(to_array(deque))}")

    {pop_first_val, deque} = pop_first(deque)
    IO.puts("Popped first element = #{pop_first_val}, after popping first, deque = #{inspect(to_array(deque))}")

    # Size check
    IO.puts("Deque length size = #{size(deque)}")
    # Empty check
    IO.puts("Is deque empty = #{is_empty?(deque)}")
  end
end
