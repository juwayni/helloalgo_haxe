/**
 * File: Vertex.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package modules;

class Vertex {
    public var val: Int;

    public function new(val: Int) {
        this.val = val;
    }

    /**
     * Input value list vals, return vertex list vets
     */
    public static function valsToVets(vals: Array<Int>): Array<Vertex> {
        var vets = new Array<Vertex>();
        for (val in vals) {
            vets.push(new Vertex(val));
        }
        return vets;
    }

    /**
     * Input vertex list vets, return value list vals
     */
    public static function vetsToVals(vets: Array<Vertex>): Array<Int> {
        var vals = new Array<Int>();
        for (vet in vets) {
            vals.push(vet.val);
        }
        return vals;
    }
}
