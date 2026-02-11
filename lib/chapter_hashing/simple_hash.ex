defmodule HelloAlgo.ChapterHashing.SimpleHash do
  @moduledoc """
  File: SimpleHash.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  import Bitwise

  @modulus 1_000_000_007

  @doc """
  Additive hash function: sum of character codes
  """
  def add_hash(key) do
    key
    |> String.to_charlist()
    |> Enum.reduce(0, fn char_code, h ->
      rem(h + char_code, @modulus)
    end)
  end

  @doc """
  Multiplicative hash function: polynomial rolling hash
  """
  def mul_hash(key) do
    key
    |> String.to_charlist()
    |> Enum.reduce(0, fn char_code, h ->
      rem(31 * h + char_code, @modulus)
    end)
  end

  @doc """
  XOR hash function: bitwise XOR of character codes
  """
  def xor_hash(key) do
    key
    |> String.to_charlist()
    |> Enum.reduce(0, fn char_code, h ->
      rem(bxor(h, char_code), @modulus)
    end)
  end

  @doc """
  Rotational hash function: combines shifting and XOR
  """
  def rot_hash(key) do
    key
    |> String.to_charlist()
    |> Enum.reduce(0, fn char_code, h ->
      # Simulated 32-bit rotational shift
      # We ensure h is treated as 32-bit for the shifts
      h_32 = h &&& 0xFFFFFFFF
      # Simulated unsigned 32-bit rotational shift
      shifted_left = (h_32 <<< 4) &&& 0xFFFFFFFF
      shifted_right = h_32 >>> 28
      rem(bxor(bxor(shifted_left, shifted_right), char_code), @modulus)
    end)
  end

  def run() do
    key = "Hello Algorithm"

    # Demonstrate different simple hashing methods
    h = add_hash(key)
    IO.puts("Additive hash value = #{h}")

    h = mul_hash(key)
    IO.puts("Multiplicative hash value = #{h}")

    h = xor_hash(key)
    IO.puts("XOR hash value = #{h}")

    h = rot_hash(key)
    IO.puts("Rotational hash value = #{h}")
  end
end
