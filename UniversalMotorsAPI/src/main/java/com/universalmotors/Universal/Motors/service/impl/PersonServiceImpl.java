package com.universalmotors.Universal.Motors.service.impl;

import com.universalmotors.Universal.Motors.model.Person;
import com.universalmotors.Universal.Motors.repository.PersonRepository;
import com.universalmotors.Universal.Motors.service.PersonService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class PersonServiceImpl implements PersonService {

  private final PersonRepository personRepository;

  public Person findByNickname(String nickname){
    log.info("Getting person by nickname: {}", nickname);
    return personRepository.findByNickname(nickname);
  }

  public List<Person> getPersons() {
    log.info("Querying for getting persons");
    return personRepository.findAll();
  }

  public void updateRanking(String nickname, int ranking) {
    log.info("Updating ranking");
    personRepository.updateRanking(nickname, ranking);
  }

//  public void deletePerson(Long id) {
//    log.info("Deleting person");
//    personRepository.updateRanking(nickname, ranking);
//  }

}

