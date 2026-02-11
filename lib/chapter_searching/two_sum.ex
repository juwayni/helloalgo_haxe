defmodule HelloAlgo.ChapterSearching.TwoSum do
  @moduledoc """
  File: TwoSum.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Method 1: Brute force solution using two nested loops (O(n^2) time)
  """
  def two_sum_brute_force(nums, target) do
    n = length(nums)

    res =
      for i <- 0..(n - 2), j <- (i + 1)..(n - 1) do
        if Enum.at(nums, i) + Enum.at(nums, j) == target do
          return_result([i, j])
        else
          nil
        end
      end

    Enum.find(res, &(!is_nil(&1))) || []
  end

  defp return_result(res), do: res

  @doc """
  Method 2: Optimized solution using a hash map (O(n) time)
  """
  def two_sum_hash_table(nums, target) do
    # Map to store value-to-index associations
    nums
    |> Enum.with_index()
    |> Enum.reduce_while(%{}, fn {num, i}, dic ->
      complement = target - num

      # Check if complement exists in the map
      if Map.has_key?(dic, complement) do
        {:halt, [Map.get(dic, complement), i]}
      else
        # Store current value and its index
        {:cont, Map.put(dic, num, i)}
      end
    end)
    |> case do
      res when is_list(res) -> res
      _ -> []
    end
  end

  def run() do
    # Test array and target
    nums = [2, 7, 11, 15]
    target = 13

    # Execute and print results for both methods
    res1 = two_sum_brute_force(nums, target)
    IO.puts("Method 1 res = [#{Enum.join(res1, ", ")}]")

    res2 = two_sum_hash_table(nums, target)
    IO.puts("Method 2 res = [#{Enum.join(res2, ", ")}]")
  end
end
