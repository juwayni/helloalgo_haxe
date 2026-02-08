/**
 * File: GraphAdjMat.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_graph;

import modules.PrintUtil;

class GraphAdjMat {
    public var vertices: Array<Int>;
    public var adjMat: Array<Array<Int>>;

    /**
     * Constructor for adjacency matrix graph
     */
    public function new(vertices: Array<Int>, edges: Array<Array<Int>>) {
        this.vertices = new Array<Int>();
        this.adjMat = new Array<Array<Int>>();
        if (vertices != null) {
            for (val in vertices) {
                addVertex(val);
            }
        }
        if (edges != null) {
            for (e in edges) {
                addEdge(e[0], e[1]);
            }
        }
    }

    /**
     * Get number of vertices in the graph
     */
    public function size(): Int {
        return vertices.length;
    }

    /**
     * Add a new vertex with given value
     */
    public function addVertex(val: Int) {
        var n = size();
        // Add new vertex value
        vertices.push(val);
        // Add a new row in adjacency matrix
        var newRow = new Array<Int>();
        for (i in 0...n) newRow.push(0);
        adjMat.push(newRow);
        // Add a new column in adjacency matrix
        for (row in adjMat) {
            row.push(0);
        }
    }

    /**
     * Add an undirected edge between vertices at indices i and j
     */
    public function addEdge(i: Int, j: Int) {
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
            throw "Index out of bounds";
        }
        // In undirected graph, adjacency matrix is symmetric
        adjMat[i][j] = 1;
        adjMat[j][i] = 1;
    }

    /**
     * Remove the vertex at given index
     */
    public function removeVertex(index: Int) {
        if (index >= size()) {
            throw "Index out of bounds";
        }
        // Remove vertex from vertices list
        vertices.splice(index, 1);
        // Remove the row at index in adjacency matrix
        adjMat.splice(index, 1);
        // Remove the column at index in adjacency matrix
        for (row in adjMat) {
            row.splice(index, 1);
        }
    }

    /**
     * Remove the edge between vertices at indices i and j
     */
    public function removeEdge(i: Int, j: Int) {
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
            throw "Index out of bounds";
        }
        adjMat[i][j] = 0;
        adjMat[j][i] = 0;
    }

    /**
     * Print the adjacency matrix representation
     */
    public function print() {
        Sys.println("Vertices list = [" + vertices.join(", ") + "]");
        Sys.println("Adjacency matrix =");
        PrintUtil.printMatrix(adjMat);
    }

    public static function main() {
        // Initialize undirected graph
        var vertices = [1, 3, 2, 5, 4];
        var edges = [[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]];
        var graph = new GraphAdjMat(vertices, edges);
        Sys.println("\nAfter initialization, the graph is");
        graph.print();

        // Add edge 1-2 (indices 0 and 2)
        graph.addEdge(0, 2);
        Sys.println("\nAfter adding edge 1-2, the graph is");
        graph.print();

        // Remove edge 1-3 (indices 0 and 1)
        graph.removeEdge(0, 1);
        Sys.println("\nAfter removing edge 1-3, the graph is" );
        graph.print();

        // Add vertex 6
        graph.addVertex(6);
        Sys.println("\nAfter adding vertex 6, the graph is");
        graph.print();

        // Remove vertex 3 (index 1)
        graph.removeVertex(1);
        Sys.println("\nAfter removing vertex 3, the graph is");
        graph.print();
    }
}
