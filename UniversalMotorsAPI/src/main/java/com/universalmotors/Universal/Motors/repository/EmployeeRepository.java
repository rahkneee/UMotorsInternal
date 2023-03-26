package com.universalmotors.Universal.Motors.repository;

import com.universalmotors.Universal.Motors.model.Car;
import com.universalmotors.Universal.Motors.model.EmployeeData;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
@RequiredArgsConstructor
public class EmployeeRepository {

    private final JdbcTemplate jdbcTemplate;

    public List<EmployeeData> getEmployeeData() {
        return jdbcTemplate.query(
                "select dealerstats.*, useraccounts.firstname, useraccounts.lastname from dealerstats\n" +
                        "inner join useraccounts ON dealerstats.employeeid = useraccounts.employeeid\n" +
                        "order by employeeid",
                BeanPropertyRowMapper.newInstance(EmployeeData.class)
        );
    }

}
