package com.feras.Watson;

import com.feras.Models.MenteesEntity;
import com.feras.Models.MentorsEntity;
import com.feras.Models.UsersEntity;

import java.util.ArrayList;

/**
 * Created by michaelgleeson on 8/10/17.
 */
public class MatchMaker {
    private static ArrayList<MenteesEntity> narrowMenteeByDiscipline(MentorsEntity loggedInUser, ArrayList<MenteesEntity> mentees){
        String[] disc = loggedInUser.getDisciplines().split(",");
        ArrayList<MenteesEntity> narrowedMentees = new ArrayList<MenteesEntity>();
        for (MenteesEntity mentee: mentees) {
            boolean isMatch = false;
            for (String discipline: disc){
                if (mentee.getDisciplines().contains(discipline)){
                    isMatch = true;
                }
            }
            if (isMatch){
                narrowedMentees.add(mentee);
            }
        }
        return narrowedMentees;
    }

    private static ArrayList<MentorsEntity> narrowMentorByDiscipline(MenteesEntity loggedInUser, ArrayList<MentorsEntity> mentors){

        String[] disc = loggedInUser.getDisciplines().split(",");
        ArrayList<MentorsEntity> narrowedMentors = new ArrayList<MentorsEntity>();
        for (MentorsEntity mentor: mentors) {
            boolean isMatch = false;
            for (String discipline: disc){
                if (mentor.getDisciplines().contains(discipline)){
                    isMatch = true;
                }
            }
            if (isMatch){
                narrowedMentors.add(mentor);
            }
        }
        return narrowedMentors;
    }

    public static ArrayList<MentorsEntity> narrowMentorbyWatson(MenteesEntity loggedInUser, ArrayList<MentorsEntity> mentors) {
        ArrayList<MentorsEntity> narrowedMentors = narrowMentorByDiscipline(loggedInUser, mentors);
        for (MentorsEntity mentorsEntity : narrowedMentors) {
            int matchCounter = 0;
            if (loggedInUser.getOpeness() < mentorsEntity.getOpeness()*1.1 && loggedInUser.getOpeness() >
                    mentorsEntity.getOpeness()*0.9 ) {
                matchCounter ++;
            }
            if (loggedInUser.getAggreeableness() < mentorsEntity.getAggreeableness()*1.1 && loggedInUser.getAggreeableness() >
                    mentorsEntity.getAggreeableness()*0.9 ) {
                matchCounter ++;
            }
            if (loggedInUser.getConscience() < mentorsEntity.getConscience()*1.1 && loggedInUser.getConscience() >
                    mentorsEntity.getConscience()*0.9 ) {
                matchCounter ++;
            }
            if (loggedInUser.getEmotion() < mentorsEntity.getEmotion()*1.1 && loggedInUser.getEmotion() >
                    mentorsEntity.getEmotion()*0.9 ) {
                matchCounter ++;
            }
            if (loggedInUser.getExtraversion() < mentorsEntity.getExtraversion()*1.1 && loggedInUser.getExtraversion() >
                    mentorsEntity.getExtraversion()*0.9 ) {
                matchCounter ++;
            }

            if(matchCounter >= 3) {
                narrowedMentors.remove(mentorsEntity);
                narrowedMentors.add(0,mentorsEntity);
            }

        }
        return narrowedMentors;
    }

    public static ArrayList<MenteesEntity> narrowMenteebyWatson(MentorsEntity loggedInUser, ArrayList<MenteesEntity> mentees) {
        ArrayList<MenteesEntity> narrowedMentees = narrowMenteeByDiscipline(loggedInUser, mentees);
        for (MenteesEntity menteesEntity : narrowedMentees) {
            int matchCounter = 0;
            if (loggedInUser.getOpeness() < menteesEntity.getOpeness()*1.1 && loggedInUser.getOpeness() >
                    menteesEntity.getOpeness()*0.9 ) {
                matchCounter ++;
            }
            if (loggedInUser.getAggreeableness() < menteesEntity.getAggreeableness()*1.1 && loggedInUser.getAggreeableness() >
                    menteesEntity.getAggreeableness()*0.9 ) {
                matchCounter ++;
            }
            if (loggedInUser.getConscience() < menteesEntity.getConscience()*1.1 && loggedInUser.getConscience() >
                    menteesEntity.getConscience()*0.9 ) {
                matchCounter ++;
            }
            if (loggedInUser.getEmotion() < menteesEntity.getEmotion()*1.1 && loggedInUser.getEmotion() >
                    menteesEntity.getEmotion()*0.9 ) {
                matchCounter ++;
            }
            if (loggedInUser.getExtraversion() < menteesEntity.getExtraversion()*1.1 && loggedInUser.getExtraversion() >
                    menteesEntity.getExtraversion()*0.9 ) {
                matchCounter ++;
            }

            if(matchCounter >= 3) {
                narrowedMentees.remove(menteesEntity);
                narrowedMentees.add(0,menteesEntity);
            }

        }
        return narrowedMentees;
    }
}
