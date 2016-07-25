package com.demo.entity;

public class Thing {
	
    /**
     * ID 主键
     * @mbggenerated
     */
    private String thingid;

    /**
     *	物品编号
     * @mbggenerated
     */
    private String thingno;

    /**
     * 物品名称
     * @mbggenerated
     */
    private String thingname;

    /**
     * 物品分类
     * @mbggenerated
     */
    private String thingtype;

    /**
     * 物品状态
     * @mbggenerated
     */
    private String thingstate;

    /**
     *	宿舍号
     * @mbggenerated
     */
    private String thingdormitory;

    /**
     *	物品描述
     * @mbggenerated
     */
    private String remark;

    /**
     * @return the value of thing.thingid
     * @mbggenerated
     */
    public String getthingid() {
        return thingid;
    }

    /**
     * @param thingid the value for thing.thingid
     * @mbggenerated
     */
    public void setthingid(String thingid) {
        this.thingid = thingid == null ? null : thingid.trim();
    }

    /**
     * @return the value of thing.thingno
     *
     * @mbggenerated
     */
    public String getthingno() {
        return thingno;
    }

    /**
     * 
     *
     * @param thingno the value for thing.thingno
     *
     * @mbggenerated
     */
    public void setthingno(String thingno) {
        this.thingno = thingno == null ? null : thingno.trim();
    }

    /**
     * 
     *
     * @return the value of thing.
     *
     * @mbggenerated
     */
    public String getthingname() {
        return thingname;
    }

    /**
     * 
     *
     * @param  the value for thing.
     *
     * @mbggenerated
     */
    public void setthingname(String thingname) {
        this.thingname = thingname == null ? null : thingname.trim();
    }

    /**
     * 
     *
     * @return the value of thing.thingtype
     *
     * @mbggenerated
     */
    public String getthingtype() {
        return thingtype;
    }

    /**
     * 
     *
     * @param thingtype the value for thing.thingtype
     *
     * @mbggenerated
     */
    public void setthingtype(String thingtype) {
        this.thingtype = thingtype == null ? null : thingtype.trim();
    }

    /**
     * 
     *
     * @return the value of thing.thingstate
     *
     * @mbggenerated
     */
    public String getthingstate() {
        return thingstate;
    }

    /**
     * 
     *
     * @param thingstate the value for thing.thingstate
     *
     * @mbggenerated
     */
    public void setthingstate(String thingstate) {
        this.thingstate = thingstate == null ? null : thingstate.trim();
    }

    /**
     * 
     *
     * @return the value of thing.thingdormitory
     *
     * @mbggenerated
     */
    public String getthingdormitory() {
        return thingdormitory;
    }

    /**
     * 
     *
     * @param thingdormitory the value for thing.thingdormitory
     *
     * @mbggenerated
     */
    public void setthingdormitory(String thingdormitory) {
        this.thingdormitory = thingdormitory == null ? null : thingdormitory.trim();
    }

    /**
     * 
     *
     * @return the value of thing.remark
     *
     * @mbggenerated
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 
     *
     * @param remark the value for thing.remark
     *
     * @mbggenerated
     */
    public void setRemark(String remark) {
        this.remark = remark== null ? null : remark.trim();
    }
}