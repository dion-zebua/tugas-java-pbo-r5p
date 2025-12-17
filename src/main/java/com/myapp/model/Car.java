package com.myapp.model;

public class Car extends Transportation {

    // driver per hari
    public int getDriverPricePerDay() {
        return 300000;
    }

    @Override
    public String getDriverInfo() {
        return "Dengan driver";
    }
}