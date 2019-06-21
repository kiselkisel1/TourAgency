package net.agency.service;


import com.google.common.collect.ImmutableList;
import net.agency.config.TestServiceConfig;
import net.agency.model.Resort;
import net.agency.repository.ResortRepository;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.support.AnnotationConfigContextLoader;

import java.util.List;

import static org.mockito.Matchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = TestServiceConfig.class,loader = AnnotationConfigContextLoader.class)
public class ResortServiceTest {

    @Autowired
    private ResortRepository resortRepository;

    @Autowired
    private ResortService resortService;

    public  static  final Resort resort=mock(Resort.class);

    @Test
    public void TestListOfTransports(){
        //get empty list
        //prepare
        when(resortRepository.findAll()).thenReturn(ImmutableList.of());
        //test
        List<Resort> list=resortService.getAll();
        //validate
        //провекра что вызывается
        verify(resortRepository).findAll();
    }

    @Test
    public void testAddResort_returnsNewResort() {

         when(resortService.add(any(Resort.class))).thenReturn(new Resort());
        Assert.assertNotNull(resortService.add(resort));
    }
    @Test
    public void testAddResort_throwsException() {

        when(resortRepository.save(any(Resort.class))).thenThrow(RuntimeException.class);
        Resort resort=new Resort();
         resortService.add(resort);

    }
}
