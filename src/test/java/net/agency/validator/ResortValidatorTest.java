package net.agency.validator;

import net.agency.config.TestValidatorConfig;
import net.agency.model.Resort;
import net.agency.service.ResortService;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.support.AnnotationConfigContextLoader;
import org.springframework.validation.Errors;

import static org.mockito.Mockito.*;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = TestValidatorConfig.class,loader = AnnotationConfigContextLoader.class)
public class ResortValidatorTest {

    @Autowired
    ResortService resortService;

    @Autowired
    ResortValidator resortValidator;

    public static  final String name="France";
    public  static  final Resort resort=mock(Resort.class);

    @BeforeAll
    public static void setup(){
            when(resort.getName()).thenReturn(name);
    }

    @Test
    public void AcceptResortIfNewName(){
         when(resortService.getByName(name)).thenReturn(null);
        Errors errors=mock(Errors.class);
        resortValidator.validate(resort,errors);
        verify(errors,never()).rejectValue(eq("name"),any());
    }
    @Test
    public void RejectResortWithTheSameName(){
        when(resortService.getByName(name)).thenReturn(resort);
        Errors errors=mock(Errors.class);
        resortValidator.validate(resort,errors);
        verify(errors,times(1)).rejectValue(eq("name"),any());
    }
}
