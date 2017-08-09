package com.feras.DaoFactory;

import com.feras.Dao.GCBuddyDao;
import com.feras.Dao.HibernateDao;
import org.hibernate.cfg.Configuration;

/*
Aaron Board
 */
public class DaoFactory {
    public static GCBuddyDao getInstance(int choice){
        switch (choice){
            case GCBuddyDao.HIBERNATE_DAO:
                return new HibernateDao(new Configuration().configure("hibernate.cfg.xml").buildSessionFactory());
            default:
                return null;
        }
    }
}
