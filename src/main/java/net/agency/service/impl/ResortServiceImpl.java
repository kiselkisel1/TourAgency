package net.agency.service.impl;

import net.agency.model.Resort;
import net.agency.model.Tour;
import net.agency.repository.ResortRepository;
import net.agency.service.HotelService;
import net.agency.service.ResortService;
import net.agency.service.TransportService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service("resortService")
@Transactional
public class ResortServiceImpl implements ResortService {

    @Autowired
    ResortRepository resortRepository;

    @Autowired
    TransportService transportService;

    @Autowired
    HotelService hotelService;

    private static final Logger logger = LoggerFactory.getLogger(Resort.class);

    @Override
    public List<Resort> getAll() {
        return resortRepository.findAll();
    }

    @Override
    public List<Resort> getAllActive() {
        return resortRepository.getAllByActiveIsTrue();
    }

    @Override
    public Resort getOne(long id) {
        return resortRepository.getOne(id);
    }

    @Override
    public void edit(Resort resort) {

        Resort existingResort=resortRepository.getOne(resort.getId());
        existingResort.setName(resort.getName());
        existingResort.setTours(resort.getTours());
        resortRepository.saveAndFlush(existingResort);
      }

    @Override
    public void delete(long id) {

        Resort resort=resortRepository.getOne(id);
        resort.setActive(false);
for(Tour tour:resort.getTours()){
    tour.setActive(false);
    transportService.deleteAll(tour.getId());
    hotelService.deleteAll(tour.getId());
}
        resortRepository.saveAndFlush(resort);
       // resortRepository.deleteById(id);
    }

    @Override
    public Resort add(Resort resort)
    {
        Resort savedResort=resortRepository.saveAndFlush(resort);
        return savedResort;
    }

        @Override
        public Resort getByName(String name) {
            return resortRepository.findByName(name);
        }

    @Override
    public void checkActive() {
        Date date=new Date();
        logger.debug("date="+date);
        List<Resort> resortList=resortRepository.getAllByActiveIsTrue();
        for (Resort resort:resortList){
            for(Tour tour :resort.getTours()){
                logger.debug("date begin ="+tour.getDate_begin());
                if(tour.getDate_begin().before(date)){
                    logger.debug("date="+tour.getDate_begin()+"before"+date);
                    tour.setActive(false);
                }
            }
            resortRepository.saveAndFlush(resort);
        }

    }

    @Override
    public boolean IsActiveResorts(List<Resort> resorts) {
        boolean active=false;
        for(Resort resort:resorts){
                if(resort.isActive()==true){
                    active=true;
                }
                    }
        return active;
    }
}
