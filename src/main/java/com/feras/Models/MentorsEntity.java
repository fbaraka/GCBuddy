package com.feras.Models;

import javax.persistence.*;

/**
 * Created by user on 8/7/2017.
 */
@Entity
@Table(name = "Mentors", schema = "GCBuddyData", catalog = "")
public class MentorsEntity {
    private int mentorId;
    private String mentorscol;
    private String disciplines;

    @Id
    @Column(name = "mentorId", nullable = false)
    public int getMentorId() {
        return mentorId;
    }

    public void setMentorId(int mentorId) {
        this.mentorId = mentorId;
    }

    @Basic
    @Column(name = "Mentorscol", nullable = true, length = 255)
    public String getMentorscol() {
        return mentorscol;
    }

    public void setMentorscol(String mentorscol) {
        this.mentorscol = mentorscol;
    }

    @Basic
    @Column(name = "disciplines", nullable = true, length = 140)
    public String getDisciplines() {
        return disciplines;
    }

    public void setDisciplines(String disciplines) {
        this.disciplines = disciplines;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        MentorsEntity that = (MentorsEntity) o;

        if (mentorId != that.mentorId) return false;
        if (mentorscol != null ? !mentorscol.equals(that.mentorscol) : that.mentorscol != null) return false;
        if (disciplines != null ? !disciplines.equals(that.disciplines) : that.disciplines != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = mentorId;
        result = 31 * result + (mentorscol != null ? mentorscol.hashCode() : 0);
        result = 31 * result + (disciplines != null ? disciplines.hashCode() : 0);
        return result;
    }
}
