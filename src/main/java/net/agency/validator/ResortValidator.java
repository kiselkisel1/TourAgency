package net.agency.validator;

import net.agency.model.Resort;
import net.agency.service.ResortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class ResortValidator implements Validator {


    @Autowired
    ResortService resortService;

    @Override
    public boolean supports(Class<?> aClass) {
        return Resort.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Resort resort=(Resort)o;

        if (resortService.getByName(resort.getName()) != null) {
            errors.rejectValue("name", "Duplicate.name");
        }
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "Required");

    }
}
