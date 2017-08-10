package com.feras.Watson;

import com.feras.Models.MenteesEntity;
import com.feras.Models.MentorsEntity;
import com.feras.Models.UsersEntity;

import java.util.ArrayList;

/**
 * Created by michaelgleeson on 8/10/17.
 */
public class MatchMaker {
    private ArrayList<MenteesEntity> narrowMenteeByDiscipline(MentorsEntity loggedInUser, ArrayList<MenteesEntity> mentees){
        ArrayList<String> disciplines = new ArrayList<String>();
        for (MenteesEntity mentee: mentees) {
            boolean isMatch = false;
            for (String discipline: disciplines){
                if (mentee.getDisciplines().contains(discipline)){
                    isMatch = true;
                }
            }
            if (!isMatch){
                mentees.remove(mentee);
            }
        }
        return mentees;
    }

    private ArrayList<MentorsEntity> narrowMentorByDiscipline(MenteesEntity loggedInUser, ArrayList<MentorsEntity> mentors){
        ArrayList<String> disciplines = new ArrayList<String>();
        for (MentorsEntity mentee: mentors) {
            boolean isMatch = false;
            for (String discipline: disciplines){
                if (mentee.getDisciplines().contains(discipline)){
                    isMatch = true;
                }
            }
            if (!isMatch){
                mentors.remove(mentee);
            }
        }
        return mentors;
    }

    public ArrayList<MentorsEntity> narrowMentorbyWatson(MenteesEntity loggedInUser, ArrayList<MentorsEntity> mentors) {
        ArrayList<MentorsEntity> narrowedMentors = narrowMentorByDiscipline(loggedInUser, mentors);
        for (MentorsEntity mentorsEntity : narrowedMentors) {
            int matchCounter = 0;

        }
        return null;
    }
}
