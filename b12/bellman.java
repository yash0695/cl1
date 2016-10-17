import java.io.*;
import java.util.*;


class bellman
{

		static int V=5;

		public static void main(String args[])
		{

			int graph[][]=new int[][]{{0,4,0,8,0},{4,0,3,0,0},{0,3,0,4,0},{8,0,4,0,7},{0,0,0,7,0}};
			
			bellman dj=new bellman();
			
			long starttime=System.nanoTime();
			dj.algorithm(graph,0);
			long endtime=System.nanoTime();
			System.out.println("total time required was "+(endtime-starttime));
			
		}
		
		
		public void printsoln(int dist[])
		{
			System.out.println("distance to nodes are.....");
		System.out.println("NODE\t\t\tDistance");
		for(int i=0;i<V;i++)
		{
			System.out.println(i+"\t\t\t"+dist[i]);
		}
		}	

		public void algorithm(int graph[][],int source)
		{
			int dist[]=new int[V];
			

			for(int i=0;i<V;i++)
			{
				dist[i]=Integer.MAX_VALUE;
				
			}
			
			dist[source]=0;
					
			for(int i=0;i<V-1;i++)
			{
				
		
				for(int j=0;j<V;j++)

				{

					for(int k=0;k<V;k++)
					{
					if(graph[j][k]!=0 && dist[j]!=Integer.MAX_VALUE&& dist[j]+graph[j][k]<dist[k])
						dist[k]=dist[j]+graph[j][k];
					}

				}
			}
			printsoln(dist);
		}
}		
				
			




