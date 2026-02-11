defmodule HelloAlgo.ChapterBacktrackingTest do
  use ExUnit.Case

  alias HelloAlgo.ChapterBacktracking.{PreOrderTraversalICompact, PreOrderTraversalIICompact, PreOrderTraversalIIICompact, PreOrderTraversalIIITemplate, PermutationsI, PermutationsII, NQueens, SubsetSumINaive, SubsetSumI, SubsetSumII}

  test "PreOrderTraversalICompact run" do
    PreOrderTraversalICompact.run()
  end

  test "PreOrderTraversalIICompact run" do
    PreOrderTraversalIICompact.run()
  end

  test "PreOrderTraversalIIICompact run" do
    PreOrderTraversalIIICompact.run()
  end

  test "PreOrderTraversalIIITemplate run" do
    PreOrderTraversalIIITemplate.run()
  end

  test "PermutationsI run" do
    PermutationsI.run()
  end

  test "PermutationsII run" do
    PermutationsII.run()
  end

  test "NQueens run" do
    NQueens.run()
  end

  test "SubsetSumINaive run" do
    SubsetSumINaive.run()
  end

  test "SubsetSumI run" do
    SubsetSumI.run()
  end

  test "SubsetSumII run" do
    SubsetSumII.run()
  end
end
