package net.agency.service.impl;

import net.agency.model.*;
import net.agency.repository.HotelRepository;
import net.agency.repository.TourRepository;
import net.agency.service.HotelService;
import net.agency.service.TourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("hotelService")
@Transactional
public class HotelServiceImpl implements HotelService {

    @Autowired
    HotelRepository hotelRepository;

    @Autowired
    TourRepository tourRepository;

    @Autowired
    TourService tourService;

    @Override
    public List<Hotel> getAll() {
        return hotelRepository.findAll();
    }

    @Override
    public void add(long idtour, Hotel hotel) {

        Tour excistingTour =this.tourService.getOne(idtour);
        excistingTour.getHotels().add(hotel);
        tourService.add(excistingTour);
//        bookingRepository.saveAndFlush(excistingBooking);
    }

    @Override
    public Hotel getOne(long id) {
        return hotelRepository.getOne(id);
    }

    @Override
    public Hotel editHotel(Hotel hotel)
    {
        return hotelRepository.saveAndFlush(hotel);
    }

    @Override
    public void delete(long idTour,long idHotel) {

        Tour excistingTour=this.tourService.getOne(idTour);
        Hotel hotel=this.hotelRepository.getOne(idHotel);
    //   excistingTour.getHotels().remove(hotel);
        excistingTour.getHotels().forEach(Hotel -> {
            if (Hotel==hotel) {
                hotel.setActive(false);
            }});
       tourRepository.saveAndFlush(excistingTour);
    }

    @Override
    public void makeBookedHotel(Tour tour, long idHotel) {
     Hotel hotel=hotelRepository.getOne(idHotel);
        for(Hotel item:tour.getHotels()){
            if(hotel==item)   {
                hotel.setBooked(true);
             }
        }
    }



    @Override
    public void deleteBooking(Tour tour) {
for(Hotel hotel:tour.getHotels()){
    hotel.setBooked(false);
}
    }

    @Override
    public void deleteAll(long idTour) {
        Tour excistingTour=tourRepository.getOne(idTour);
        excistingTour.getHotels().forEach(hotel -> hotel.setActive(false));
    }

    @Override
    public boolean IsActiveHotels(List<Resort> resorts) {
        boolean active=false;
        for(Resort resort:resorts){
            for(Tour tour:resort.getTours()){
                for(Hotel hotel:tour.getHotels())
                {
                    if(hotel.isActive()==true){
                        active=true;
                    }
                }
            }
        }

        return active;
    }

}
