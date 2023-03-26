package com.universalmotors.Universal.Motors.model;

import lombok.Data;

import java.util.List;

@Data
public class EmployeeData {
	private int employeeId;
	private String firstname;
	private String lastname;
	private int sales;
	private String salesDate;
	private String autoSold;
	private String vin;
}
