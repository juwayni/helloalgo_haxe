defmodule HelloAlgo.ChapterDivideAndConquerTest do
  use ExUnit.Case

  alias HelloAlgo.ChapterDivideAndConquer.{BinarySearchRecur, BuildTree, Hanota}

  test "BinarySearchRecur run" do
    BinarySearchRecur.run()
  end

  test "BuildTree run" do
    BuildTree.run()
  end

  test "Hanota run" do
    Hanota.run()
  end
end
