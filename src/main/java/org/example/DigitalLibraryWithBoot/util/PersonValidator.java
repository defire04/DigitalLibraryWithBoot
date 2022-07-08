package org.example.DigitalLibraryWithBoot.util;



import org.example.DigitalLibraryWithBoot.models.Person;
import org.example.DigitalLibraryWithBoot.services.PeopleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;


@Component
public class PersonValidator implements Validator {

    private final PeopleService peopleService;

    @Autowired
    public PersonValidator(PeopleService peopleService) {
        this.peopleService = peopleService;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return Person.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Person person = (Person) o;
        if (peopleService.getPersonByFullName(person.getFullName()).isPresent()) {
            Person returnedPerson = peopleService.getPersonByFullName(person.getFullName()).get();
            if (returnedPerson.getId() != person.getId()) {
                errors.rejectValue("fullName", "", "Пользователь с таким именем уже существует");
            }
        }
    }
}
