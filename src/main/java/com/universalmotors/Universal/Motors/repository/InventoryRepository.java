package com.universalmotors.Universal.Motors.repository;

import com.universalmotors.Universal.Motors.model.Car;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
@RequiredArgsConstructor
public class InventoryRepository {

    private final JdbcTemplate jdbcTemplate;

    public List<Car> findAllCars() {
        return jdbcTemplate.query(
                "SELECT * FROM inventory",
                BeanPropertyRowMapper.newInstance(Car.class)
        );
    }
    public List<Car> findCarsByYear(int year) {
        return jdbcTemplate.query(
                "SELECT * FROM inventory WHERE year = ?", new Object[]{year},
                BeanPropertyRowMapper.newInstance(Car.class)
        );
    }

    public List<Car> findCarsByMake(String make) {
        return jdbcTemplate.query(
                "SELECT * FROM inventory WHERE make = ?", new Object[]{make},
                BeanPropertyRowMapper.newInstance(Car.class)
        );
    }

    public List<Car> findCarsByModel(String model) {
        return jdbcTemplate.query(
                "SELECT * FROM inventory WHERE model = ?", new Object[]{model},
                BeanPropertyRowMapper.newInstance(Car.class)
        );
    }

}
