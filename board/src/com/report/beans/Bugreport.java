package com.report.beans;

import java.sql.Timestamp;

public class Bugreport {
	private int number;
	private String StrTitle;
	private String InputStr;
/*	private String ErrorIdx;*/
	private String ErrorWord;
	private String ReplaceWord;
	private String Comment;
	private int count;
	private Timestamp ReportTime;
	private int important;
	
	public int getNum() {
		return number;
	}
	public void setNum(int num) {
		this.number = num;
	}
	public String getStrTitle() {
		return StrTitle;
	}
	public void setStrTitle(String strtitle) {
		this.StrTitle = strtitle;
	}
	public String getInputStr() {
		return InputStr;
	}
	public void setInputStr(String inputstr) {
		this.InputStr = inputstr;
	}
	public String getErrorWord() {
		return ErrorWord;
	}
	public void setErrorWord(String errorword) {
		this.ErrorWord = errorword;
	}
	public String getReplaceWord() {
		return ReplaceWord;
	}
	public void setReplaceWord(String replaceword) {
		this.ReplaceWord = replaceword;
	}
	public String getComment() {
		return Comment;
	}
	public void setComment(String comment) {
		this.Comment = comment;
	}
	
	public int getCount() {
		return count;
	}
	public void setCount(int cnt) {
		this.count = cnt;
	}
	
	public Timestamp getReportTime() {
		return ReportTime;
	}
	
	public void setReportTime(Timestamp reporttime) {
		this.ReportTime = reporttime;
	}
	
	public int getImportant() {
		return important;
	}
	
	public void setImportant(int important) {
		this.important = important;
	}
	
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("Number =");
        builder.append(number);
        builder.append(", strTitle =");
        builder.append(StrTitle);
        builder.append(", InputStr =");
        builder.append(InputStr);
/*        builder.append(",ErrorIdx =");
        builder.append(ErrorIdx);*/
        builder.append(", replaceWord =");
        builder.append(ReplaceWord);
        builder.append(", Comment =");
        builder.append(Comment);
        builder.append(", ReportTime =");
        builder.append(ReportTime);
        return builder.toString();
    }
}
