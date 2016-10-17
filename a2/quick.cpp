#include<iostream>
#include<pthread.h>
using namespace std;
int n=0;

class parameters
{
	public:
			int *array;
			int firstI;
			int lastI;

	static void* quick(void*);
};

void* parameters::quick(void* a)
{
parameters *p=(parameters *)a;
int firstI=p->firstI;
int lastI=p->lastI;

pthread_t id=pthread_self();

		if(firstI<lastI)
		{

			int i=p->firstI;
			int j=p->lastI;
			int pivot=p->array[p->firstI];

			while(i<j)
			{
				while(p->array[i]<=pivot && i<=j)
					i++;
				
				while(p->array[j]>pivot && i<=j)
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

			cout<<"thread id "<<id<<" founded pivot "<<pivot<<" ";
			for(int s=firstI;s<=lastI;s++)
				cout<<p->array[s]<<" ";
			cout<<endl;

			parameters *p1=new parameters();
			parameters *p2=new parameters();
	
			p1->array=new int[n];
			p1->array=p->array;
			p1->firstI=p->firstI;
			p1->lastI=j-1;
			
			p2->array=new int[n];
			p2->array=p->array;
			p2->firstI=j+1;
			p2->lastI=p->lastI;

			pthread_t threads[2];

			pthread_create(&threads[0],NULL,&quick,(void *)p1);
			pthread_create(&threads[1],NULL,&quick,(void *)p2);
			
			pthread_join(threads[0],NULL);
			pthread_join(threads[1],NULL);
		}
}



int main()
{
		cout<<"enter size of array "<<endl;
		cin>>n;
		parameters *a=new parameters();
		a->array=new int[n];
		a->firstI=0;
		a->lastI=n-1;

		cout<<"now enter elements "<<endl;
		for(int i=0;i<n;i++)
			cin>>a->array[i];

		a->quick(a);

		cout<<"sorted array is "<<endl;
		for(int i=0;i<n;i++)
			cout<<a->array[i]<<" ";
		cout<<endl;
		
		return 0;
}
		
		



				

