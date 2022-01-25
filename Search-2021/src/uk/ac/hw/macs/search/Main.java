package uk.ac.hw.macs.search;
import java.lang.Math;

public class Main {

    public static void main (String[] args){

    /* Here I define my state grid. I have defined it as a 2D array.
     The values of 1,3 and 100 corresspond with the colour of the squares from the 
     problem state 1 and 2 
    The 1 is for white squares; the 3 is for gray squares and the 100 is for the walls
    */ 
        // int [][] state1 = {
        //     {1,1,1,1,1,1},
        //     {1,100,100,100,1,1},
        //     {1,100,3,3,1,1},
        //     {3,3,3,1,3,1}
        //     };
        // We also provide the program with the goal for each of the states
        // int [] state1goal = {3,3};

        int [][] state1 = {
            {1,3,3,1,1,1},
            {1,3,100,100,1,1},
            {1,1,1,1,100,1},
            {1,1,1,1,1,1}
            };
            
        int [] state1goal = {5,2};

        // We also define a node grid. I chose to name both grids the same name and comment them in and out to test if the worked
        // instead of making the program dynamic enough to find the best path while both were available
        Node [][]state1grid = new Node[4][6];

        // For instantiating through the grid we create a double for loop
            for(int y = 0; y < state1.length ; y++){
                for (int x = 0; x < state1[y].length ; x++){
        // We check if the loop has reached the goal coords 
                    if (x == state1goal[0] && y == state1goal[1]){

        /* We calculate the hueristic value and store it as an integer h
         For calculating the value we take the x and y value of the goal and 
        subtract it from the current position of x and y
        */ 
                    int h = (Math.abs(state1goal[0] - x) + Math.abs(state1goal[1] - y));

        // We add the node as true because we have found the goal node
                        state1grid[y][x] = new Node(new AStar (x, y, h, true));}
                    
        // We check to make sure that we are not at a wall.
                    else if (state1[y][x] != 100){
                            int h = (Math.abs(state1goal[0] - x) + Math.abs(state1goal[1] - y));
                            state1grid[y][x] =new Node (new AStar (x, y, h));
                    }
                }
            }

        // For defining all the children of the nodes we again create a double for loop
            for (int y = 0; y < state1grid.length; y++){
                for (int x = 0; x <  state1grid[y].length; x++){

        /* This if statement is to ensure that all the objects that we are accessing are 
         an instance of Node. Without this check the walls would have been added as 
         accessible nodes 
        */ 
                    if (state1grid[y][x] instanceof Node){

        /* Here we create 4 if statements that all check if the object adjacent to them is an instance of 
         Node. We also need to check in the y-1 and the x-1 if they are equal to or greater than because 
         if not for this check we would end up out of bounds. If the adjacent object is found to be a 
         Node it is added as a child
          */
                        if (y+1 < state1grid.length && state1grid [y+1][x] instanceof Node){
                        state1grid [y][x].addChild(state1grid [y+1][x], state1[y+1][x]);
                        }
                        if (y-1 >= 0 && state1grid [y-1][x] instanceof Node){
                            state1grid [y][x].addChild(state1grid [y-1][x], state1[y-1][x]);
                        }
                        if (x+1 < state1grid[y].length && state1grid [y][x+1] instanceof Node){
                            state1grid [y][x].addChild(state1grid [y][x+1], state1[y][x+1]);
                        }
                        if (x-1 >= 0 && state1grid [y][x-1] instanceof Node){
                            state1grid [y][x].addChild(state1grid [y][x-1], state1[y][x-1]);
                        }
                }
                    
                }
            }
        /** This is a piece of code I wrote for debugging and it is hence commented out.
         * The purpose of this code is to print out the hueristics as a grid.
         * */  

            // for(int y = 0; y < state1grid.length; y++){
            //     System.out.println();
            //     for (int x = 0; x <  state1grid[y].length; x++){
            //         if (state1grid[y][x] instanceof AStar){
            //             System.out.print(state1grid[y][x].getHeuristic());}
            //         else{
            //             System.out.print("X");
            //         };
            //     }
            // }

        // This is the code that runs the search 
            FringeSort sort = new FringeSort();
            SearchProblem astarProblem = new SearchProblem(sort);
            astarProblem.doSearch(state1grid[0][0]);


        }
    }

