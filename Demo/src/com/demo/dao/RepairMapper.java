package com.demo.dao;

import java.util.List;
import java.util.Map;

import com.demo.entity.Repair;

/**
 * 报修管理Mapper接口
 * @author 廖明兴
 *
 */
public interface RepairMapper {
	
	/**
	 * 查询报修管理集合
	 * @param map
	 * @return
	 */
	public List<Repair> find(Map<String,Object> map);
	
	/**
	 * 获取总记录数
	 * @param map
	 * @return
	 */
	public Long getTotal(Map<String,Object> map);
	
	/**
	 * 添加报修管理
	 * @param saleChance
	 * @return
	 */
	public int add(Repair repair);
	
	/**
	 * 根据id查找实体
	 * @param id
	 * @return
	 */
	public Repair findById(Integer id);
	
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table repair
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(String repairid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table repair
     *
     * @mbggenerated
     */
    int insert(Repair record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table repair
     *
     * @mbggenerated
     */
    int insertSelective(Repair record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table repair
     *
     * @mbggenerated
     */
    Repair selectByPrimaryKey(String repairid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table repair
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(Repair record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table repair
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(Repair record);
}