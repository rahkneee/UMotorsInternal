package com.universalmotors.Universal.Motors.web;

import com.universalmotors.Universal.Motors.model.Car;
import com.universalmotors.Universal.Motors.model.EmployeeData;
import com.universalmotors.Universal.Motors.model.UserAccount;
import com.universalmotors.Universal.Motors.service.impl.EmployeeServiceImpl;
import com.universalmotors.Universal.Motors.service.impl.InventoryServiceImpl;
import com.universalmotors.Universal.Motors.service.impl.UserAccountsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;


@RestController
@RequestMapping("/api/v1")
public class UniversalMotorsController {
    @Autowired
    private UserAccountsServiceImpl userAccountsService;
    @Autowired
    private InventoryServiceImpl inventoryService;

    @Autowired
    private EmployeeServiceImpl employeeService;


    @PostMapping("/userAccounts")
    public ResponseEntity<UserAccount> createUserAccount(@RequestBody UserAccount userAccount) {
        userAccountsService.createUserAccount(userAccount);
        return ResponseEntity.ok().body(userAccount);
    }

    @GetMapping("/inventory")
    public List<Car> getCarsByAttributes(@RequestParam Optional<Integer> year, @RequestParam Optional<String> make, @RequestParam Optional<String> model) {
        if ((year).isEmpty() && (make).isEmpty() && (model).isEmpty()) {
            return inventoryService.getAllCars();
        }

        if ((year).isPresent()) {
            return inventoryService.getCarsByYear(year.get());
        }
        else if ((model).isPresent()) {
            return inventoryService.getCarsByModel(model.get().toUpperCase());
        }
        else {
            return inventoryService.getCarsByMake(make.get().toUpperCase());
        }

    }
    @GetMapping("/inventory/cars")
    public List<Car> getCarsByYear(@RequestParam int year) {
        return inventoryService.getCarsByYear(year);
    }

    @GetMapping("/employees/sales")
    public List<EmployeeData> getEmployeesSales() {
        return employeeService.getEmployeesSales();
    }


//
//    @GetMapping("/persons/{nickname}")
//    public ResponseEntity<Person> getPersonByNickname(@PathVariable(value = "nickname") String nickname)
//            throws ResourceNotFoundException {
//        Person person = personService.findByNickname(nickname);
//        return ResponseEntity.ok().body(person);
//    }
//
//
//
//

//
//    @DeleteMapping("/person/{id}")
//    public ResponseEntity<Boolean> deletePerson(@PathVariable(value = "id") Long id)
//            throws ResourceNotFoundException {
//        boolean success = personService.deletePerson(id);
//        return ResponseEntity.ok().body(success);
//    }

    //    @GetMapping("/persons/{nickname}")
//    public ResponseEntity<Person> getPersonByNickname(@PathVariable(value = "nickname") String nickname)
//            throws ResourceNotFoundException {
//        Person person = personService.findByNickname(nickname);
//        return ResponseEntity.ok().body(person);
//    }


}