/**
 * File: GraphBfs.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_graph;

import modules.Vertex;
import chapter_graph.GraphAdjList;

class GraphBfs {
    /**
     * Breadth-first search traversal of the graph
     */
    public static function graphBfs(graph: GraphAdjList, startVet: Vertex): Array<Vertex> {
        // Sequence to store the traversal result
        var res = new Array<Vertex>();
        // Set to keep track of visited vertices (using Map in Haxe for HashSet behavior)
        var visited = new Map<Vertex, Bool>();
        visited.set(startVet, true);
        // Queue for BFS implementation
        var que = new Array<Vertex>();
        que.push(startVet);

        while (que.length > 0) {
            var vet = que.shift(); // Dequeue from front
            res.push(vet); // Record visited vertex

            // Traverse all adjacent vertices
            if (graph.adjList.exists(vet)) {
                for (adjVet in graph.adjList.get(vet)) {
                    if (visited.exists(adjVet)) {
                        continue; // Skip visited vertices
                    }
                    que.push(adjVet); // Enqueue unvisited adjacent vertices
                    visited.set(adjVet, true); // Mark as visited
                }
            }
        }

        return res;
    }

    public static function main() {
        // Initialize undirected graph
        var v = Vertex.valsToVets([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
        var edges = [
            [v[0], v[1]],
            [v[0], v[3]],
            [v[1], v[2]],
            [v[1], v[4]],
            [v[2], v[5]],
            [v[3], v[4]],
            [v[3], v[6]],
            [v[4], v[5]],
            [v[4], v[7]],
            [v[5], v[8]],
            [v[6], v[7]],
            [v[7], v[8]]
        ];
        var graph = new GraphAdjList(edges);
        Sys.println("\nAfter initialization, the graph is");
        graph.print();

        // Perform BFS starting from vertex 0
        var res = graphBfs(graph, v[0]);
        Sys.println("\nBreadth-first search (BFS) vertex sequence is");
        Sys.println("[" + Vertex.vetsToVals(res).join(", ") + "]");
    }
}
