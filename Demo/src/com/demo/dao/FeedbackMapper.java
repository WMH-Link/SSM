package com.demo.dao;

import com.demo.entity.Feedback;

public interface FeedbackMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table feedback
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(String feedbackid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table feedback
     *
     * @mbggenerated
     */
    int insert(Feedback record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table feedback
     *
     * @mbggenerated
     */
    int insertSelective(Feedback record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table feedback
     *
     * @mbggenerated
     */
    Feedback selectByPrimaryKey(String feedbackid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table feedback
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(Feedback record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table feedback
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(Feedback record);
}