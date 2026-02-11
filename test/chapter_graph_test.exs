defmodule HelloAlgo.ChapterGraphTest do
  use ExUnit.Case

  alias HelloAlgo.ChapterGraph.{GraphAdjList, GraphAdjMat, GraphBfs, GraphDfs}

  test "GraphAdjList run" do
    GraphAdjList.run()
  end

  test "GraphAdjMat run" do
    GraphAdjMat.run()
  end

  test "GraphBfs run" do
    GraphBfs.run()
  end

  test "GraphDfs run" do
    GraphDfs.run()
  end
end
