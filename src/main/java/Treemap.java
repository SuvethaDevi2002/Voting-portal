import java.util.*;
public class Treemap {
    public static void main(String[] args)
    {
    Map<String, Integer> map = new TreeMap<String, Integer>();
        map.put("Sudha", 10);
        map.put("Mohan", 30);
        map.put("Praveen", 20);
        for (Map.Entry<String, Integer> e : map.entrySet())
           System.out.println(e.getKey() + " "+ e.getValue());

    }
}