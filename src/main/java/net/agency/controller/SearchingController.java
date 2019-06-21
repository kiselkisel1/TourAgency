package net.agency.controller;

import net.agency.model.Resort;
import net.agency.model.Tour;
import net.agency.service.ResortService;
import net.agency.service.TourService;
import net.agency.service.impl.ResortServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Controller
public class SearchingController {

    @Autowired
    ResortService resortService;

    @Autowired
    TourService tourService;

    private static final Logger logger = LoggerFactory.getLogger(ResortServiceImpl.class);


    @GetMapping("/search")
    public String getPrice(Model model) {
        logger.debug("list all tours");
        model.addAttribute("tours", tourService.getFreeAndActiveTours());
        return "searching";
    }


    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String getDate( @RequestParam("name") String name,
                           @RequestParam("date") String date,
                           @RequestParam("price") String price, Model model) throws ParseException {

        Set<Tour> searchResults = new HashSet<>();
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date newDate;
        Resort resort = resortService.getByName(name);
        if (resort == null) {
            model.addAttribute("exception", "There are no available tours");
            logger.debug("resort==null");
        }
        else
        {
            if (!date.isEmpty() && date != null && price != null && !price.isEmpty()) {
                newDate = format.parse(date);
                searchResults = tourService.findByPriceAndDate(resort, Double.parseDouble(price), newDate);
            } else if ((date.isEmpty() || date == null) && (price == null || price.isEmpty())) {
                logger.debug("444");
                searchResults = resort.getTours();
            } else if ((date == null || date.isEmpty()) && (price != null || !price.isEmpty())) {
                searchResults = tourService.sortByPrice(resort, Double.parseDouble(price));
            } else if ((price == null || price.isEmpty()) && (!date.isEmpty() || date != null)) {
                newDate = format.parse(date);
                searchResults = tourService.sortByDate(resort, newDate);
            }
            model.addAttribute("tours", searchResults);

        }
        return "searching";
    }
}
