package com.feras.Models;

/*
Aaron Board
 */
public class MenteeMentor {
    String firstName;
    String lasstName;
    String disciplines;

    public MenteeMentor(String firstName, String lasstName, String disciplines) {
        this.firstName = firstName;
        this.lasstName = lasstName;
        this.disciplines = disciplines;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lasstName;
    }

    public void setLasstName(String lasstName) {
        this.lasstName = lasstName;
    }

    public String getDisciplines() {
        return disciplines;
    }

    public void setDisciplines(String disciplines) {
        this.disciplines = disciplines;
    }
}
