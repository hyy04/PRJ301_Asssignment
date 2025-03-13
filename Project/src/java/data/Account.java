/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data;

/**
 *
 * @author Admin
 */
public class Account {
   
    private String username;
    private String password;
    private int staff;
    private int manage;
    private int director;
    
    public Account(){
    }

    public Account(String username, String password, int staff, int manage, int director) {
        this.username = username;
        this.password = password;
        this.staff = staff;
        this.manage = manage;
        this.director = director;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getStaff() {
        return staff;
    }

    public void setStaff(int staff) {
        this.staff = staff;
    }

    public int getManage() {
        return manage;
    }

    public void setManage(int manage) {
        this.manage = manage;
    }

    public int getDirector() {
        return director;
    }

    public void setDirector(int director) {
        this.director = director;
    }

    
}


