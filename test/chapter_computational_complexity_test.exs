defmodule HelloAlgo.ChapterComputationalComplexityTest do
  use ExUnit.Case

  alias HelloAlgo.ChapterComputationalComplexity.{Iteration, Recursion, SpaceComplexity, TimeComplexity, WorstBestTimeComplexity}

  test "Iteration run" do
    Iteration.run()
  end

  test "Recursion run" do
    Recursion.run()
  end

  test "SpaceComplexity run" do
    SpaceComplexity.run()
  end

  test "TimeComplexity run" do
    TimeComplexity.run()
  end

  test "WorstBestTimeComplexity run" do
    WorstBestTimeComplexity.run()
  end
end
