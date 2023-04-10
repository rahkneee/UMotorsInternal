package com.universalmotors.Universal.Motors.service;

import com.universalmotors.Universal.Motors.model.Person;

import java.util.List;

public interface PersonService {

	Person findByNickname(String nickname);
	List<Person> getPersons();
	void updateRanking(String nickname, int ranking);
//	void deletePerson(Long id);

}
