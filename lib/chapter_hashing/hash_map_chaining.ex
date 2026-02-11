defmodule HelloAlgo.ChapterHashing.HashMapChaining do
  @moduledoc """
  File: HashMapChaining.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.ChapterHashing.Pair

  defstruct [:size_val, :capacity_val, :load_thres, :extend_ratio, :buckets]

  @doc """
  Constructor for hash map using chaining to handle collisions
  """
  def new() do
    capacity = 4
    %__MODULE__{
      size_val: 0,
      capacity_val: capacity,
      load_thres: 2.0 / 3.0,
      extend_ratio: 2,
      buckets: for(_ <- 1..capacity, do: [])
    }
  end

  @doc """
  Hash function to map key to an array index
  """
  defp hash_func(hmap, key) do
    rem(key, hmap.capacity_val)
  end

  @doc """
  Calculate the current load factor of the hash map
  """
  defp load_factor(hmap) do
    hmap.size_val / hmap.capacity_val
  end

  @doc """
  Query the value associated with the given key by searching the corresponding chain
  """
  def get(hmap, key) do
    index = hash_func(hmap, key)
    bucket = Enum.at(hmap.buckets, index)

    case Enum.find(bucket, fn p -> p.key == key end) do
      nil -> ""
      pair -> pair.val
    end
  end

  @doc """
  Add or update a key-value pair. If load factor exceeds threshold, the map is extended.
  """
  def put(hmap, key, val) do
    hmap = if load_factor(hmap) > hmap.load_thres, do: extend(hmap), else: hmap
    index = hash_func(hmap, key)
    bucket = Enum.at(hmap.buckets, index)

    case Enum.find_index(bucket, fn p -> p.key == key end) do
      nil ->
        new_pair = Pair.new(key, val)
        new_bucket = bucket ++ [new_pair]
        new_buckets = List.replace_at(hmap.buckets, index, new_bucket)
        %{hmap | buckets: new_buckets, size_val: hmap.size_val + 1}

      idx ->
        new_pair = Pair.new(key, val)
        new_bucket = List.replace_at(bucket, idx, new_pair)
        new_buckets = List.replace_at(hmap.buckets, index, new_bucket)
        %{hmap | buckets: new_buckets}
    end
  end

  @doc """
  Delete a key-value pair from its chain
  """
  def remove(hmap, key) do
    index = hash_func(hmap, key)
    bucket = Enum.at(hmap.buckets, index)

    case Enum.find_index(bucket, fn p -> p.key == key end) do
      nil ->
        hmap

      idx ->
        new_bucket = List.delete_at(bucket, idx)
        new_buckets = List.replace_at(hmap.buckets, index, new_bucket)
        %{hmap | buckets: new_buckets, size_val: hmap.size_val - 1}
    end
  end

  @doc """
  Extend the hash map capacity and rehash existing entries
  """
  defp extend(hmap) do
    old_buckets = hmap.buckets
    new_capacity = hmap.capacity_val * hmap.extend_ratio
    new_hmap = %{hmap | capacity_val: new_capacity, buckets: for(_ <- 1..new_capacity, do: []), size_val: 0}

    Enum.reduce(old_buckets, new_hmap, fn bucket, acc_hmap ->
      Enum.reduce(bucket, acc_hmap, fn pair, acc_acc_hmap ->
        put(acc_acc_hmap, pair.key, pair.val)
      end)
    end)
  end

  @doc """
  Print all buckets and their chains
  """
  def print(hmap) do
    Enum.each(hmap.buckets, fn bucket ->
      res = Enum.map(bucket, fn pair -> "#{pair.key} -> #{pair.val}" end)
      IO.puts("[#{Enum.join(res, ", ")}]")
    end)
  end

  def run() do
    # Initialize hash map
    hashmap = new()

    # Add several entries
    hashmap = put(hashmap, 12836, "Xiao Ha")
    hashmap = put(hashmap, 15937, "Xiao Luo")
    hashmap = put(hashmap, 16750, "Xiao Suan")
    hashmap = put(hashmap, 13276, "Xiao Fa")
    hashmap = put(hashmap, 10583, "Xiao Ya")
    IO.puts("\nAfter adding, hash map is\n[Key1 -> Value1, Key2 -> Value2, ...]")
    print(hashmap)

    # Perform a lookup
    name = get(hashmap, 13276)
    IO.puts("\nInput ID 13276, queried name: #{name}")

    # Remove an entry
    hashmap = remove(hashmap, 12836)
    IO.puts("\nAfter deleting 12836, hash map is\n[Key1 -> Value1, Key2 -> Value2, ...]")
    print(hashmap)
  end
end
