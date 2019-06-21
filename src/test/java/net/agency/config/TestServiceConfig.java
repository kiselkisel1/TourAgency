package net.agency.config;

import net.agency.repository.ResortRepository;
import net.agency.service.HotelService;
import net.agency.service.ResortService;
import net.agency.service.TransportService;
import net.agency.service.impl.ResortServiceImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import static org.mockito.Mockito.mock;

@Configuration
public class TestServiceConfig {
    @Bean
    public ResortService resortService()
    {
        return new ResortServiceImpl();
    }

    @Bean
    public ResortRepository resortRepository(){
        return mock(ResortRepository.class);
    }

    @Bean
    public TransportService transportService(){
        return mock(TransportService.class);
    }

    @Bean
    public HotelService hotelService(){
        return mock(HotelService.class);
    }

}
