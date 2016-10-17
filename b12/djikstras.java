import java.io.*;
import java.util.*;


class djikstras
{

		static int V=5;

		public static void main(String args[])
		{

			int graph[][]=new int[][]{{0,4,0,8,0},{4,0,3,0,0},{0,3,0,4,0},{8,0,4,0,7},{0,0,0,7,0}};
			
			djikstras dj=new djikstras();
			
			long starttime=System.nanoTime();
			dj.algorithm(graph,0);
			long endtime=System.nanoTime();
			System.out.println("total time required was "+(endtime-starttime));
			
		}
		public int minimum(int dist[],Boolean sptset[])
		{
			int minimum=Integer.MAX_VALUE;
			int min_index=-1;

			for(int i=0;i<V;i++)
			{
				if(dist[i]<minimum && sptset[i]==false)
					{
						minimum=dist[i];
						min_index=i;
					}
			}
			return min_index;
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
			Boolean sptset[]=new Boolean[V];

			for(int i=0;i<V;i++)
			{
				dist[i]=Integer.MAX_VALUE;
				sptset[i]=false;
			}
			
			dist[source]=0;
					
			for(int i=0;i<V-1;i++)
			{
				int u=minimum(dist,sptset);
				sptset[u]=true;

				for(int j=0;j<V;j++)
				{
					if( !sptset[j] && graph[i][j]!=0 && dist[i]!=Integer.MAX_VALUE&& dist[i]+graph[i][j]<dist[j])
						dist[j]=dist[i]+graph[i][j];

				}
			}
			printsoln(dist);
		}
}		
				
			




