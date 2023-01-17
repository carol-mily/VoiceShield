package com.demo.service;

import com.demo.entity.Client;
import com.demo.entity.ClientNoise;
import com.demo.entity.Noise;
import com.demo.entity.User;
import org.springframework.beans.BeanUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
//表格返回json的构建类
public class LayuiTable<T>{
    private Map resultJson = new HashMap();
    public Map setJsonTable(List<T> data,int page,int limit){

        int size = data.size();
        MapBeanUtil setJson =new MapBeanUtil();
        List<Map> changedata = new ArrayList<Map>();
        for(int i=0;i<size;i++){
            T t =data.get(i);
            Map<String,Object> map= setJson.object2Map(t);
            //System.out.println(map);
            changedata.add(map);
        }
        PageUtil pageUtil = new PageUtil();
        changedata = pageUtil.startPage(changedata,page,limit);
        //resultJson=null;
        resultJson.put("data",changedata);//数据
        resultJson.put("code", 0);//
        resultJson.put("count",size);//数目
        resultJson.put("msg",null);
        return resultJson;
    }

}