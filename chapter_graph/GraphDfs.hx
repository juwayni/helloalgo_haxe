/**
 * File: GraphDfs.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_graph;

import modules.Vertex;
import chapter_graph.GraphAdjList;

class GraphDfs {
    /**
     * Recursive helper function for depth-first search
     */
    private static function dfs(graph: GraphAdjList, visited: Map<Vertex, Bool>, res: Array<Vertex>, vet: Vertex) {
        res.push(vet); // Record visited vertex
        visited.set(vet, true); // Mark as visited

        // Traverse all adjacent vertices recursively
        if (graph.adjList.exists(vet)) {
            for (adjVet in graph.adjList.get(vet)) {
                if (visited.exists(adjVet)) {
                    continue; // Skip already visited vertices
                }
                // Recursively visit adjacent vertex
                dfs(graph, visited, res, adjVet);
            }
        }
    }

    /**
     * Depth-first search traversal of the graph
     */
    public static function graphDfs(graph: GraphAdjList, startVet: Vertex): Array<Vertex> {
        var res = new Array<Vertex>();
        var visited = new Map<Vertex, Bool>();
        dfs(graph, visited, res, startVet);
        return res;
    }

    public static function main() {
        // Initialize undirected graph
        var v = Vertex.valsToVets([0, 1, 2, 3, 4, 5, 6]);
        var edges = [
            [v[0], v[1]],
            [v[0], v[3]],
            [v[1], v[2]],
            [v[2], v[5]],
            [v[4], v[5]],
            [v[5], v[6]]
        ];
        var graph = new GraphAdjList(edges);
        Sys.println("\nAfter initialization, the graph is");
        graph.print();

        // Perform DFS starting from vertex 0
        var res = graphDfs(graph, v[0]);
        Sys.println("\nDepth-first search (DFS) vertex sequence is");
        Sys.println("[" + Vertex.vetsToVals(res).join(", ") + "]");
    }
}
