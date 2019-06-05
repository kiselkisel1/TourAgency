package net.agency.controller;

import net.agency.model.*;
import net.agency.service.*;
import net.agency.service.impl.BookingServiceImpl;
import net.agency.validator.TourValidator;
import net.agency.validator.UserValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BookingController {

    private static final Logger logger = LoggerFactory.getLogger(BookingServiceImpl.class);

    @Autowired
    TourService tourService;

    @Autowired
    UserService userService;

    @Autowired
    BookingService bookingService;

    @Autowired
    UserValidator userValidator;

    @Autowired
    TourValidator tourValidator;

    @Autowired
    HotelService hotelService;

    @Autowired
    TransportService transportService;

    @RequestMapping(value = "/next", method = RequestMethod.GET)
    public String next(@RequestParam("idTour") long idTour,Model model){
        logger.debug("id tour "+idTour);
        Tour tour=tourService.getOne(idTour);
        model.addAttribute("tour",tour);
        return "chooseHotel";
    }
    @RequestMapping(value = "/save", method = RequestMethod.GET)
    public String save(@RequestParam("idTour") long idTour,
                       @RequestParam("username") String username,
                       @RequestParam("idTransport") long idTransport,
                       @RequestParam("idHotel") long idHotel){
       User user=userService.findByUsername(username);
        if (user.getBooking() != null) {
            bookingService.add(user.getBooking(),idTour,idTransport,idHotel);
        }
        else {
            Booking booking = new Booking();
            bookingService.add(booking, idTour, idTransport,idHotel,username);
        }
        return "redirect:/account?username="+username;
    }

    @RequestMapping(value = "/choose", method = RequestMethod.GET)
    public String chooseTransport(@RequestParam("idTour") long idTour,
                              @RequestParam("idHotel") long id,Model model){
            model.addAttribute("idHotel",id);
                    logger.debug("id hotel "+id);
            Tour tour=tourService.getOne(idTour);
            model.addAttribute("tour",tour);
        return "chooseTransport";
    }



    @GetMapping("/account")
    public String listBooking(@RequestParam("username") String username,Model model) {
        logger.debug("book get");
        User user=userService.findByUsername(username);

        model.addAttribute("booking", user.getBooking());
        return "account";
    }

    @GetMapping("/account/pay")
    public String pay(Model model) {
        logger.debug("pay");
        model.addAttribute("paid","Your booking is paid");
        return "account";
    }
    @RequestMapping(value = "/account/delete", method = RequestMethod.GET)
    public String getDelete(@RequestParam("tourId") long tourId,
                            @RequestParam("bookingId") long bookingId,
                            @RequestParam("username") String username){
        logger.debug("tourid= "+tourId+" booking id = "+bookingId);

     bookingService.delete(tourId,bookingId);

        return "redirect:/account?username="+username;
    }

}
