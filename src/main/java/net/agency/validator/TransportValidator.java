package net.agency.validator;

import net.agency.model.Transport;
import net.agency.service.TransportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class TransportValidator implements Validator {

    @Autowired
    TransportService transportService;

    @Override
    public boolean supports(Class<?> aClass) {
        return Transport.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
//        Transport tour=(Transport)o;
//
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "name.required");
//
//        if (tour.getName().length() < 2 || tour.getName().length() > 10) {
//            errors.rejectValue("name",  "Name must have from 2 to 10 characters");
//        }
//
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", "description.required");
//
//        if (tour.getDescription().length() < 7 || tour.getDescription().length() > 50) {
//            errors.rejectValue("description",  "Description must have from 7 to 50 characters");
//        }

    }
}
