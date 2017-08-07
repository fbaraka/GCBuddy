package com.feras.DaoFactory;

import com.feras.Dao.GCBuddyDao;
import com.feras.Dao.HibernateDao;
import com.feras.Dao.NoSQLDao;

/*
Aaron Board
 */
public class DaoFactory {
    public static GCBuddyDao getInstance(int choice){
        switch (choice){
            case GCBuddyDao.HIBERNATE_DAO:
                return new HibernateDao();
            case GCBuddyDao.NOSQL_DAO:
                return new NoSQLDao();
            default:
                return null;
        }
    }
}
