package com.demo.service;

import com.demo.dao.NoiseDao;
import com.demo.entity.Noise;
import com.demo.entity.User;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import static java.lang.Integer.parseInt;

//噪声操作类
public class NoiseMgr{
    private NoiseDao temp=new NoiseDao();
    public List<Noise> GetList() throws Exception {
        List<Noise> result = temp.list();
        return result;
    }
    public List<Noise> findNoise(String key) throws Exception {
        List<Noise> result = new ArrayList<>();
        int intkey = parseInt(key);
        Noise noiseCheck = temp.get(intkey);
        if(noiseCheck == null) {
            noiseCheck = new Noise(-1,"无");
        }
        result.add(noiseCheck);
        return result;
    }
    public int AddNoise(String path) throws Exception {
        int result = -1;
        Noise noise = new Noise(-1,path);
        result = temp.add(noise);
        return result;
    }
    public int deleteNoise(int gather_noiselibrary_noiseID) throws Exception {
        int result = -1;
        Noise noise = temp.get(gather_noiselibrary_noiseID);
        String path = "C:/"+noise.getGather_noiselibrary_noisePath();
        File file = new File(path);
        boolean isOk = file.exists();
        if(isOk){
            file.delete();
            result = temp.delete(gather_noiselibrary_noiseID);
        }
        return result;
    }
    public Noise getNoise(String client_usernoise_noiseID) throws Exception {
        Noise noise = temp.get(parseInt(client_usernoise_noiseID));
        return noise;
    }

}