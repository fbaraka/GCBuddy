package com.feras.Dao;

import com.feras.Models.MenteesEntity;
import com.feras.Models.MentorsEntity;
import com.feras.Models.UsersEntity;
import org.hibernate.SessionFactory;

import java.util.ArrayList;

/*
Aaron Board
 */
public class HibernateDao implements GCBuddyDao{

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

    }

    public void addMentor(MentorsEntity mentor) {

    }

    public void addMentee(MenteesEntity mentee) {

    }
}