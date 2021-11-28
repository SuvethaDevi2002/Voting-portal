import java.util.*;
public class Hashmap{
    public static void main(String[] args)
    {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("Usha", 10);
        map.put("Saradha", 30);
        map.put("Leela", 20);
        for (Map.Entry<String, Integer> e : map.entrySet())
            System.out.println(e.getKey() + " " + e.getValue());

    }
}