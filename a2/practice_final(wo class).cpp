#include<iostream>
#include<pthread.h>
using namespace std;

int n;

struct parameters
{
	int *array;
	int firstI;
	int lastI;
};


void *quick(void *a)
{

	parameters* p=(parameters *)a;
	int firstI=p->firstI;
	int lastI=p->lastI;

	pthread_t id=pthread_self();

			if(firstI<lastI)
			{
				int i=p->firstI;
				int j=p->lastI;
				int pivot=p->array[firstI];
				while(i<j)
				{
					while(p->array[i]<=pivot && i<=j)
						i++;
					while(p->array[j]>=pivot && i<=j)
						j--;
					if(i<=j)
					{
						int temp=p->array[i];	
						p->array[i]=p->array[j];
						p->array[j]=temp;
					}
				}
				int temp=p->array[j];	
				p->array[j]=p->array[p->firstI];
				p->array[p->firstI]=temp;
			
 
			cout<<"Thread id "<<id<<" pivot "<<pivot<<endl;
			for(int t=firstI;t<=lastI;t++)
				cout<<p->array[t]<<" ";
			cout<<endl;
			
			pthread_t threads[2];
			parameters p1,p2;
			
			p1.array=new int[n];
			p1.array=p->array;
			p1.firstI=p->firstI;
			p1.lastI=j-1;

			p2.array=new int[n];
			p2.array=p->array;
			p2.firstI=j+1;
			p2.lastI=p->lastI;

			pthread_create(&threads[0],NULL,&quick,(void *)&p1);
			pthread_create(&threads[1],NULL,&quick,(void *)&p2);
	
			pthread_join(threads[0],NULL);
			pthread_join(threads[1],NULL);
		}
}		



int main()
{
cout<<"enter size of array "<<endl;
cin>>n;
parameters a;
cout<<"Enter the elements\n";
a.array=new int[n];
a.firstI=0;
a.lastI=n-1;
for(int i=0;i<n;i++)
	cin>>a.array[i];
quick(&a);
cout<<"Sorted array\n";
for(int i=0;i<n;i++)
	cout<<a.array[i]<<" ";
cout<<endl;
return 0;
}				
				
