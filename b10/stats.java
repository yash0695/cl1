import java.io.*;
import java.util.Scanner;

class stats
{

	public static void main(String args[])
		{

			int packet_count;    //no of packets to be sent
			int time_period;     //time period over which you need to send them

			float lambda;          //average rate at which packets arrive		packetcount/time_period
			float a;		// inter arrival time	(1/lambda)

			float servicetime;	//average time to service one packet
			float utime;		//packets serviced in one second

			float utilization;	
			float throughput;		

			Scanner in=new Scanner(System.in);
		        System.out.println("enter no of packets to be sent");
			packet_count=in.nextInt();

			System.out.println("enter time period");
			time_period=in.nextInt();

			System.out.println("enter service time");
			servicetime=in.nextFloat();

			lambda=packet_count/time_period;
			a=1/lambda;

			System.out.println("lambda is "+lambda+"packets/sec");
			System.out.println("inter arrival time is "+a);
			System.out.println("service time is "+servicetime);
			
			utime=1/servicetime;

			utilization=(lambda/utime)*100;
		
			if(utilization > 100)
				System.out.println("channel utilization is 100%");
			else
				System.out.println("channel utilization is "+utilization+"%");

			throughput=(a/servicetime)*100;
		
			if(throughput > 100)
				System.out.println("throughput is 100%");
			else
				System.out.println("throughput is "+throughput+"%");
		}
}


			

			

			
