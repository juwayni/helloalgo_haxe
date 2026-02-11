defmodule HelloAlgo.ChapterGreedyTest do
  use ExUnit.Case

  alias HelloAlgo.ChapterGreedy.{CoinChangeGreedy, FractionalKnapsack, MaxCapacity, MaxProductCutting}

  test "CoinChangeGreedy run" do
    CoinChangeGreedy.run()
  end

  test "FractionalKnapsack run" do
    FractionalKnapsack.run()
  end

  test "MaxCapacity run" do
    MaxCapacity.run()
  end

  test "MaxProductCutting run" do
    MaxProductCutting.run()
  end
end
