package com.feras.Dao;

import com.feras.Models.MenteesEntity;
import com.feras.Models.MentorsEntity;
import com.feras.Models.UsersEntity;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.util.ArrayList;

/*
Aaron Board
 */
public class HibernateDao implements GCBuddyDao {

    private static SessionFactory factory;

    public HibernateDao(SessionFactory factory) {
        this.factory = factory;
    }

    public ArrayList<UsersEntity> getAllUsers() {
        return null;
    }

    public ArrayList<UsersEntity> getAllMentees() {
        return null;
    }

    public ArrayList<UsersEntity> getAllMentors() {
        return null;
    }

    public UsersEntity getUser(int userId) {
        return null;
    }

    public UsersEntity getUser(String userName) {
        UsersEntity user;
        Session sessions = factory.openSession();
        user = (UsersEntity) sessions.createQuery("from UsersEntity where username = '" + userName+"'").setMaxResults(1).uniqueResult();
        sessions.close();

        return user;
    }

    public UsersEntity getMentor(int userId) {
        return null;
    }

    public UsersEntity getMentee(int userId) {
        return null;
    }

    public void updateUser(UsersEntity user) {

    }

    public void updateMentor(MentorsEntity mentor) {

    }

    public void updateMentee(MenteesEntity mentee) {

    }

    public void deleteUser(int userId) {

    }

    public void deleteMentor(int userId) {

    }

    public void deleteMentee(int userId) {

    }

    public void addUser(UsersEntity user) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(user);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void addMentor(MentorsEntity mentor) {

    }

    public void addMentee(MenteesEntity mentee) {

    }
}
