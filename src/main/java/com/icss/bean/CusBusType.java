package com.icss.bean;

public class CusBusType {
    private Integer btid;

    private String btname;

    public Integer getBtid() {
        return btid;
    }

    public void setBtid(Integer btid) {
        this.btid = btid;
    }

    public String getBtname() {
        return btname;
    }

    public void setBtname(String btname) {
        this.btname = btname == null ? null : btname.trim();
    }
}