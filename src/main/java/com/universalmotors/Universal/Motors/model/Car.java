package com.universalmotors.Universal.Motors.model;

import lombok.Data;

@Data
public class Car {

    private int year;
    private String make;
    private String model;
    private String color;
    private int miles;
    private int price;
    private String newOrUsed;
    private String soldOrinStock;
    private int doors;
    private String body;
    private String vin;

}
