package com.report.dao;

import java.sql.*;
import java.util.ArrayList;

import com.report.beans.Bugreport;

public class bugreportDAO extends CommonDAO{
	
	public static bugreportDAO getInstance() {
		bugreportDAO _instance = new bugreportDAO();
		_instance.SetDB();
		return _instance;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<Bugreport>getReportList(int page) throws SQLException{
		ArrayList<Bugreport> reportList = (ArrayList<Bugreport>)GetDB().queryForList("getReportList", null, page, 10);
		return reportList;	
	}

	@SuppressWarnings("unchecked")
	public ArrayList<Bugreport>unReadList(int page) throws SQLException{
		ArrayList<Bugreport> reportList = (ArrayList<Bugreport>)GetDB().queryForList("getUnreadList", null, page, 10);
		return reportList;	
	}	

	@SuppressWarnings("unchecked")
	public ArrayList<Bugreport>importantList(int page) throws SQLException{
		ArrayList<Bugreport> reportList = (ArrayList<Bugreport>)GetDB().queryForList("getImportantList", null, page, 10);
		return reportList;	
	}	
	
	@SuppressWarnings("unchecked")
	public ArrayList<Bugreport>getSearchList(int page, String keyword) throws SQLException{
		ArrayList<Bugreport> reportList = (ArrayList<Bugreport>)GetDB().queryForList("getSearchList", keyword, page, 10);
		return reportList;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<Bugreport>getReplaceList(int page, String keyword) throws SQLException{
		ArrayList<Bugreport> reportList = (ArrayList<Bugreport>)GetDB().queryForList("getReplaceList", keyword, page, 10);
		return reportList;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<Bugreport>getErrorList(int page, String keyword) throws SQLException{
		ArrayList<Bugreport> reportList = (ArrayList<Bugreport>)GetDB().queryForList("getErrorList", keyword, page, 10);
		return reportList;
	}
	
	public int getUnreadCnt() throws SQLException{
		int cnt;
		cnt = (int)GetDB().queryForObject("getUnreadCnt", null);
		return cnt;
	}
	
	public Bugreport GetReport(int num) throws SQLException{
			Bugreport report = (Bugreport)GetDB().queryForObject("getReport", num);
		return report;
	}
	
	public void deleteArticle(int idx) throws SQLException {
		GetDB().delete("deleteReport", idx);
	}
	
	public void setReportCount(Bugreport report) throws SQLException{
		//System.out.println(report.getCount() + report.getErrorWord() + report.getReplaceWord());
		GetDB().update("setReportCount", report);
	}
	
	public void setImportantCheck(Bugreport report) throws SQLException{
		//System.out.println(report.getCount() + report.getErrorWord() + report.getReplaceWord());
		GetDB().update("setImportantCheck", report);
	}
}
