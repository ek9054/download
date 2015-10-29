package com.test2;
import java.util.*;
public class Container {
	Map map=new HashMap();
	String[] cls={"com.test2.A","com.test2.B","com.test2.C"};
	String[] key={"a","b","c"};
	public Container()
	{
		try
		{
			for(int i=0;i<3;i++)
			{
				Class clsName=Class.forName(cls[i]);
				Object obj = clsName.newInstance();
				map.put(key[i], obj);
			}
		}catch(Exception ex){}
	}
	public I lookup(String key)
	{
		return (I)map.get(key);
	}
}
