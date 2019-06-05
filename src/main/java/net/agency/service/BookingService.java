package net.agency.service;

import net.agency.model.Booking;

import java.util.List;

public interface BookingService {
    List<Booking> getAll();
    Booking getOne(long id);
    void edit(Booking booking);
    void delete(long idTour, long idBooking);
    Booking add(Booking booking, long idTour, String username);
    Booking add(Booking booking, long idTour);
    Booking add(Booking booking, long idTour, long idTransport, long idHotel, String username);
    Booking add(Booking booking, long idTour, long idTransport, long idHotel);

}
