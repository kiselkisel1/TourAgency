package net.agency.validator;

import net.agency.model.Tour;
import net.agency.service.TourService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class TourValidator implements Validator {

    private static final Logger logger = LoggerFactory.getLogger(Tour.class);

    @Autowired
    TourService tourService;

    @Override
    public boolean supports(Class<?> aClass) {
        return Tour.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {

        Tour tour = (Tour) o;

        if (tour.getDate_begin().after(tour.getDate_end())) {
            errors.rejectValue("date_begin", "Date.Before.After");
            logger.error("date begin rejected");
        }
        if (tour.getDate_end().before(tour.getDate_begin())) {
            errors.reject("date_end", "Date.Before.After");
            logger.error("Date end rejected");
        }

//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "full_price", "Required");
//

    }
}
