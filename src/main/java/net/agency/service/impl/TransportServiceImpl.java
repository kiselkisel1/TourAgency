package net.agency.service.impl;

import net.agency.model.*;
import net.agency.repository.TourRepository;
import net.agency.repository.TransportRepository;
import net.agency.service.TourService;
import net.agency.service.TransportService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("transportService")
@Transactional
public class TransportServiceImpl implements TransportService {

     @Autowired
     TransportRepository transportRepository;

     @Autowired
    TourRepository tourRepository;

    @Autowired

    TourService tourService;

    private static final Logger logger = LoggerFactory.getLogger(Transport.class);

    @Override
    public List<Transport> getAll()
    {
        return transportRepository.findAll();
    }

    @Override
    public void add( long idtour,Transport transport) {
        Tour excistingTour =this.tourService.getOne(idtour);
        excistingTour.getTransports().add(transport);

        tourService.add(excistingTour);
    }

    @Override
    public Transport getOne(long id)
    {
        return transportRepository.getOne(id);
    }

    @Override
    public Transport editTransport(Transport transport)
    {
        return transportRepository.saveAndFlush(transport);
    }

    @Override
    public void delete(long idTour,long idTransport) {

        Tour excistingTour=this.tourService.getOne(idTour);
        Transport transport=transportRepository.getOne(idTransport);
      //  excistingTour.getTransports().remove(transport);
        excistingTour.getTransports().forEach(Transport -> {
            if (Transport==transport) {
                transport.setActive(false);
            }});
       tourRepository.saveAndFlush(excistingTour);

    }

    @Override
    public void makeBooked(Tour tour, long idTransport) {
        Transport transport=transportRepository.getOne(idTransport);
        for(Transport item:tour.getTransports()){
            if(transport==item)   {
                transport.setBooked(true);
                logger.debug("transport are equal"+transport.toString());
            }
        }
    }



    @Override
    public void deleteBooking(Tour tour) {
        for(Transport transport:tour.getTransports()){
            transport.setBooked(false);
        }
    }

    @Override
    public void deleteAll(long idTour) {
        Tour excistingTour=tourRepository.getOne(idTour);
        excistingTour.getTransports().forEach(transport -> transport.setActive(false));
    }

    @Override
    public boolean IsActiveTransports(List<Resort> resorts) {
        boolean active=false;
        for(Resort resort:resorts){
            for(Tour tour:resort.getTours()){
                for(Transport transport:tour.getTransports())
                {
                    if(transport.isActive()==true){
                        active=true;
                    }
                }
            }
        }

        return active;
    }


//    @Override
//    public void delete(Long idTransport,Long idBooking) {
//
//        Tour excistingBooking=this.bookingRepository.getOne(idBooking);
//        Transport transport =this.transportRepository.getOne(idTransport);
//        excistingBooking.getTransports().remove(transport);
//        bookingRepository.saveAndFlush(excistingBooking);
////        transportRepository.deleteById(id);
////        bookingRepository.flush();
//
//    }


//    @Override
//    public Set<Transport> getAll(Long idBooking){
//
//        Tour excistingBooking=this.bookingRepository.getOne(idBooking);
//        Set<Transport> transports =excistingBooking.getTransports();
//        return transports;
//    }
}
