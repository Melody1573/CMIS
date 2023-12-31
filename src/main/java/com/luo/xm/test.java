package com.luo.xm;

import com.luo.xm.uitl.BASE64Util;
import org.junit.Test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

public class test {
    public static void main(String[] args) throws IOException {
        String encoder = BASE64Util.Encoder("123");
        System.out.println(encoder);
        String decode = BASE64Util.Decode(encoder);
        System.out.println(decode);
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
}
