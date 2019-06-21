package net.agency.config;

import net.agency.service.ResortService;
import net.agency.service.impl.ResortServiceImpl;
import net.agency.validator.ResortValidator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.support.AnnotationConfigContextLoader;

import static org.mockito.Mockito.mock;

@Configuration
public class TestValidatorConfig {

    @Bean
    public ResortValidator resortValidator(){
        return new ResortValidator();
    }

    @Bean
    public ResortService resortService(){
        return mock(ResortService.class);
    }
}
