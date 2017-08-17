package com.feras.Models;

import javax.persistence.*;
import java.math.BigDecimal;

/**
 * Created by user on 8/7/2017.
 */
@Entity
@Table(name = "Mentees", schema = "GCBuddyData", catalog = "")
public class MenteesEntity {
    private int menteeId;
    private String mentorscol;
    private String disciplines;
    private Double openess;
    private Double aggreeableness;
    private Double extraversion;
    private Double emotion;
    private Double conscience;
    private String firstName;
    private String lastName;
    private String slackId;
    private String photoUrl;
    private String city;

    @Id
    @Column(name = "menteeId", nullable = false)
    public int getMenteeId() {
        return menteeId;
    }

    public void setMenteeId(int menteeId) {
        this.menteeId = menteeId;
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

    @Basic
    @Column(name = "openess", nullable = true, precision = 2)
    public Double getOpeness() {
        return openess;
    }

    public void setOpeness(Double openess) {
        this.openess = openess;
    }

    @Basic
    @Column(name = "aggreeableness", nullable = true, precision = 2)
    public Double getAggreeableness() {
        return aggreeableness;
    }

    public void setAggreeableness(Double aggreeableness) {
        this.aggreeableness = aggreeableness;
    }

    @Basic
    @Column(name = "extraversion", nullable = true, precision = 2)
    public Double getExtraversion() {
        return extraversion;
    }

    public void setExtraversion(Double extraversion) {
        this.extraversion = extraversion;
    }

    @Basic
    @Column(name = "emotion", nullable = true, precision = 2)
    public Double getEmotion() {
        return emotion;
    }

    public void setEmotion(Double emotion) {
        this.emotion = emotion;
    }

    @Basic
    @Column(name = "conscience", nullable = true, precision = 2)
    public Double getConscience() {
        return conscience;
    }

    public void setConscience(Double conscience) {
        this.conscience = conscience;
    }

    @Basic
    @Column(name = "firstName", nullable = true, length = 45)
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    @Basic
    @Column(name = "lastName", nullable = true, length = 45)
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Basic
    @Column(name = "slackId", nullable = true, length = 45)
    public String getSlackId() {
        return slackId;
    }

    public void setSlackId(String slackId) {
        this.slackId = slackId;
    }

    @Basic
    @Column(name = "photoUrl", nullable = true, length = 255)
    public String getPhotoUrl() {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl) {
        this.photoUrl = photoUrl;
    }

    @Basic
    @Column(name = "city", nullable = true, length = 45)
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
}
