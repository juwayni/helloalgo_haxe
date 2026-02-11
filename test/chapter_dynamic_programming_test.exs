defmodule HelloAlgo.ChapterDynamicProgrammingTest do
  use ExUnit.Case

  alias HelloAlgo.ChapterDynamicProgramming.{ClimbingStairsBacktrack, ClimbingStairsDfs, ClimbingStairsDfsMem, ClimbingStairsDp, ClimbingStairsConstraintDp, MinCostClimbingStairsDp, MinPathSum, Knapsack, UnboundedKnapsack, EditDistance, CoinChange, CoinChangeII}

  test "ClimbingStairsBacktrack run" do
    ClimbingStairsBacktrack.run()
  end

  test "ClimbingStairsDfs run" do
    ClimbingStairsDfs.run()
  end

  test "ClimbingStairsDfsMem run" do
    ClimbingStairsDfsMem.run()
  end

  test "ClimbingStairsDp run" do
    ClimbingStairsDp.run()
  end

  test "ClimbingStairsConstraintDp run" do
    ClimbingStairsConstraintDp.run()
  end

  test "MinCostClimbingStairsDp run" do
    MinCostClimbingStairsDp.run()
  end

  test "MinPathSum run" do
    MinPathSum.run()
  end

  test "Knapsack run" do
    Knapsack.run()
  end

  test "UnboundedKnapsack run" do
    UnboundedKnapsack.run()
  end

  test "EditDistance run" do
    EditDistance.run()
  end

  test "CoinChange run" do
    CoinChange.run()
  end

  test "CoinChangeII run" do
    CoinChangeII.run()
  end
end
