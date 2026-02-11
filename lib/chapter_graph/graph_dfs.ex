defmodule HelloAlgo.ChapterGraph.GraphDfs do
  @moduledoc """
  File: GraphDfs.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.Modules.Vertex
  alias HelloAlgo.ChapterGraph.GraphAdjList

  @doc """
  Depth-first search traversal of the graph
  """
  def graph_dfs(graph, start_vet) do
    # res to store traversal, visited to track visited vertices
    {res, _visited} = do_dfs(graph, MapSet.new(), [], start_vet)
    Enum.reverse(res)
  end

  @doc """
  Recursive helper function for depth-first search
  """
  defp do_dfs(graph, visited, res, vet) do
    if MapSet.member?(visited, vet) do
      # Skip already visited vertices
      {res, visited}
    else
      # Record visited vertex and mark as visited
      visited = MapSet.put(visited, vet)
      res = [vet | res]

      # Traverse all adjacent vertices recursively
      adjacents = Map.get(graph.adj_list, vet, [])

      Enum.reduce(adjacents, {res, visited}, fn adj, {r_acc, v_acc} ->
        # Recursively visit adjacent vertex
        do_dfs(graph, v_acc, r_acc, adj)
      end)
    end
  end

  def run() do
    # Initialize undirected graph
    v = Vertex.vals_to_vets(Enum.to_list(0..6))
    edges = [
      [Enum.at(v, 0), Enum.at(v, 1)],
      [Enum.at(v, 0), Enum.at(v, 3)],
      [Enum.at(v, 1), Enum.at(v, 2)],
      [Enum.at(v, 2), Enum.at(v, 5)],
      [Enum.at(v, 4), Enum.at(v, 5)],
      [Enum.at(v, 5), Enum.at(v, 6)]
    ]
    graph = GraphAdjList.new(edges)
    IO.puts("\nAfter initialization, the graph is")
    GraphAdjList.print(graph)

    # Perform DFS starting from vertex 0
    res = graph_dfs(graph, Enum.at(v, 0))
    IO.puts("\nDepth-first search (DFS) vertex sequence is")
    IO.puts("[#{Enum.join(Vertex.vets_to_vals(res), ", ")}]")
  end
end
