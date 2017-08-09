package com.feras.Dao;

import com.feras.Models.MenteesEntity;
import com.feras.Models.MentorsEntity;
import com.feras.Models.UsersEntity;

import java.util.ArrayList;

/*
Aaron Board
 */
public interface GCBuddyDao {
    public static final int HIBERNATE_DAO = 1;
    public static final int NOSQL_DAO = 2;

    public ArrayList<UsersEntity> getAllUsers();
    public ArrayList<UsersEntity> getAllMentees();
    public ArrayList<UsersEntity> getAllMentors();
    public UsersEntity getUser(int userId);
    public UsersEntity getUser(String userName);
    public UsersEntity getUser(String email, String pass);
    public UsersEntity getMentor(int userId);
    public UsersEntity getMentee(int userId);
    public void updateUser(UsersEntity user);
    public void updateMentor(MentorsEntity mentor);
    public void updateMentee(MenteesEntity mentee);
    public void deleteUser(int userId);
    public void deleteMentor(int userId);
    public void deleteMentee(int userId);
    public void addUser(UsersEntity user);
    public void addMentor(MentorsEntity mentor);
    public void addMentee(MenteesEntity mentee);

    UsersEntity getUserByAuth(String authToken);
}
