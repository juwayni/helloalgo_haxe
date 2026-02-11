defmodule HelloAlgo.ChapterGraph.GraphBfs do
  @moduledoc """
  File: GraphBfs.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.Modules.Vertex
  alias HelloAlgo.ChapterGraph.GraphAdjList

  @doc """
  Breadth-first search traversal of the graph
  """
  def graph_bfs(graph, start_vet) do
    # Sequence to store the traversal result
    # Set to keep track of visited vertices
    # Queue for BFS implementation
    do_graph_bfs(graph, [start_vet], MapSet.new([start_vet]), [])
  end

  defp do_graph_bfs(_graph, [], _visited, res), do: Enum.reverse(res)

  defp do_graph_bfs(graph, [vet | rest], visited, res) do
    # Dequeue from front, record visited vertex

    # Traverse all adjacent vertices
    adjacents = Map.get(graph.adj_list, vet, [])

    # Filter unvisited neighbors and enqueue them
    {new_que, new_visited} = Enum.reduce(adjacents, {rest, visited}, fn adj, {q_acc, v_acc} ->
      if MapSet.member?(v_acc, adj) do
        {q_acc, v_acc} # Skip visited vertices
      else
        {q_acc ++ [adj], MapSet.put(v_acc, adj)} # Enqueue unvisited and mark as visited
      end
    end)

    do_graph_bfs(graph, new_que, new_visited, [vet | res])
  end

  def run() do
    # Initialize undirected graph
    v = Vertex.vals_to_vets(Enum.to_list(0..9))
    edges = [
      [Enum.at(v, 0), Enum.at(v, 1)],
      [Enum.at(v, 0), Enum.at(v, 3)],
      [Enum.at(v, 1), Enum.at(v, 2)],
      [Enum.at(v, 1), Enum.at(v, 4)],
      [Enum.at(v, 2), Enum.at(v, 5)],
      [Enum.at(v, 3), Enum.at(v, 4)],
      [Enum.at(v, 3), Enum.at(v, 6)],
      [Enum.at(v, 4), Enum.at(v, 5)],
      [Enum.at(v, 4), Enum.at(v, 7)],
      [Enum.at(v, 5), Enum.at(v, 8)],
      [Enum.at(v, 6), Enum.at(v, 7)],
      [Enum.at(v, 7), Enum.at(v, 8)]
    ]
    graph = GraphAdjList.new(edges)
    IO.puts("\nAfter initialization, the graph is")
    GraphAdjList.print(graph)

    # Perform BFS starting from vertex 0
    res = graph_bfs(graph, Enum.at(v, 0))
    IO.puts("\nBreadth-first search (BFS) vertex sequence is")
    IO.puts("[#{Enum.join(Vertex.vets_to_vals(res), ", ")}]")
  end
end
