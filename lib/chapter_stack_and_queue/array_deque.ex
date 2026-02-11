defmodule HelloAlgo.ChapterStackAndQueue.ArrayDeque do
  @moduledoc """
  File: ArrayDeque.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  defstruct [:nums, :front_idx, :size_val]

  @doc """
  Constructor to initialize an array-based deque with fixed capacity
  """
  def new(capacity) do
    %__MODULE__{
      nums: for(_ <- 0..(capacity - 1), do: 0),
      front_idx: 0,
      size_val: 0
    }
  end

  @doc """
  Get the capacity of the underlying array
  """
  def capacity(d), do: length(d.nums)

  @doc """
  Get the number of elements currently in the deque
  """
  def size(d), do: d.size_val

  @doc """
  Check if the deque is empty
  """
  def is_empty?(d), do: d.size_val == 0

  @doc """
  Helper to compute the circular index for the array
  """
  defp index(d, i) do
    cap = capacity(d)
    rem(i + cap, cap)
  end

  @doc """
  Add an element at the front of the deque
  """
  def push_first(d, num) do
    if d.size_val == capacity(d) do
      IO.puts("Deque is full")
      d
    else
      # Shift front index backward
      new_front_idx = index(d, d.front_idx - 1)
      new_nums = List.replace_at(d.nums, new_front_idx, num)
      %{d | nums: new_nums, front_idx: new_front_idx, size_val: d.size_val + 1}
    end
  end

  @doc """
  Add an element at the rear of the deque
  """
  def push_last(d, num) do
    if d.size_val == capacity(d) do
      IO.puts("Deque is full")
      d
    else
      # Calculate rear index based on front index and current size
      rear = index(d, d.front_idx + d.size_val)
      new_nums = List.replace_at(d.nums, rear, num)
      %{d | nums: new_nums, size_val: d.size_val + 1}
    end
  end

  @doc """
  Return the front element without removing it
  """
  def peek_first(d) do
    if is_empty?(d), do: raise "Deque is empty"
    Enum.at(d.nums, d.front_idx)
  end

  @doc """
  Return the rear element without removing it
  """
  def peek_last(d) do
    if is_empty?(d), do: raise "Deque is empty"
    last = index(d, d.front_idx + d.size_val - 1)
    Enum.at(d.nums, last)
  end

  @doc """
  Remove and return the front element
  """
  def pop_first(d) do
    num = peek_first(d)
    new_front_idx = index(d, d.front_idx + 1)
    {num, %{d | front_idx: new_front_idx, size_val: d.size_val - 1}}
  end

  @doc """
  Remove and return the rear element
  """
  def pop_last(d) do
    num = peek_last(d)
    {num, %{d | size_val: d.size_val - 1}}
  end

  @doc """
  Return all elements in the deque as a standard list for display
  """
  def to_array(d) do
    if d.size_val == 0 do
      []
    else
      for i <- 0..(d.size_val - 1) do
        Enum.at(d.nums, index(d, d.front_idx + i))
      end
    end
  end

  def run() do
    # Initialize deque
    deque = new(10)
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
