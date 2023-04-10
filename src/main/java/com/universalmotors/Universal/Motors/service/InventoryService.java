package com.universalmotors.Universal.Motors.service;

import com.universalmotors.Universal.Motors.model.Car;

import java.util.List;

public interface InventoryService {
    public List<Car> getAllCars();

    public List<Car> getCarsByYear(Integer year);

    public List<Car> getCarsByMake(String make);
    public List<Car> getCarsByModel(String model);
}
