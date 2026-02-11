defmodule HelloAlgo.ChapterGraph.GraphAdjMat do
  @moduledoc """
  File: GraphAdjMat.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.Modules.PrintUtil

  defstruct [:vertices, :adj_mat]

  @doc """
  Constructor for adjacency matrix graph
  """
  def new(vertices \\ nil, edges \\ nil) do
    graph = %__MODULE__{vertices: [], adj_mat: []}

    graph =
      if is_nil(vertices) do
        graph
      else
        Enum.reduce(vertices, graph, fn val, acc ->
          add_vertex(acc, val)
        end)
      end

    if is_nil(edges) do
      graph
    else
      Enum.reduce(edges, graph, fn [i, j], acc ->
        addEdge(acc, i, j)
      end)
    end
  end

  @doc """
  Get number of vertices in the graph
  """
  def size(graph), do: length(graph.vertices)

  @doc """
  Add a new vertex with given value
  """
  def add_vertex(graph, val) do
    n = size(graph)
    # Add new vertex value
    new_vertices = graph.vertices ++ [val]
    # Add a new row in adjacency matrix (filled with 0s)
    new_adj_mat = Enum.map(graph.adj_mat, fn row -> row ++ [0] end)
    # Add a new column in adjacency matrix (the new row itself)
    new_row = for _ <- 0..n, do: 0
    new_adj_mat = new_adj_mat ++ [new_row]

    %{graph | vertices: new_vertices, adj_mat: new_adj_mat}
  end

  @doc """
  Add an undirected edge between vertices at indices i and j
  """
  def addEdge(graph, i, j) do
    if i < 0 or j < 0 or i >= size(graph) or j >= size(graph) or i == j do
      raise "Index out of bounds"
    end

    # In undirected graph, adjacency matrix is symmetric
    new_adj_mat =
      graph.adj_mat
      |> List.replace_at(i, List.replace_at(Enum.at(graph.adj_mat, i), j, 1))
      |> List.replace_at(j, List.replace_at(Enum.at(graph.adj_mat, j), i, 1))

    %{graph | adj_mat: new_adj_mat}
  end

  @doc """
  Remove the vertex at given index
  """
  def remove_vertex(graph, index) do
    if index >= size(graph) do
      raise "Index out of bounds"
    end

    # Remove vertex from vertices list
    new_vertices = List.delete_at(graph.vertices, index)
    # Remove the row at index in adjacency matrix
    new_adj_mat = List.delete_at(graph.adj_mat, index)
    # Remove the column at index in adjacency matrix
    new_adj_mat = Enum.map(new_adj_mat, fn row -> List.delete_at(row, index) end)

    %{graph | vertices: new_vertices, adj_mat: new_adj_mat}
  end

  @doc """
  Remove the edge between vertices at indices i and j
  """
  def remove_edge(graph, i, j) do
    if i < 0 or j < 0 or i >= size(graph) or j >= size(graph) or i == j do
      raise "Index out of bounds"
    end

    new_adj_mat =
      graph.adj_mat
      |> List.replace_at(i, List.replace_at(Enum.at(graph.adj_mat, i), j, 0))
      |> List.replace_at(j, List.replace_at(Enum.at(graph.adj_mat, j), i, 0))

    %{graph | adj_mat: new_adj_mat}
  end

  @doc """
  Print the adjacency matrix representation
  """
  def print(graph) do
    IO.puts("Vertices list = #{inspect(graph.vertices)}")
    IO.puts("Adjacency matrix =")
    PrintUtil.print_matrix(graph.adj_mat)
  end

  def run() do
    # Initialize undirected graph
    vertices = [1, 3, 2, 5, 4]
    edges = [[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]]
    graph = new(vertices, edges)
    IO.puts("\nAfter initialization, the graph is")
    print(graph)

    # Add edge 1-2 (indices 0 and 2)
    graph = addEdge(graph, 0, 2)
    IO.puts("\nAfter adding edge 1-2, the graph is")
    print(graph)

    # Remove edge 1-3 (indices 0 and 1)
    graph = remove_edge(graph, 0, 1)
    IO.puts("\nAfter removing edge 1-3, the graph is")
    print(graph)

    # Add vertex 6
    graph = add_vertex(graph, 6)
    IO.puts("\nAfter adding vertex 6, the graph is")
    print(graph)

    # Remove vertex 3 (index 1)
    graph = remove_vertex(graph, 1)
    IO.puts("\nAfter removing vertex 3, the graph is")
    print(graph)
  end
end
