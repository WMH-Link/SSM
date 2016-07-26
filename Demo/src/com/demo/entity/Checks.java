package com.demo.entity;

/**
 * 考勤记录实体
 * 
 * @YJC
 */
public class Checks {
    /**
     * ID
     */
    private String checksid;

    /**
     * 楼号
     */
    private String checksfloor;

    /**
     * 寝室号
     */
    private String checksdormitoryno;

    /**
     * 考勤情况
     */
    private String checkscontent;

    /**
     * 考勤时间
     */
    private String checkstime;

    /**
     * 描述
     */
    private String remarks;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column checks.checksId
     *
     * @return the value of checks.checksId
     */
    public String getChecksid() {
        return checksid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column checks.checksId
     *
     * @param checksid the value for checks.checksId
     */
    public void setChecksid(String checksid) {
        this.checksid = checksid == null ? null : checksid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column checks.checksFloor
     *
     * @return the value of checks.checksFloor
     */
    public String getChecksfloor() {
        return checksfloor;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column checks.checksFloor
     *
     * @param checksfloor the value for checks.checksFloor
     */
    public void setChecksfloor(String checksfloor) {
        this.checksfloor = checksfloor == null ? null : checksfloor.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column checks.checksDormitoryNo
     *
     * @return the value of checks.checksDormitoryNo
     */
    public String getChecksdormitoryno() {
        return checksdormitoryno;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column checks.checksDormitoryNo
     *
     * @param checksdormitoryno the value for checks.checksDormitoryNo
     */
    public void setChecksdormitoryno(String checksdormitoryno) {
        this.checksdormitoryno = checksdormitoryno == null ? null : checksdormitoryno.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column checks.checksContent
     *
     * @return the value of checks.checksContent
     */
    public String getCheckscontent() {
        return checkscontent;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column checks.checksContent
     *
     * @param checkscontent the value for checks.checksContent
     */
    public void setCheckscontent(String checkscontent) {
        this.checkscontent = checkscontent == null ? null : checkscontent.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column checks.checksTime
     *
     * @return the value of checks.checksTime
     */
    public String getCheckstime() {
        return checkstime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column checks.checksTime
     *
     * @param checkstime the value for checks.checksTime
     */
    public void setCheckstime(String checkstime) {
        this.checkstime = checkstime == null ? null : checkstime.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column checks.remarks
     *
     * @return the value of checks.remarks
     */
    public String getRemarks() {
        return remarks;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column checks.remarks
     *
     * @param remarks the value for checks.remarks
     */
    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }
}