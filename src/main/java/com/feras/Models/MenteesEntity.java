package com.feras.Models;

import javax.persistence.*;

/**
 * Created by user on 8/7/2017.
 */
@Entity
@Table(name = "Mentees", schema = "GCBuddyData", catalog = "")
public class MenteesEntity {
    private int menteeId;
    private String mentorscol;
    private String disciplines;

    @Id
    @Column(name = "menteeId", nullable = false)
    public int getMenteeId() {
        return menteeId;
    }

    public void setMenteeId(int menteeId) {
        this.menteeId = menteeId;
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

        MenteesEntity that = (MenteesEntity) o;

        if (menteeId != that.menteeId) return false;
        if (mentorscol != null ? !mentorscol.equals(that.mentorscol) : that.mentorscol != null) return false;
        if (disciplines != null ? !disciplines.equals(that.disciplines) : that.disciplines != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = menteeId;
        result = 31 * result + (mentorscol != null ? mentorscol.hashCode() : 0);
        result = 31 * result + (disciplines != null ? disciplines.hashCode() : 0);
        return result;
    }
}
