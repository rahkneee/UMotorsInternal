package com.universalmotors.Universal.Motors.repository;

import com.universalmotors.Universal.Motors.model.UserAccount;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


@Slf4j
@Repository
@RequiredArgsConstructor
public class UserAccountsRepository {

  private final JdbcTemplate jdbcTemplate;

  public boolean addUserAccount(UserAccount userAccount) {
    return jdbcTemplate.update("INSERT INTO useraccounts VALUES (?, ?, ?, ?, ?, ?, ?)", userAccount.getEmployeeId(), userAccount.getLastName(), userAccount.getFirstName(), userAccount.getEmail(), userAccount.getPosition(), userAccount.getSalary(), userAccount.getCommissionRate()) == 1;
  }

}
