package com.luo.xm.uitl;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

public class BASE64Util {
    private static BASE64Encoder base64Encoder = null;
    private static BASE64Decoder base64Decoder = null;

    public static String Encoder(String str){
        if (base64Encoder == null){
            base64Encoder = new BASE64Encoder();
        }
        String encode = base64Encoder.encode(str.getBytes(StandardCharsets.UTF_8));
        return encode;
    }

    public static String Decode(String str) throws IOException {
        if (base64Decoder == null){
            base64Decoder = new BASE64Decoder();
        }
        byte[] bytes = base64Decoder.decodeBuffer(str);
        return new String(bytes);
    }
}
