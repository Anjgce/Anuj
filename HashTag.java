/*Assumptions : 
 *valid tweeets : #sachin #sehwag....(two hashtags should be seperated with at least one space)
 *invalid tweets : #sachin#sehwag....(without seperated by space)
 */

/*
 * INPUT : #sachin is god of cricket Worlds best cricketer is #sachin #sehwag was best opener #dhoni is best finisher #dhoni #dhoni #dhoni #yuvraj #dhoni #hitman #rohitsharma #hitman #rohitsharma #bahubali #virushka #six #four #pandya #maahithala #maahithala #mahi #mahi
 * 
*/


package com.anuj;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.StringTokenizer;

public class HashTag {

	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);
		System.out.println("Enter tweets : ");
		String s=sc.nextLine();
		String tweets;
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		StringTokenizer tok=new StringTokenizer(s," ");
		while(tok.hasMoreElements()) {
			String str=tok.nextToken();
			if(str.contains("#")) {
				tweets=str;
				if(map.containsKey(tweets)) {
					map.put(tweets,map.get(tweets)+1 );
				}
				else {
					map.put(tweets,1 );
				}
			}	
		}
		Map<String, Integer> map1 = sortByValue(map);
		System.out.println("Counting of hashtags : ");
		for (Map.Entry<String, Integer> en : map1.entrySet()) { 
            System.out.println("Key = " + en.getKey() +  ", Value = " + en.getValue()); 
        }
		ArrayList<String> keys = new ArrayList<String>(map1.keySet());
		System.out.println("Top 10 trending hashtags are following : ");
        for(int i=keys.size()-1; i>=0 && i>=map1.size()-10; i--){
            System.out.println((keys.get(i)));
        }

	}
	public static HashMap<String, Integer> sortByValue(HashMap<String, Integer> hm) 
    { 
        // Create a list from elements of HashMap 
        List<Map.Entry<String, Integer> > list = 
               new LinkedList<Map.Entry<String, Integer> >(hm.entrySet()); 
  
        // Sort the list 
        Collections.sort(list, new Comparator<Map.Entry<String, Integer> >() { 
            public int compare(Map.Entry<String, Integer> o1,  
                               Map.Entry<String, Integer> o2) 
            { 
                return (o1.getValue()).compareTo(o2.getValue()); 
            } 
        }); 
          
        // put data from sorted list to hashmap  
        HashMap<String, Integer> temp = new LinkedHashMap<String, Integer>(); 
        for (Map.Entry<String, Integer> aa : list) { 
            temp.put(aa.getKey(), aa.getValue()); 
        } 
        return temp; 
    }

}
