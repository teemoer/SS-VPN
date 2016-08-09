package test;

/**
 * Created by IntelliJ IDEA 15.0
 * User ZW_Teemoer
 * Date 2016/7/13 0013
 * Time 13:52
 */
public class Test {
    public static void main(String[] args) {
        //final List<Integer> longList = Arrays.asList(1, 2, 3, 4, 5, 6, 7);
        //;
        //
        //final List<Integer> indexList = Arrays.asList(1, 2, 3, 4, 5, 6, 7);
        //
        //List<Integer> telList= longList.stream().filter(obj -> indexList.get(obj) != null).collect(Collectors
        // .toList());
        //System.out.println(telList);
        ////longList.forEach(System.out::println);
                            // 0  1  2  3  4  5  6  7  8
        int[] array = new int[]{1, 3, 6, 0, 2, 8, 4, 9, 7};
        int[] index = new int[]{0, 5, 1, 0, 7, 3, 4, 2, 6, 2, 8};
        StringBuilder tel = new StringBuilder();
        for (int i : index) {
            tel.append(array[i]);
        }
        System.out.println("联系方式:" + tel.toString());
    }
}
