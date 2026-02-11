defmodule HelloAlgo.ChapterDivideAndConquer.Hanota do
  @moduledoc """
  File: Hanota.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Move n disks from source to target using auxiliary
  """
  def dfs(n, src, aux, tar) do
    # Base case: only 1 disk left to move
    if n == 1 do
      # Move from src to tar
      {src, tar} = move(src, tar)
      {src, aux, tar}
    else
      # 1. Move top n-1 disks from src to aux
      {src, tar, aux} = dfs(n - 1, src, tar, aux)
      # 2. Move the nth (largest) disk from src to tar
      {src, tar} = move(src, tar)
      # 3. Move top n-1 disks from aux to tar
      {aux, src, tar} = dfs(n - 1, aux, src, tar)
      {src, aux, tar}
    end
  end

  @doc """
  Move one disk from one list (tower) to another
  """
  def move(src, tar) do
    # Pop disk from top of src and push to tar
    [pan | rest_src] = src
    new_tar = [pan | tar]
    {rest_src, new_tar}
  end

  @doc """
  Solve Tower of Hanoi
  """
  def solve_hanota(a, b, c) do
    n = length(a)
    # Move n disks from A to C using B as auxiliary
    dfs(n, a, b, c)
  end

  def run() do
    # Initial state: n disks on tower A
    a = [4, 3, 2, 1]
    b = []
    c = []
    IO.puts("Initial state:")
    IO.puts("Tower A: #{inspect(a)}")
    IO.puts("Tower B: #{inspect(b)}")
    IO.puts("Tower C: #{inspect(c)}")

    {a, b, c} = solve_hanota(a, b, c)

    IO.puts("\nAfter moving all disks to Tower C:")
    IO.puts("Tower A: #{inspect(a)}")
    IO.puts("Tower B: #{inspect(b)}")
    IO.puts("Tower C: #{inspect(c)}")
  end
end
