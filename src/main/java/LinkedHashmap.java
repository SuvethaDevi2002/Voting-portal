import java.util.*;
public class LinkedHashmap{
    public static void main(String[] args)
    {
        Map<String, Integer> map = new LinkedHashMap<String, Integer>();
        map.put("Viknesh", 10);
        map.put("Shyam", 30);
        map.put("Aravindh", 20);
        for (Map.Entry<String, Integer> e : map.entrySet())
            System.out.println(e.getKey() + " " + e.getValue());

    }
} 
