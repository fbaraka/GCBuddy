package com.feras.Dao;

import com.feras.Models.MenteesEntity;
import com.feras.Models.MentorsEntity;
import com.feras.Models.UsersEntity;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.lang.reflect.Array;
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
        ArrayList<UsersEntity> users = new ArrayList<UsersEntity>();
        Session session = factory.openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            users = (ArrayList<UsersEntity>) session.createQuery("FROM UsersEntity").list();
            transaction.commit();
        }catch (HibernateException e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return users;
    }

    public ArrayList<UsersEntity> getAllMentees() {
        ArrayList<UsersEntity> mentees = new ArrayList<UsersEntity>();
        ArrayList<MenteesEntity> tempList;
        Session session = factory.openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            tempList = (ArrayList<MenteesEntity>) session.createQuery("FROM MenteesEntity ").list();
            for (MenteesEntity mentee: tempList) {
                mentees.add(getUser(mentee.getMenteeId()));
            }
            transaction.commit();
        }catch (HibernateException e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return mentees;
    }

    public ArrayList<UsersEntity> getAllMentors() {
        ArrayList<UsersEntity> mentors = new ArrayList<UsersEntity>();
        ArrayList<MentorsEntity> tempList;
        Session session = factory.openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            tempList = (ArrayList<MentorsEntity>) session.createQuery("FROM MentorsEntity ").list();
            for (MentorsEntity mentor: tempList) {
                mentors.add(getUser(mentor.getMentorId()));
            }
            transaction.commit();
        }catch (HibernateException e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return mentors;
    }

    public UsersEntity getUser(int userId) {
        UsersEntity user;
        Session sessions = factory.openSession();
        user = (UsersEntity) sessions.createQuery("from UsersEntity where userId = " + userId+"").setMaxResults(1).uniqueResult();
        sessions.close();
        return user;
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
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(mentor);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    public void addMentee(MenteesEntity mentee) {
        Session session = factory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(mentee);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }

    }
}
