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
                "SELECT lastname, Count(dealerstats.EmployeeId) As NumSold, SUM(Sales) AS TotalSales\n" +
                        "FROM `dealerstats` \n" +
                        "JOIN `useraccounts` ON(dealerstats.EmployeeID = useraccounts.EmployeeID)\n" +
                        "\n" + "GROUP BY dealerstats.employeeID",
                BeanPropertyRowMapper.newInstance(EmployeeData.class)
        );
    }

}
