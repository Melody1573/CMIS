package com.luo.xm;

import org.junit.Test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class test {
    public static void main(String[] args) throws IOException {
/*        String encoder = BASE64Util.Encoder("123");
        System.out.println(encoder);
        String decode = BASE64Util.Decode(encoder);
        System.out.println(decode);*/

        String str="测试";
        for(char c:str.toCharArray()){
            String c1=Integer.toHexString(c);
            System.out.println(c1);
        }
        System.out.println("\u6d4b\u8bd5");
    }

    @Test
    public void randoms(){
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int j = 0; j < 20; j++) {
            for (int i = 0; i < 18; i++) {
                sb.append(String.valueOf(random.nextInt(10)));
            }
            System.out.println(sb.toString());
            sb.delete(0,sb.length());
        }
    }

    @Test
    public void aaa(){
        ArrayList<Object> list1 = new ArrayList<>();
        ArrayList<Object> list2 = new ArrayList<>();
        list1.add("a");
        list1.add("b");
        list1.add("c");

        list2.add("d");
        list2.add("e");

        boolean b = list1.retainAll(list2);
        System.out.println(list1);
        System.out.println(list2);
    }

    public static boolean validateID(String id) {
        String regex = "^\\d{17}[0-9Xx]$"; // 定义身份证号码的正则表达式

        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(id);

        return matcher.matches();
    }

    @Test
    public void testCode(){
        boolean b = test.validateID("152629200009160518");
        System.out.println(b);
    }

    @Test
    public void testDate(){
        Date date = new Date();
        int month = date.getMonth();
        int year = date.getYear();
        System.out.println(month+1);
        System.out.println(year);
    }


}
