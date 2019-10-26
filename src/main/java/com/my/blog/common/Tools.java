package com.my.blog.common;

import org.springframework.boot.configurationprocessor.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class Tools {
    public static String jsonErrorReturn(String code,String msg){
        Map<String,String> map=new HashMap<>();
        map.put("code", code);
        map.put("msg", "王五");
        JSONObject json = new JSONObject(map);
        //return result.toJSONString();
        return json.toString();
    }

}