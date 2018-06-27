package com.report.dao;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.report.db.sqlconfig.IBatisDBConnector;


public class CommonDAO {
    private SqlMapClient myDB;
    
    public void SetDB() {
    	myDB = IBatisDBConnector.getSqlMapInstance();
    }
    
    protected SqlMapClient GetDB() {
    	return myDB;
    }
}
