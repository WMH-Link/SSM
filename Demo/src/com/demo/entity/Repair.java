package com.demo.entity;

import java.util.Date;

/**
 * 报修记录
 * 
 * @author 廖明兴
 *
 */
public class Repair {
	/**
	 * 报修编号
	 * 
	 * @mbggenerated
	 */
	private String repairid;

	/**
	 * 楼号
	 * 
	 * @mbggenerated
	 */
	private String repairfloor;

	/**
	 * 宿舍号
	 * 
	 * @mbggenerated
	 */
	private String repairdormitoryno;

	/**
	 * 物品编号
	 * 
	 * @mbggenerated
	 */
	private String thingid;
	
	/**
	 * 物品名称
	 * @mbggenerated
	 */
	private String thingname;
	
	/**
	 * 报修原因
	 * 
	 * @mbggenerated
	 */
	private String repaircontent;

	/**
	 * 报修时间
	 * 
	 * @mbggenerated
	 */
	private Date repairtime;

	/**
	 * 解决时间
	 * 
	 * @mbggenerated
	 */
	private Date repairdotime;

	/**
	 * 报修描述
	 * 
	 * @mbggenerated
	 */
	private String remarks;

	public String getRepairid() {
		return repairid;
	}

	public void setRepairid(String repairid) {
		this.repairid = repairid;
	}

	public String getRepairfloor() {
		return repairfloor;
	}

	public void setRepairfloor(String repairfloor) {
		this.repairfloor = repairfloor;
	}

	public String getRepairdormitoryno() {
		return repairdormitoryno;
	}

	public void setRepairdormitoryno(String repairdormitoryno) {
		this.repairdormitoryno = repairdormitoryno;
	}

	public String getThingid() {
		return thingid;
	}

	public void setThingid(String thingid) {
		this.thingid = thingid;
	}
	
	public String getThingname() {
		return thingname;
	}

	public void setThingname(String thingname) {
		this.thingname = thingname;
	}

	public String getRepaircontent() {
		return repaircontent;
	}

	public void setRepaircontent(String repaircontent) {
		this.repaircontent = repaircontent;
	}

	public Date getRepairtime() {
		return repairtime;
	}

	public void setRepairtime(Date repairtime) {
		this.repairtime = repairtime;
	}

	public Date getRepairdotime() {
		return repairdotime;
	}

	public void setRepairdotime(Date repairdotime) {
		this.repairdotime = repairdotime;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
}