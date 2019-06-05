package net.agency.service;

import net.agency.model.Hotel;
import net.agency.model.Resort;
import net.agency.model.Tour;

import java.util.List;

public interface HotelService {
    List<Hotel> getAll();
    void add(long idTour, Hotel hotel);
    Hotel getOne(long id);
    Hotel editHotel(Hotel hotel);
    void delete(long idTour, long idHotel);
     void makeBookedHotel(Tour tour, long idHotel);
     void deleteBooking(Tour tour);
    void deleteAll(long idTour);
boolean IsActiveHotels(List<Resort> resorts);
}
