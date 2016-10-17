object BinarySearch
{

	def main(arr:Array[String])
	{
		println ("enter size of array");
		var size=readInt();

		var array=new Array[Int](size);

		println ("now enter the elements");
		for ( i <- 0 to size-1)
		{
			array(i)=readInt();
		}

		println("array entered is "+array.toList);
	
		println ("enter key to search for ");
		var key=readInt();

		Bubble(array,size);
		
		println("sorted array is  "+array.toList);
	
		Binary(array,0,size-1,key);

		
		

	}


	def Bubble(arr:Array[Int],size:Int)
	{
		for ( i <- 0 until size-1)
		{
			for (j <- 0 until size-1-i)
				{
					if (arr(j)>arr(j+1))
					{
						var temp=arr(j);
						arr(j)=arr(j+1);
						arr(j+1)=temp;
					}
				}
		}
	}



	def Binary(arr:Array[Int],l:Int,r:Int,key:Int)
	{
		
		if(r<l)
			{
				println("not found");
				return;
			}
		if(r>=l)
			{
				var mid=(l+r)/2;
				
				if(arr(mid)==key)
					{
						println("found at pos "+(mid+1));
						return;
					}
				if(r==l)
				{
					println("not found");
					return;
				}
				if(key<arr(mid))
					Binary(arr,0,mid-1,key);
				else
					Binary(arr,mid+1,r,key);
	}
	}




}
