package net.agency.validator;

import net.agency.model.Hotel;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class HotelValidator implements Validator {
    @Override
    public boolean supports(Class<?> aClass) {
        return Hotel.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {

    }
}
