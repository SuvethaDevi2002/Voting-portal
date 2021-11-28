import java.util.*;    

public class Collection{

public static void main(String[] args) {
// TODO Auto-generated method stub
ArrayList<String> list1 = new ArrayList<String>();
list1.add("Bala");
list1.add("Barani");
list1.add("Deepak");
list1.add("Jeeva");
System.out.println(list1);
list1.remove("Deepak");
System.out.println(list1);

Iterator i = list1.iterator();

while(i.hasNext()) {
System.out.println(i.next());
}

LinkedList<String> list2 = new LinkedList<String>();
list2.add("Suvetha");
list2.addFirst("Farhana");
list2.add("Madhu");
list2.addLast("Deepika");
System.out.println(list2);
list2.removeLast();
System.out.println(list2);

Iterator i2 = list2.iterator();

while(i2.hasNext()) {
System.out.println(i2.next());
}

HashSet<String> list3 = new HashSet<String>();
HashSet<String> set1=new HashSet<String>();  
set1.add("Vijay");  
        set1.add("Tharan");  
        set1.add("Sudharsan");  
        System.out.println("list of elements in set1: "+set1);
       
list3.add("Surendhar");
list3.add("Keerthi");
list3.add("Ashika");
        System.out.println("list of elements in set2:"+list3);
list3.addAll(set1);
        System.out.println("list of elements in set2:"+list3);

System.out.println(list3);
list3.remove("Sudharsan");    
System.out.println(list3);

Iterator i3 = list3.iterator();

while(i3.hasNext()) {
System.out.println(i3.next());
}


}

}