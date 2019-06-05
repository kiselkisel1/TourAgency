package net.agency.service.impl;

import net.agency.model.*;
import net.agency.repository.BookingRepository;
import net.agency.repository.UserRepository;
import net.agency.service.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("bookingService")
@Transactional
public class BookingServiceImpl implements BookingService {

    private static final Logger logger = LoggerFactory.getLogger(Booking.class);

    @Autowired
    BookingRepository bookingRepository;

    @Autowired
    HotelService hotelService;

    @Autowired
    TourService tourService;

    @Autowired
    UserService userService;

    @Autowired
    UserRepository userRepository;

    @Autowired
    TransportService transportService;

    @Override
    public List<Booking> getAll() {
        return bookingRepository.findAll();
    }

    @Override
    public Booking getOne(long id)
    {
        return bookingRepository.getOne(id);
    }

    @Override
    public void edit(Booking booking) {

    }

    @Override
    public void delete(long idTour,long idBooking) {
        logger.debug("delete");

        Booking booking=bookingRepository.getOne(idBooking);
            Tour tour=tourService.getOne(idTour);
            tour.setBooking(null);
            transportService.deleteBooking(tour);
            hotelService.deleteBooking(tour);
            booking.getTours().remove(tour);
            bookingRepository.saveAndFlush(booking);
    }

    @Override
    public Booking add(Booking booking,long idTour,String username)
    {
        logger.debug("add 1");

        Tour tour=tourService.getOne(idTour);
     //   tour.setFree(false);
        tour.setBooking(booking);
        User user= userService.findByUsername(username);
        booking.getTours().add(tour);
        booking.setStatus("active");
        user.setBooking(booking);
        booking.setUser(user);
       // userRepository.saveAndFlush(user);
         return  bookingRepository.saveAndFlush(booking);

     }
    @Override
    public Booking add(Booking booking,long idTour)
    {
        logger.debug("add 2");
        Tour tour=tourService.getOne(idTour);
        tour.setBooking(booking);
        booking.getTours().add(tour);
        logger.debug("booking= "+booking.toString());
        return  bookingRepository.saveAndFlush(booking);
    }
    @Override
    public Booking add(Booking booking, long idTour, long idTransport,long idHotel) {
        logger.debug("save2");
        Tour tour=tourService.getOne(idTour);
        transportService.makeBooked(tour,idTransport);
        hotelService.makeBookedHotel(tour,idHotel);
         tour.setBooking(booking);
        booking.getTours().add(tour);

        return  bookingRepository.saveAndFlush(booking);
    }

    @Override
    public Booking add(Booking booking, long idTour, long idTransport,long idHotel,String username) {
        logger.debug("save");
        Tour tour=tourService.getOne(idTour);
        User user= userService.findByUsername(username);

        transportService.makeBooked(tour,idTransport);
        hotelService.makeBookedHotel(tour,idHotel);

        booking.setStatus("active");
        tour.setBooking(booking);
        booking.getTours().add(tour);
        user.setBooking(booking);
        booking.setUser(user);
        return  bookingRepository.saveAndFlush(booking);
    }
}
