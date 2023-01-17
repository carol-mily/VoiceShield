package com.demo.entity;
public class ClientNoise {
    private String client_usernoise_noiseID;
    private String client_usernoise_noisePath;
    private String client_usernoise_ID;
    public ClientNoise(String client_usernoise_ID,String client_usernoise_noiseID, String client_usernoise_noisePath){
        this.client_usernoise_noiseID=client_usernoise_noiseID;
        this.client_usernoise_noisePath=client_usernoise_noisePath;
        this.client_usernoise_ID=client_usernoise_ID;
    }

    public String getClient_usernoise_ID() {
        return client_usernoise_ID;
    }

    public String getClient_usernoise_noiseID() {
        return client_usernoise_noiseID;
    }

    public String getClient_usernoise_noisePath() {
        return client_usernoise_noisePath;
    }

    public void setClient_usernoise_noiseID(String client_usernoise_noiseID) {
        this.client_usernoise_noiseID = client_usernoise_noiseID;
    }

    public void setClient_usernoise_ID(String client_usernoise_ID) {
        this.client_usernoise_ID = client_usernoise_ID;
    }

    public void setClient_usernoise_noisePath(String client_usernoise_noisePath) {
        this.client_usernoise_noisePath = client_usernoise_noisePath;
    }
}