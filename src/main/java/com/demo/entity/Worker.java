package com.demo.entity;
public class Worker {
    private String id;
    private String type;
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }
    @Override
    public String toString() {
        return "Worker [id=" + id + ", type=" + type + "]";
    }
    public Worker() {
        super();
        // TODO Auto-generated constructor stub
    }
    public Worker(String id, String type) {
        super();
        this.id = id;
        this.type = type;
    }

}
