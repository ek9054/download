package com.test2;

public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Container c = new Container();
		I i=c.lookup("a");
		i.display();
		 i=c.lookup("b");
		i.display();
		
		 i=c.lookup("c");
		i.display();
	}

}
