defmodule HelloAlgo.ChapterSorting.RadixSort do
  @moduledoc """
  File: RadixSort.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Get the digit at a specific place value (exp)
  """
  defp get_digit(num, exp) do
    div(num, exp) |> rem(10)
  end

  @doc """
  Stable counting sort based on a specific digit (exp)
  """
  defp counting_sort_digit(nums, exp) do
    n = length(nums)
    # Count occurrences of each digit (0-9)
    counter = Enum.reduce(nums, List.duplicate(0, 10), fn num, acc ->
      d = get_digit(num, exp)
      val = Enum.at(acc, d)
      List.replace_at(acc, d, val + 1)
    end)

    # Compute prefix sums
    counter_prefix = Enum.scan(counter, 0, fn x, acc -> x + acc end)

    # Build result array by traversing in reverse for stability
    {res_map, _final_counter} = Enum.reduce(Enum.reverse(nums), {%{}, counter_prefix}, fn num, {res, counts} ->
      d = get_digit(num, exp)
      idx = Enum.at(counts, d) - 1
      new_res = Map.put(res, idx, num)
      new_counts = List.replace_at(counts, d, idx)
      {new_res, new_counts}
    end)

    # Update original array (return new list)
    for i <- 0..(n - 1), do: Map.get(res_map, i)
  end

  @doc """
  Radix sort algorithm (LSD approach)
  """
  def radix_sort(nums) do
    if length(nums) == 0 do
      []
    else
      # Find maximum value to determine number of digits
      m = Enum.max(nums)
      # Perform counting sort for each digit position
      do_radix_sort(nums, 1, m)
    end
  end

  defp do_radix_sort(nums, exp, m) when exp <= m do
    new_nums = counting_sort_digit(nums, exp)
    do_radix_sort(new_nums, exp * 10, m)
  end

  defp do_radix_sort(nums, _exp, _m), do: nums

  def run() do
    nums = [
      10546151,
      35663510,
      42865989,
      34862445,
      81883077,
      88906420,
      72429244,
      30524779,
      82060337,
      63832996
    ]
    sorted_nums = radix_sort(nums)
    IO.puts("After radix sort, nums = [#{Enum.join(sorted_nums, ", ")}]")
  end
end
