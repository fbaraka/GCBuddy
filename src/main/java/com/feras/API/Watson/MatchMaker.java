package com.feras.API.Watson;

import com.feras.Models.MenteesEntity;
import com.feras.Models.MentorsEntity;

import java.util.ArrayList;

/**
 * Created by michaelgleeson on 8/10/17.
 */
//Where we're using all the Watson data to generate our Mentor/Mentee matches
public class MatchMaker {
    //Moves through the list of Mentees, compares each Discipline to the Mentor's, and narrows down to users who match
    private static ArrayList<MenteesEntity> narrowMenteeByDiscipline(MentorsEntity loggedInUser, ArrayList<MenteesEntity> mentees){
        ArrayList<MenteesEntity> narrowedMentees = new ArrayList<MenteesEntity>();
        try {
            String[] disc = loggedInUser.getDisciplines().split(",");
            for (MenteesEntity mentee : mentees) {
                boolean isMatch = false;
                for (String discipline : disc) {
                    if (mentee.getDisciplines().contains(discipline)) {
                        isMatch = true;
                    }
                }
                if (isMatch) {
                    narrowedMentees.add(mentee);
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return narrowedMentees;
    }

    //Moves through the list of Mentors, compares each Discipline to the Mentee's, and narrows down to users who match
    private static ArrayList<MentorsEntity> narrowMentorByDiscipline(MenteesEntity loggedInUser, ArrayList<MentorsEntity> mentors){
        ArrayList<MentorsEntity> narrowedMentors = new ArrayList<MentorsEntity>();
        try {
            String[] disc = loggedInUser.getDisciplines().split(",");
            for (MentorsEntity mentor : mentors) {
                boolean isMatch = false;
                for (String discipline : disc) {
                    if (mentor.getDisciplines().contains(discipline)) {
                        isMatch = true;
                    }
                }
                if (isMatch) {
                    narrowedMentors.add(mentor);
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return narrowedMentors;
    }

    //Now we cycle through the narrowedMentors list, comparing each Watson parameter
    //If the Mentee is within 10% of the User's percentiles, Match counter increments by 1
    //With 3 or more Match points, they're considered a match, and a new list is created and arranged by percentile
    public static ArrayList<MentorsEntity> narrowMentorbyWatson(MenteesEntity loggedInUser, ArrayList<MentorsEntity> mentors) {
        ArrayList<MentorsEntity> narrowedMentors = narrowMentorByDiscipline(loggedInUser, mentors);
        ArrayList<MentorsEntity> orderedMentors = new ArrayList<MentorsEntity>();
        try {
            for (MentorsEntity mentorsEntity : narrowedMentors) {
                int matchCounter = 0;
                if (loggedInUser.getOpeness() < mentorsEntity.getOpeness() * 1.1 && loggedInUser.getOpeness() >
                        mentorsEntity.getOpeness() * 0.9) {
                    matchCounter++;
                }
                if (loggedInUser.getAggreeableness() < mentorsEntity.getAggreeableness() * 1.1 && loggedInUser.getAggreeableness() >
                        mentorsEntity.getAggreeableness() * 0.9) {
                    matchCounter++;
                }
                if (loggedInUser.getConscience() < mentorsEntity.getConscience() * 1.1 && loggedInUser.getConscience() >
                        mentorsEntity.getConscience() * 0.9) {
                    matchCounter++;
                }
                if (loggedInUser.getEmotion() < mentorsEntity.getEmotion() * 1.1 && loggedInUser.getEmotion() >
                        mentorsEntity.getEmotion() * 0.9) {
                    matchCounter++;
                }
                if (loggedInUser.getExtraversion() < mentorsEntity.getExtraversion() * 1.1 && loggedInUser.getExtraversion() >
                        mentorsEntity.getExtraversion() * 0.9) {
                    matchCounter++;
                }

                if (matchCounter >= 3) {
                    orderedMentors.add(0, mentorsEntity);
                } else
                    orderedMentors.add(mentorsEntity);

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return orderedMentors;
    }

    //Now we cycle through the narrowedMentees list, comparing each Watson parameter
    //If the Mentor is within 10% of the User's percentiles, Match counter increments by 1
    //With 3 or more Match points, they're considered a match, and a new list is created and arranged by percentile
    public static ArrayList<MenteesEntity> narrowMenteebyWatson(MentorsEntity loggedInUser, ArrayList<MenteesEntity> mentees) {
        ArrayList<MenteesEntity> narrowedMentees = narrowMenteeByDiscipline(loggedInUser, mentees);
        ArrayList<MenteesEntity> orderedMentees = new ArrayList<MenteesEntity>();
        try {
            for (MenteesEntity menteesEntity : narrowedMentees) {
                int matchCounter = 0;
                if (loggedInUser.getOpeness() < menteesEntity.getOpeness() * 1.1 && loggedInUser.getOpeness() >
                        menteesEntity.getOpeness() * 0.9) {
                    matchCounter++;
                }
                if (loggedInUser.getAggreeableness() < menteesEntity.getAggreeableness() * 1.1 && loggedInUser.getAggreeableness() >
                        menteesEntity.getAggreeableness() * 0.9) {
                    matchCounter++;
                }
                if (loggedInUser.getConscience() < menteesEntity.getConscience() * 1.1 && loggedInUser.getConscience() >
                        menteesEntity.getConscience() * 0.9) {
                    matchCounter++;
                }
                if (loggedInUser.getEmotion() < menteesEntity.getEmotion() * 1.1 && loggedInUser.getEmotion() >
                        menteesEntity.getEmotion() * 0.9) {
                    matchCounter++;
                }
                if (loggedInUser.getExtraversion() < menteesEntity.getExtraversion() * 1.1 && loggedInUser.getExtraversion() >
                        menteesEntity.getExtraversion() * 0.9) {
                    matchCounter++;
                }

                if (matchCounter >= 3) {
                    orderedMentees.add(0, menteesEntity);
                } else orderedMentees.add(menteesEntity);

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return orderedMentees;
    }
}
