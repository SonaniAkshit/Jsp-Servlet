package com.demo;

/**
 * User class for JSP demo
 * @author Admin
 */
public class User {
    private String name;

    public User() {
        this.name = "Unknown";
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}