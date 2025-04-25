package com.demo;

public class User {
    private String username;

    public User() {
        this.username = "Guest";
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }
}