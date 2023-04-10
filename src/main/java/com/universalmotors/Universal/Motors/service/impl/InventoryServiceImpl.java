package com.universalmotors.Universal.Motors.service.impl;

import com.universalmotors.Universal.Motors.model.Car;
import com.universalmotors.Universal.Motors.repository.InventoryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class InventoryServiceImpl {
    private final InventoryRepository inventoryRepository;
    public List<Car> getAllCars() {
        return inventoryRepository.findAllCars();
    }

    public List<Car> getCarsByYear(Integer year) {
        return inventoryRepository.findCarsByYear(year);
    }
    public List<Car> getCarsByMake(String make) {
        return inventoryRepository.findCarsByMake(make);
    }
    public List<Car> getCarsByModel(String model) {
        return inventoryRepository.findCarsByModel(model);
    }
}
