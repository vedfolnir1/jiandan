package cn.ved.ssmblog.utils;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

/**
 * Md5加密密码
 */

public class CryptographyUtil {
    public static String doMd5(String password,String salt){
        ByteSource byteSource = ByteSource.Util.bytes(salt);
        return new Md5Hash(password, salt, 3).toString();
    }
 }
