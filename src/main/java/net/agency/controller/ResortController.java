package net.agency.controller;

import net.agency.model.Resort;
import net.agency.service.HotelService;
import net.agency.service.ResortService;
import net.agency.service.TourService;
import net.agency.service.TransportService;
import net.agency.service.impl.ResortServiceImpl;
import net.agency.validator.ResortValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/resort")
public class ResortController {

    @Autowired
    ResortService resortService;

    @Autowired
    ResortValidator resortValidator;

    @Autowired
    HotelService hotelService;

    @Autowired
    TourService tourService;

    @Autowired
    TransportService transportService;

    private static final Logger logger = LoggerFactory.getLogger(ResortServiceImpl.class);

    @GetMapping("/list")
    public String getBooking(Model model) {
        logger.debug("Received request to show records page");
            resortService.checkActive();
            List<Resort>resorts=resortService.getAllActive();
        model.addAttribute("activeResorts",resortService.IsActiveResorts(resorts));
            model.addAttribute("activeHotels",hotelService.IsActiveHotels(resorts));
           model.addAttribute("activeTours",tourService.IsActiveTours(resorts));
             model.addAttribute("activeTransports",transportService.IsActiveTransports(resorts));
         model.addAttribute("resorts",resortService.getAllActive());
         model.addAttribute("allTours",tourService.getAll());
        return "admin";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String getAdd(Model model) {
        logger.debug("Received request to show add page");
        model.addAttribute("resort", new Resort());
        return "adding/add-resort";
    }
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String postAdd(@ModelAttribute("resort") @Valid Resort resort, BindingResult result ) {
        logger.debug("Received request to add new record");

        resortValidator.validate(resort,result);
        if(result.hasErrors()){
            return "adding/add-resort";
        }
        this.resortService.add(resort);
        return "redirect:/resort/list";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String getDelete(@RequestParam("idResort") long id) {
        logger.debug("Received request to delete record");

        // Delete person
        resortService.delete(id);

        // Redirect to url
        return "redirect:/resort/list";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String getEdit(@RequestParam("idResort") long id, Model model) {
        logger.debug("Received request to show edit page");


        // Retrieve booking by id
        Resort resort = resortService.getOne(id);
        model.addAttribute("idResort",id);

        // Add to model
        model.addAttribute("resortAttribute", resort);

        return "edit/edit-resort";
    }

    /**
     * Edits an existing record
     */
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String postEdit(@RequestParam("idResort") long id,
                           @ModelAttribute("resortAttribute") @Valid  Resort resort,BindingResult result ) {
        logger.debug("Received request to edit existing resort");

        resortValidator.validate(resort,result);
        if(result.hasErrors()){
            return "edit/edit-resort";
        }

        resort.setId(id);

        resortService.edit(resort);

        return "redirect:/resort/list";
    }


}
