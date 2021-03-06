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
    private String bootcamp;
    private String languages;
    private String AuthToken;
    private String password;
    private String email;
    private Boolean isAlumni;
    private String authToken;
    private String slackId;
    private String photoUrl;
    private String city;

    @Basic
    @Column(name = "city", nullable = true, length = 140)
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Basic
    @Column(name = "email", nullable = true, length = 45)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "password", nullable = true, length = 45)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "AuthToken", nullable = true, length = 120)
    public String getAuthToken() {
        return AuthToken;
    }

    public void setAuthToken(String authToken) {
        AuthToken = authToken;
    }

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
    @Column(name = "Bootcamp", nullable = true, length = 45)
    public String getBootcamp() {
        return bootcamp;
    }

    public void setBootcamp(String bootcamp) {
        this.bootcamp = bootcamp;
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
        if (bootcamp != null ? !bootcamp.equals(that.bootcamp) : that.bootcamp != null) return false;
        if (languages != null ? !languages.equals(that.languages) : that.languages != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userId;
        result = 31 * result + (firstName != null ? firstName.hashCode() : 0);
        result = 31 * result + (lastName != null ? lastName.hashCode() : 0);
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + (bootcamp != null ? bootcamp.hashCode() : 0);
        result = 31 * result + (languages != null ? languages.hashCode() : 0);
        return result;
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
}
