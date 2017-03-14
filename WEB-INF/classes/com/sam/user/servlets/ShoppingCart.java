package com.sam.user.servlets;

import java.util.HashMap;

public class ShoppingCart {
	HashMap<Movie, Integer> items;
	public ShoppingCart(){
		items = new HashMap<Movie, Integer>();
	}
	
	public HashMap<Movie, Integer> getItems(){
		return items;
	}
	//adds item into the hashmap  
	
	public void addItem(Movie m){
		
		if (items.containsKey(m) ){
			Integer currentQuantity = items.get(m);
			items.put(m, currentQuantity+1);
		}else{
			items.put(m,1);
		}
		
	}
	//update the price of an item by a number based on the quantity
	
	

	public void changeQuantity(Movie m,int quantity){
		if(quantity > 0 ){
			items.put(m,quantity);
		}else{
			items.remove(m);
		}
	}
	//removes the item if it exists
	
	public void removeItem(Movie m){
		items.remove(m);
	}
	
	public void remove_all(){
		items.clear();
	}
	
}
