package com.feras.Models;

import javax.persistence.*;

/**
 * Created by user on 8/7/2017.
 */
@Entity
@Table(name = "Users", schema = "GCBuddyData", catalog = "")
public class UsersEntity {
    private int userId;
    private String firstName;
    private String lastName;
    private String username;
    private String userscol;
    private String bootcamp;
    private String userscol1;
    private String languages;
    private String experience;
    private String bioBlurb;
    private Boolean isAbleToMentor;

    public Boolean getIsAbleToMentor() {
        return isAbleToMentor;
    }

    public void setIsAbleToMentor(Boolean isAbleToMentor) {
        this.isAbleToMentor = isAbleToMentor;
    }

    private Boolean isAlumni;

    public Boolean getIsAlumni() {
        return isAlumni;
    }

    public void setIsAlumni(Boolean isAlumni) {
        this.isAlumni = isAlumni;
    }

    @Id
    @Column(name = "userId", nullable = false)
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "FirstName", nullable = true, length = 45)
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    @Basic
    @Column(name = "LastName", nullable = true, length = 45)
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Basic
    @Column(name = "Username", nullable = true, length = 45)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "Userscol", nullable = true, length = 45)
    public String getUserscol() {
        return userscol;
    }

    public void setUserscol(String userscol) {
        this.userscol = userscol;
    }

    @Basic
    @Column(name = "Bootcamp", nullable = true, length = 45)
    public String getBootcamp() {
        return bootcamp;
    }

    public void setBootcamp(String bootcamp) {
        this.bootcamp = bootcamp;
    }

    @Basic
    @Column(name = "Userscol1", nullable = true, length = 45)
    public String getUserscol1() {
        return userscol1;
    }

    public void setUserscol1(String userscol1) {
        this.userscol1 = userscol1;
    }

    @Basic
    @Column(name = "Languages", nullable = true, length = 140)
    public String getLanguages() {
        return languages;
    }

    public void setLanguages(String languages) {
        this.languages = languages;
    }

    @Basic
    @Column(name = "Experience", nullable = true, length = 140)
    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    @Basic
    @Column(name = "BioBlurb", nullable = true, length = 255)
    public String getBioBlurb() {
        return bioBlurb;
    }

    public void setBioBlurb(String bioBlurb) {
        this.bioBlurb = bioBlurb;
    }

    @Basic
    @Column(name = "isAbleToMentor", nullable = true)
    public Boolean getAbleToMentor() {
        return isAbleToMentor;
    }

    public void setAbleToMentor(Boolean ableToMentor) {
        isAbleToMentor = ableToMentor;
    }

    @Basic
    @Column(name = "isAlumni", nullable = true)
    public Boolean getAlumni() {
        return isAlumni;
    }

    public void setAlumni(Boolean alumni) {
        isAlumni = alumni;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UsersEntity that = (UsersEntity) o;

        if (userId != that.userId) return false;
        if (firstName != null ? !firstName.equals(that.firstName) : that.firstName != null) return false;
        if (lastName != null ? !lastName.equals(that.lastName) : that.lastName != null) return false;
        if (username != null ? !username.equals(that.username) : that.username != null) return false;
        if (userscol != null ? !userscol.equals(that.userscol) : that.userscol != null) return false;
        if (bootcamp != null ? !bootcamp.equals(that.bootcamp) : that.bootcamp != null) return false;
        if (userscol1 != null ? !userscol1.equals(that.userscol1) : that.userscol1 != null) return false;
        if (languages != null ? !languages.equals(that.languages) : that.languages != null) return false;
        if (experience != null ? !experience.equals(that.experience) : that.experience != null) return false;
        if (bioBlurb != null ? !bioBlurb.equals(that.bioBlurb) : that.bioBlurb != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userId;
        result = 31 * result + (firstName != null ? firstName.hashCode() : 0);
        result = 31 * result + (lastName != null ? lastName.hashCode() : 0);
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + (userscol != null ? userscol.hashCode() : 0);
        result = 31 * result + (bootcamp != null ? bootcamp.hashCode() : 0);
        result = 31 * result + (userscol1 != null ? userscol1.hashCode() : 0);
        result = 31 * result + (languages != null ? languages.hashCode() : 0);
        result = 31 * result + (experience != null ? experience.hashCode() : 0);
        result = 31 * result + (bioBlurb != null ? bioBlurb.hashCode() : 0);
        return result;
    }
}
