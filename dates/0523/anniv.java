// Java公開記念日：今日のToDoをシャッフル
import java.util.*;
class JavaDay{
    public static void main(String[] a){
        List<String> todo = Arrays.asList("Code","Read","Run","Coffee");
        Collections.shuffle(todo);
        System.out.println("Java Release Anniversary Day Plan:");
        todo.forEach(System.out::println);
    }
}
