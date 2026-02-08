/**
 * File: GraphAdjList.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_graph;

import modules.Vertex;

class GraphAdjList {
    // Adjacency list: Vertex as key, list of adjacent vertices as value
    public var adjList: Map<Vertex, Array<Vertex>>;

    /**
     * Constructor for adjacency list graph
     */
    public function new(edges: Array<Array<Vertex>>) {
        this.adjList = new Map<Vertex, Array<Vertex>>();
        if (edges != null) {
            for (edge in edges) {
                addVertex(edge[0]);
                addVertex(edge[1]);
                addEdge(edge[0], edge[1]);
            }
        }
    }

    /**
     * Get the number of vertices in the graph
     */
    public function size(): Int {
        var count = 0;
        for (v in adjList.keys()) count++;
        return count;
    }

    /**
     * Add a vertex to the graph
     */
    public function addVertex(vet: Vertex) {
        if (adjList.exists(vet)) {
            return;
        }
        adjList.set(vet, new Array<Vertex>());
    }

    /**
     * Add an undirected edge between vet1 and vet2
     */
    public function addEdge(vet1: Vertex, vet2: Vertex) {
        if (!adjList.exists(vet1) || !adjList.exists(vet2) || vet1 == vet2) {
            throw "Invalid vertex or self-loop";
        }
        adjList.get(vet1).push(vet2);
        adjList.get(vet2).push(vet1);
    }

    /**
     * Remove the edge between vet1 and vet2
     */
    public function removeEdge(vet1: Vertex, vet2: Vertex) {
        if (!adjList.exists(vet1) || !adjList.exists(vet2) || vet1 == vet2) {
            throw "Invalid vertex or self-loop";
        }
        var list1 = adjList.get(vet1);
        var i = 0;
        while (i < list1.length) {
            if (list1[i] == vet2) {
                list1.splice(i, 1);
            } else {
                i++;
            }
        }
        var list2 = adjList.get(vet2);
        var j = 0;
        while (j < list2.length) {
            if (list2[j] == vet1) {
                list2.splice(j, 1);
            } else {
                j++;
            }
        }
    }

    /**
     * Remove a vertex and all its connected edges from the graph
     */
    public function removeVertex(vet: Vertex) {
        if (!adjList.exists(vet)) {
            throw "Vertex not found";
        }
        // Remove the vertex from the adjacency list
        adjList.remove(vet);
        // Remove all edges connected to this vertex in other vertices' lists
        for (v in adjList.keys()) {
            var list = adjList.get(v);
            var i = 0;
            while (i < list.length) {
                if (list[i] == vet) {
                    list.splice(i, 1);
                } else {
                    i++;
                }
            }
        }
    }

    /**
     * Print the adjacency list representation of the graph
     */
    public function print() {
        Sys.println("Adjacency list =");
        for (vertex in adjList.keys()) {
            var adjacent = adjList.get(vertex);
            var vals = new Array<Int>();
            for (v in adjacent) vals.push(v.val);
            Sys.println(vertex.val + ": [" + vals.join(", ") + "],");
        }
    }

    public static function main() {
        // Initialize undirected graph
        var v = Vertex.valsToVets([1, 3, 2, 5, 4]);
        var edges = [
            [v[0], v[1]],
            [v[0], v[3]],
            [v[1], v[2]],
            [v[2], v[3]],
            [v[2], v[4]],
            [v[3], v[4]]
        ];
        var graph = new GraphAdjList(edges);
        Sys.println("\nAfter initialization, the graph is");
        graph.print();

        // Add edge 1-2
        graph.addEdge(v[0], v[2]);
        Sys.println("\nAfter adding edge 1-2, the graph is");
        graph.print();

        // Remove edge 1-3
        graph.removeEdge(v[0], v[1]);
        Sys.println("\nAfter removing edge 1-3, the graph is");
        graph.print();

        // Add vertex 6
        var v5 = new Vertex(6);
        graph.addVertex(v5);
        Sys.println("\nAfter adding vertex 6, the graph is");
        graph.print();

        // Remove vertex 3
        graph.removeVertex(v[1]);
        Sys.println("\nAfter removing vertex 3, the graph is");
        graph.print();
    }
}
