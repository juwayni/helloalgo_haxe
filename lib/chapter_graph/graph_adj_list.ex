defmodule HelloAlgo.ChapterGraph.GraphAdjList do
  @moduledoc """
  File: GraphAdjList.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.Modules.Vertex

  defstruct [:adj_list]

  @doc """
  Constructor for adjacency list graph
  """
  def new(edges \\ nil) do
    graph = %__MODULE__{adj_list: %{}}

    if is_nil(edges) do
      graph
    else
      Enum.reduce(edges, graph, fn [v1, v2], acc ->
        acc
        |> add_vertex(v1)
        |> add_vertex(v2)
        |> add_edge(v1, v2)
      end)
    end
  end

  @doc """
  Get the number of vertices in the graph
  """
  def size(graph), do: Kernel.map_size(graph.adj_list)

  @doc """
  Add a vertex to the graph
  """
  def add_vertex(graph, vet) do
    if Map.has_key?(graph.adj_list, vet) do
      graph
    else
      # adjList.set(vet, new Array<Vertex>());
      %{graph | adj_list: Map.put(graph.adj_list, vet, [])}
    end
  end

  @doc """
  Add an undirected edge between vet1 and vet2
  """
  def add_edge(graph, vet1, vet2) do
    if !Map.has_key?(graph.adj_list, vet1) or !Map.has_key?(graph.adj_list, vet2) or vet1 == vet2 do
      raise "Invalid vertex or self-loop"
    end

    adj1 = Map.get(graph.adj_list, vet1)
    adj2 = Map.get(graph.adj_list, vet2)

    new_adj_list =
      graph.adj_list
      |> Map.put(vet1, adj1 ++ [vet2])
      |> Map.put(vet2, adj2 ++ [vet1])

    %{graph | adj_list: new_adj_list}
  end

  @doc """
  Remove the edge between vet1 and vet2
  """
  def remove_edge(graph, vet1, vet2) do
    if !Map.has_key?(graph.adj_list, vet1) or !Map.has_key?(graph.adj_list, vet2) or vet1 == vet2 do
      raise "Invalid vertex or self-loop"
    end

    adj1 = Map.get(graph.adj_list, vet1)
    adj2 = Map.get(graph.adj_list, vet2)

    new_adj_list =
      graph.adj_list
      |> Map.put(vet1, Enum.reject(adj1, &(&1 == vet2)))
      |> Map.put(vet2, Enum.reject(adj2, &(&1 == vet1)))

    %{graph | adj_list: new_adj_list}
  end

  @doc """
  Remove a vertex and all its connected edges from the graph
  """
  def remove_vertex(graph, vet) do
    if !Map.has_key?(graph.adj_list, vet) do
      raise "Vertex not found"
    end

    # Remove the vertex from the adjacency list (keys)
    new_adj_list = Map.delete(graph.adj_list, vet)

    # Remove all edges connected to this vertex in other vertices' lists
    new_adj_list =
      Enum.into(new_adj_list, %{}, fn {v, adj} ->
        {v, Enum.reject(adj, &(&1 == vet))}
      end)

    %{graph | adj_list: new_adj_list}
  end

  @doc """
  Print the adjacency list representation of the graph
  """
  def print(graph) do
    IO.puts("Adjacency list =")

    Enum.each(graph.adj_list, fn {vertex, adjacent} ->
      vals = Enum.map(adjacent, & &1.val)
      IO.puts("#{vertex.val}: [#{Enum.join(vals, ", ")}],")
    end)
  end

  def run() do
    # Initialize undirected graph
    v = Vertex.vals_to_vets([1, 3, 2, 5, 4])
    edges = [
      [Enum.at(v, 0), Enum.at(v, 1)],
      [Enum.at(v, 0), Enum.at(v, 3)],
      [Enum.at(v, 1), Enum.at(v, 2)],
      [Enum.at(v, 2), Enum.at(v, 3)],
      [Enum.at(v, 2), Enum.at(v, 4)],
      [Enum.at(v, 3), Enum.at(v, 4)]
    ]
    graph = new(edges)
    IO.puts("\nAfter initialization, the graph is")
    print(graph)

    # Add edge 1-2
    graph = add_edge(graph, Enum.at(v, 0), Enum.at(v, 2))
    IO.puts("\nAfter adding edge 1-2, the graph is")
    print(graph)

    # Remove edge 1-3
    graph = remove_edge(graph, Enum.at(v, 0), Enum.at(v, 1))
    IO.puts("\nAfter removing edge 1-3, the graph is")
    print(graph)

    # Add vertex 6
    v5 = %Vertex{val: 6}
    graph = add_vertex(graph, v5)
    IO.puts("\nAfter adding vertex 6, the graph is")
    print(graph)

    # Remove vertex 3
    graph = remove_vertex(graph, Enum.at(v, 1))
    IO.puts("\nAfter removing vertex 3, the graph is")
    print(graph)
  end
end
