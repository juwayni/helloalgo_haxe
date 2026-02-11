defmodule HelloAlgo.ChapterHeap.MinHeap do
  @moduledoc """
  A basic Min-Heap implementation to simulate Nim's std/heapqueue
  """

  defstruct data: []

  def new(), do: %__MODULE__{data: []}

  def push(heap, val) do
    new_data = heap.data ++ [val]
    new_heap = %{heap | data: new_data}
    sift_up(new_heap, length(new_data) - 1)
  end

  def pop(heap) do
    cond do
      length(heap.data) == 0 ->
        {0, heap}

      length(heap.data) == 1 ->
        {List.first(heap.data), %{heap | data: []}}

      true ->
        top = List.first(heap.data)
        last = List.last(heap.data)
        data_without_last = List.delete_at(heap.data, -1)
        new_data = List.replace_at(data_without_last, 0, last)
        new_heap = %{heap | data: new_data}
        {top, sift_down(new_heap, 0)}
    end
  end

  def peek(heap), do: List.first(heap.data)

  def size(heap), do: length(heap.data)

  defp sift_up(heap, i) when i <= 0, do: heap

  defp sift_up(heap, i) do
    p = div(i - 1, 2)
    val_i = Enum.at(heap.data, i)
    val_p = Enum.at(heap.data, p)

    if val_i < val_p do
      new_data =
        heap.data
        |> List.replace_at(i, val_p)
        |> List.replace_at(p, val_i)

      sift_up(%{heap | data: new_data}, p)
    else
      heap
    end
  end

  defp sift_down(heap, i) do
    l = 2 * i + 1
    r = 2 * i + 2
    min = i
    len = length(heap.data)

    min = if l < len and Enum.at(heap.data, l) < Enum.at(heap.data, min), do: l, else: min
    min = if r < len and Enum.at(heap.data, r) < Enum.at(heap.data, min), do: r, else: min

    if min != i do
      val_i = Enum.at(heap.data, i)
      val_min = Enum.at(heap.data, min)

      new_data =
        heap.data
        |> List.replace_at(i, val_min)
        |> List.replace_at(min, val_i)

      sift_down(%{heap | data: new_data}, min)
    else
      heap
    end
  end
end

defmodule HelloAlgo.ChapterHeap.HeapModule do
  @moduledoc """
  File: Heap.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.ChapterHeap.MinHeap
  alias HelloAlgo.Modules.PrintUtil

  def test_push(heap, val, flag \\ 1) do
    heap = MinHeap.push(heap, flag * val)
    IO.puts("\nAfter element #{val} enqueued")
    res = Enum.map(heap.data, fn x -> flag * x end)
    PrintUtil.print_heap(res)
    heap
  end

  def test_pop(heap, flag \\ 1) do
    {val, heap} = MinHeap.pop(heap)
    val = flag * val
    IO.puts("\nAfter top element #{val} dequeued")
    res = Enum.map(heap.data, fn x -> flag * x end)
    PrintUtil.print_heap(res)
    heap
  end

  def run() do
    # Demonstrate max-heap by negating elements in a min-heap (similar to Nim logic)
    max_heap = MinHeap.new()
    flag = -1

    IO.puts("\nThe following test cases are for max-heap")

    max_heap = test_push(max_heap, 1, flag)
    max_heap = test_push(max_heap, 3, flag)
    max_heap = test_push(max_heap, 2, flag)
    max_heap = test_push(max_heap, 5, flag)
    max_heap = test_push(max_heap, 4, flag)

    peek_val = flag * MinHeap.peek(max_heap)
    IO.puts("\nTop element is #{peek_val}")

    max_heap = test_pop(max_heap, flag)
    max_heap = test_pop(max_heap, flag)
    max_heap = test_pop(max_heap, flag)
    max_heap = test_pop(max_heap, flag)
    max_heap = test_pop(max_heap, flag)

    IO.puts("\nHeap size is #{MinHeap.size(max_heap)}")
    IO.puts("\nIs heap empty: #{MinHeap.size(max_heap) == 0}")

    # Build min-heap directly
    min_heap2 =
      Enum.reduce([1, 3, 2, 5, 4], MinHeap.new(), fn x, acc ->
        MinHeap.push(acc, x)
      end)

    IO.puts("\nAfter building min-heap from list")
    PrintUtil.print_heap(min_heap2.data)
  end
end
