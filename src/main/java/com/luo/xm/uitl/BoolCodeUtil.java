package com.luo.xm.uitl;

import com.luo.xm.model.Person;
import com.luo.xm.service.PersonServiceImpl;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 功能：
 * 作者：Luo。
 * 日期：2024/1/2 11:43
 */
public class BoolCodeUtil {
    public static boolean validateID(String code) {
        // 18位身份证正则表达式
        String regex = "^[1-9]\\d{5}(18|19|20)\\d{2}(0[1-9]|1[0-2])(0[1-9]|[1-2]\\d|3[0-1])\\d{3}(\\d|X|x)$";

        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(code);

        return matcher.matches();
    }

    public static boolean queryCodes(String code, PersonServiceImpl personService) {
        Person person = personService.selectPersonByCode(code);
        if (person != null) {
            return false;
        }
        return true;
    }
}
