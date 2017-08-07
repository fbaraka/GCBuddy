package com.feras.Dao;

import com.feras.Models.MenteesEntity;
import com.feras.Models.MentorsEntity;
import com.feras.Models.UsersEntity;

import java.util.ArrayList;

/**
 * Created by user on 8/7/2017.
 */
public class NoSQLDao implements GCBuddyDao{
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
