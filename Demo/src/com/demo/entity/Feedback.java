package com.demo.entity;

public class Feedback {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column feedback.feedbackId
     *
     * @mbggenerated
     */
    private String feedbackid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column feedback.noticePeople
     *
     * @mbggenerated
     */
    private String noticepeople;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column feedback.noticeContent
     *
     * @mbggenerated
     */
    private String noticecontent;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column feedback.noticeTime
     *
     * @mbggenerated
     */
    private String noticetime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column feedback.remarks
     *
     * @mbggenerated
     */
    private String remarks;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column feedback.feedbackId
     *
     * @return the value of feedback.feedbackId
     *
     * @mbggenerated
     */
    public String getFeedbackid() {
        return feedbackid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column feedback.feedbackId
     *
     * @param feedbackid the value for feedback.feedbackId
     *
     * @mbggenerated
     */
    public void setFeedbackid(String feedbackid) {
        this.feedbackid = feedbackid == null ? null : feedbackid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column feedback.noticePeople
     *
     * @return the value of feedback.noticePeople
     *
     * @mbggenerated
     */
    public String getNoticepeople() {
        return noticepeople;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column feedback.noticePeople
     *
     * @param noticepeople the value for feedback.noticePeople
     *
     * @mbggenerated
     */
    public void setNoticepeople(String noticepeople) {
        this.noticepeople = noticepeople == null ? null : noticepeople.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column feedback.noticeContent
     *
     * @return the value of feedback.noticeContent
     *
     * @mbggenerated
     */
    public String getNoticecontent() {
        return noticecontent;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column feedback.noticeContent
     *
     * @param noticecontent the value for feedback.noticeContent
     *
     * @mbggenerated
     */
    public void setNoticecontent(String noticecontent) {
        this.noticecontent = noticecontent == null ? null : noticecontent.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column feedback.noticeTime
     *
     * @return the value of feedback.noticeTime
     *
     * @mbggenerated
     */
    public String getNoticetime() {
        return noticetime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column feedback.noticeTime
     *
     * @param noticetime the value for feedback.noticeTime
     *
     * @mbggenerated
     */
    public void setNoticetime(String noticetime) {
        this.noticetime = noticetime == null ? null : noticetime.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column feedback.remarks
     *
     * @return the value of feedback.remarks
     *
     * @mbggenerated
     */
    public String getRemarks() {
        return remarks;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column feedback.remarks
     *
     * @param remarks the value for feedback.remarks
     *
     * @mbggenerated
     */
    public void setRemarks(String remarks) {
        this.remarks = remarks == null ? null : remarks.trim();
    }
}