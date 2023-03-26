package com.universalmotors.Universal.Motors.service.impl;

import com.universalmotors.Universal.Motors.model.UserAccount;
import com.universalmotors.Universal.Motors.repository.UserAccountsRepository;
import com.universalmotors.Universal.Motors.service.UserAccountsService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserAccountsServiceImpl implements UserAccountsService {

  private final UserAccountsRepository userAccountsRepository;

  public void createUserAccount(UserAccount userAccount) {
    log.info("Creating a new user account...");
    userAccountsRepository.addUserAccount(userAccount);
  }

}

