defmodule HelloAlgo.ChapterStackAndQueue.ArrayQueue do
  @moduledoc """
  File: ArrayQueue.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  # Array to store elements, Index of front element, Current number of elements
  defstruct [:nums, :front_idx, :size_val]

  @doc """
  Constructor to initialize an array-based queue with fixed capacity
  """
  def new(capacity) do
    %__MODULE__{
      nums: for(_ <- 0..(capacity - 1), do: 0),
      front_idx: 0,
      size_val: 0
    }
  end

  @doc """
  Get the capacity of the queue
  """
  def capacity(q), do: length(q.nums)

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
    if size(q) == capacity(q), do: raise "Queue is full"
    # Calculate rear index using modulo for circularity
    rear = rem(q.front_idx + q.size_val, capacity(q))
    new_nums = List.replace_at(q.nums, rear, num)
    %{q | nums: new_nums, size_val: q.size_val + 1}
  end

  @doc """
  Access the front element without removing it
  """
  def peek(q) do
    if is_empty?(q), do: raise "Queue is empty"
    Enum.at(q.nums, q.front_idx)
  end

  @doc """
  Remove and return the front element from the queue
  """
  def pop(q) do
    num = peek(q)
    # Advance front index circularly
    new_front_idx = rem(q.front_idx + 1, capacity(q))
    {num, %{q | front_idx: new_front_idx, size_val: q.size_val - 1}}
  end

  @doc """
  Return all current elements in the queue as a list for display
  """
  def to_list(q) do
    if q.size_val == 0 do
      []
    else
      for i <- 0..(q.size_val - 1) do
        Enum.at(q.nums, rem(q.front_idx + i, capacity(q)))
      end
    end
  end

  def run() do
    # Initialize queue
    queue = new(10)
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

    # Test circular array property
    Enum.reduce(0..9, queue, fn i, acc ->
      acc = push(acc, i)
      {_, acc} = pop(acc)
      IO.puts("Round #{i} enqueue + dequeue, queue = [#{Enum.join(to_list(acc), ", ")}]")
      acc
    end)
  end
end
