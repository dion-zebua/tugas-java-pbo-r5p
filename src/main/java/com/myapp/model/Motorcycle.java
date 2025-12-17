package com.myapp.model;

public class Motorcycle extends Transportation {

    // driver per hari
    public int getDriverPricePerDay() {
        return 0;
    }

    @Override
    public String getDriverInfo() {
        return "Tanpa driver";
    }
}