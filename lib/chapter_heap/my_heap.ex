defmodule HelloAlgo.ChapterHeap.MyHeap do
  @moduledoc """
  File: MyHeap.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.Modules.PrintUtil

  defstruct [:max_heap]

  @doc """
  Constructor for max-heap, can build from an initial list of numbers
  """
  def new(nums \\ nil) do
    if is_nil(nums) do
      %__MODULE__{max_heap: []}
    else
      h = %__MODULE__{max_heap: nums}

      # Perform heapify for all non-leaf nodes in reverse order
      if size(h) > 0 do
        start_idx = parent(size(h) - 1)

        new_max_heap =
          Enum.reduce(start_idx..0, h.max_heap, fn i, acc_data ->
            sift_down_data(acc_data, i)
          end)

        %{h | max_heap: new_max_heap}
      else
        h
      end
    end
  end

  @doc """
  Get index of left child of node at index i
  """
  defp left(i), do: 2 * i + 1

  @doc """
  Get index of right child of node at index i
  """
  defp right(i), do: 2 * i + 2

  @doc """
  Get index of parent of node at index i
  """
  defp parent(i), do: div(i - 1, 2)

  @doc """
  Swap elements at indices i and j
  """
  defp swap(data, i, j) do
    val_i = Enum.at(data, i)
    val_j = Enum.at(data, j)

    data
    |> List.replace_at(i, val_j)
    |> List.replace_at(j, val_i)
  end

  @doc """
  Return current number of elements in heap
  """
  def size(h), do: length(h.max_heap)

  @doc """
  Check if heap is empty
  """
  def is_empty?(h), do: size(h) == 0

  @doc """
  Access the maximum element (root) without removing it
  """
  def peek(h) do
    if is_empty?(h), do: raise "Heap is empty"
    List.first(h.max_heap)
  end

  @doc """
  Restore heap property by moving element at index i down the tree
  """
  defp sift_down_data(data, i) do
    len = length(data)
    l = left(i)
    r = right(i)
    ma = i

    # Compare with left child
    ma = if l < len and Enum.at(data, l) > Enum.at(data, ma), do: l, else: ma
    # Compare with right child
    ma = if r < len and Enum.at(data, r) > Enum.at(data, ma), do: r, else: ma

    # If the current node is already the largest, we are done
    if ma != i do
      # Otherwise, swap and continue sifting down
      data |> swap(i, ma) |> sift_down_data(ma)
    else
      data
    end
  end

  @doc """
  Restore heap property by moving element at index i up the tree
  """
  defp sift_up_data(data, i) do
    p = parent(i)

    # Stop if at root or parent is already larger or equal
    if p >= 0 and Enum.at(data, i) > Enum.at(data, p) do
      data |> swap(i, p) |> sift_up_data(p)
    else
      data
    end
  end

  @doc """
  Insert a new value into the heap
  """
  def push(h, val) do
    new_data = h.max_heap ++ [val]
    %{h | max_heap: sift_up_data(new_data, length(new_data) - 1)}
  end

  @doc """
  Remove and return the maximum element from the heap
  """
  def pop(h) do
    if is_empty?(h), do: raise "Heap is empty"
    len = size(h)
    data = h.max_heap
    val_root = List.first(data)

    if len == 1 do
      {val_root, %{h | max_heap: []}}
    else
      # Swap root with last element
      val_last = List.last(data)
      data_without_last = List.delete_at(data, -1)
      # Restore heap property from the root
      new_data = List.replace_at(data_without_last, 0, val_last)
      {val_root, %{h | max_heap: sift_down_data(new_data, 0)}}
    end
  end

  @doc """
  Print the heap representation
  """
  def print(h) do
    PrintUtil.print_heap(h.max_heap)
  end

  def run() do
    # Initialize max-heap with a list of values
    my_heap = new([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
    IO.puts("\nAfter building max-heap from list")
    print(my_heap)

    # Peek top element
    IO.puts("\nTop element is #{peek(my_heap)}")

    # Enqueue element
    val = 7
    my_heap = push(my_heap, val)
    IO.puts("\nAfter element #{val} enqueued")
    print(my_heap)

    # Dequeue top element
    {pop_val, my_heap} = pop(my_heap)
    IO.puts("\nTop element #{pop_val} dequeued")
    print(my_heap)

    # Check size and emptiness
    IO.puts("\nHeap size is #{size(my_heap)}")
    IO.puts("\nIs heap empty: #{is_empty?(my_heap)}")
  end
end
