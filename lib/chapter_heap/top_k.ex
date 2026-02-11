defmodule HelloAlgo.ChapterHeap.TopK do
  @moduledoc """
  File: TopK.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.Modules.PrintUtil

  @doc """
  A basic Min-Heap implementation to support Top-K search
  """
  defmodule MinHeap do
    defstruct data: []

    def new(), do: %__MODULE__{data: []}

    def push(heap, val) do
      new_data = heap.data ++ [val]
      new_heap = %{heap | data: new_data}
      sift_up(new_heap, length(new_data) - 1)
    end

    def pop(heap) do
      top = List.first(heap.data)

      if length(heap.data) > 1 do
        last = List.last(heap.data)
        data_without_last = List.delete_at(heap.data, -1)
        new_data = List.replace_at(data_without_last, 0, last)
        new_heap = %{heap | data: new_data}
        {top, sift_down(new_heap, 0)}
      else
        {top, %{heap | data: []}}
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

  @doc """
  Find the largest k elements in an array using a min-heap
  """
  def top_k_heap(nums, k) do
    # Initialize min-heap
    heap = MinHeap.new()

    # Enqueue the first k elements
    heap =
      Enum.reduce(0..(k - 1), heap, fn i, acc ->
        MinHeap.push(acc, Enum.at(nums, i))
      end)

    # For the remaining elements, keep the heap size constant at k
    heap =
      if length(nums) > k do
        Enum.reduce(k..(length(nums) - 1), heap, fn i, acc ->
          val = Enum.at(nums, i)

          # If the current element is larger than the smallest element in the heap, replace it
          if val > MinHeap.peek(acc) do
            {_, acc} = MinHeap.pop(acc)
            MinHeap.push(acc, val)
          else
            acc
          end
        end)
      else
        heap
      end

    # Return all elements currently in the heap
    heap.data
  end

  def run() do
    var_nums = [1, 7, 6, 3, 2]
    k = 3

    # Perform top-k search
    res = top_k_heap(var_nums, k)
    IO.puts("The largest #{k} elements are")
    PrintUtil.print_heap(res)
  end
end
