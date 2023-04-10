package com.universalmotors.Universal.Motors.model;

import lombok.Data;

@Data
public class UserAccount {
    private int employeeId;
    private String lastName;
    private String firstName;
    private String email;
    private String position;
    private int salary;
    private double commissionRate;
}
