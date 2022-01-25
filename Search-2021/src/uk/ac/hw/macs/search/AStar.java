package uk.ac.hw.macs.search;

/**
 * Represents an implementation of State
 */
public class AStar implements State{

    private boolean goal;
    private int heuristic;
    private int[] value;

// We create 2 constructors one is for when we create a node of Astar that is the goal and one 
// for when we create a node that is not a goal.
    public AStar(int x, int y, int heuristic){
        this.goal = false;
        this.heuristic = heuristic;
        this.value = new int[] {x,y};
    }

//Both of the constructors need a heuristic value, x and y coordinates that are obtained from the 
// double for loops and a boolean goal which is false when we create a regular node and set to goal when 
// we create the goal node.

//The x and y coords are stored in the variable value as an integer array.
    public AStar(int x, int y, int heuristic, boolean goal){
        this.heuristic = heuristic;
        this.goal = goal;
        this.value = new int[] {x,y};
    }

//This is a method implemented from State. It is used to return whether or not a given node is the goal node
    public boolean isGoal(){
        return this.goal;
    }

//This is another method implemented from State. It is used to return the heuristic value of the given node 
// from the goal node
    public int getHeuristic(){
        return this.heuristic;
    }

//This is the method I use for printing out my values in the terminal in a string format. I print the x and y values 
// and whether or not the current node is the goal node.
    public String toString(){
        return "AStar [value x: " + value[0] + " value y: " + value[1] + " goal: " + goal+ "\r";
    }
 
}
