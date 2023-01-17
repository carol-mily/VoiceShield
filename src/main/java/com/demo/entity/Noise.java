package com.demo.entity;
public class Noise {
    private String gather_noiselibrary_noisePath;
    private int gather_noiselibrary_noiseID;
    public Noise(int gather_noiselibrary_noiseID,String gather_noiselibrary_noisePath){
        this.gather_noiselibrary_noisePath=gather_noiselibrary_noisePath;
        this.gather_noiselibrary_noiseID=gather_noiselibrary_noiseID;
    }

    public String getGather_noiselibrary_noisePath() {
        return gather_noiselibrary_noisePath;
    }

    public int getGather_noiselibrary_noiseID() {
        return gather_noiselibrary_noiseID;
    }

    public void setGather_noiselibrary_noisePath(String gather_noiselibrary_noisePath) {
        this.gather_noiselibrary_noisePath = gather_noiselibrary_noisePath;
    }

    public void setGather_noiselibrary_noiseID(int gather_noiselibrary_noiseID) {
        this.gather_noiselibrary_noiseID = gather_noiselibrary_noiseID;
    }
}