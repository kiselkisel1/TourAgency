package net.agency.controller;

import net.agency. model.Tour;
import net.agency.service.ResortService;
import net.agency.service.TourService;
import net.agency.service.TransportService;
import net.agency.service.impl.TourServiceImpl;
import net.agency.utils.LoadFile;
import net.agency.validator.TourValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/tour")
public class TourController {

    private static final Logger logger = LoggerFactory.getLogger(TourServiceImpl.class);

   @Autowired
   TourService tourService;

    @Autowired
    TourValidator tourValidator;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String getAdd(@RequestParam("idResort") long idResort,Model model) {
        logger.debug("Received request to show add page");
        model.addAttribute("idResort", idResort);
        Tour tour =new Tour();
        model.addAttribute("tourAttribute", tour);
        return "adding/add-tour";
    }
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String postAdd(@RequestParam("idResort") long idResort,
                          @RequestParam("file") MultipartFile file,
                          @ModelAttribute("tourAttribute") @Valid Tour tour, BindingResult result ) throws IOException {
        logger.debug("Received request to add new record");

        if(file!=null){
            String resultFileName= LoadFile.fileLoading(file);
            tour.setFilename(resultFileName);
        }

        tourValidator.validate(tour,result);
        if(result.hasErrors()){
            return "adding/add-tour";
        }

     tourService.add(idResort,tour);
        return "redirect:/resort/list";
    }


    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String getDelete(@RequestParam("tourId") long tourId,
                            @RequestParam("idResort") long idResort) {
        logger.debug("Received request to delete record");

      tourService.delete(idResort,tourId);
        // Redirect to url
        return "redirect:/resort/list";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String getEdit(@RequestParam("tourId") long tourId,
                          @RequestParam("idResort") long idResort, Model model) {
        logger.debug("Received request to show edit page");


         model.addAttribute("idResort",idResort);
        // Add to model
        model.addAttribute("tourAttribute",  tourService.getOne(tourId));

        return "edit/edit-tour";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String postEdit(@RequestParam("tourId") long id,
                           @RequestParam("file") MultipartFile file,
                           @ModelAttribute("tourAttribute") @Valid  Tour tour,BindingResult result ) throws IOException {
        logger.debug("Received request to edit existing tour");

        tourValidator.validate(tour,result);
        if(result.hasErrors()){
            return "edit/edit-tour";
        }
        tour.setId(id);
        if(file!=null){
            String resultFileName= LoadFile.fileLoading(file);
            tour.setFilename(resultFileName);
        }
        tourService.edit(tour);

        return "redirect:/resort/list";
    }


}
