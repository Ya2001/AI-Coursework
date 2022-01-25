package uk.ac.hw.macs.search;


import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Set;
/**
 * This is the class that implements SearchOrder and is used to sort the fringe
 */
public class FringeSort implements SearchOrder {

    
    public void addToFringe(List<FringeNode> frontier, FringeNode parent, Set<ChildWithCost> children){

    // Here we are creating a for loop through the set children
        for (ChildWithCost child : children){

    // For sorting the fringe we use the sort method from the collections library
    // along with a comparator
            frontier.add(new FringeNode(child.node, parent, child.cost));
            Collections.sort(frontier, new Comparator<FringeNode>(){
        
    /* We compare adjacent values and return the difference of the 2 F Values.
    (the F Values by getting the cost of getting to this node plus the estimated heuristic value)
    Then reverse the list as this is in ascending order and we want the lowest value to be at the front.
    */ 
                public int compare (FringeNode a, FringeNode b){
                         return b.getFValue() - a.getFValue(); 
                     }
            }.reversed());
        }
    
    }
    
}
    

