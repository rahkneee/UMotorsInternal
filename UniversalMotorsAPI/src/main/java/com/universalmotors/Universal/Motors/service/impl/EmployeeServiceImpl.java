package com.universalmotors.Universal.Motors.service.impl;

import com.universalmotors.Universal.Motors.model.EmployeeData;
import com.universalmotors.Universal.Motors.repository.EmployeeRepository;
import com.universalmotors.Universal.Motors.service.EmployeeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class EmployeeServiceImpl implements EmployeeService {

  private final EmployeeRepository employeeRepository;

  public List<EmployeeData> getEmployeesSales() {
    //log.info("Getting employee by nickname: {}", nickname)
    return employeeRepository.getEmployeeData();
  }


}

