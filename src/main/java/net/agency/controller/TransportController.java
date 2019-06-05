package net.agency.controller;

import net.agency.model.Transport;
import net.agency.service.TourService;
import net.agency.service.TransportService;
import net.agency.service.impl.TransportServiceImpl;
import net.agency.utils.LoadFile;
import net.agency.validator.TransportValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.IOException;

@Controller
@RequestMapping("/transport")
public class TransportController {

    private static final Logger logger = LoggerFactory.getLogger(TransportServiceImpl.class);

    @Autowired
    TransportService transportService;

    @Autowired
    TourService tourService;

    @Autowired
    TransportValidator transportValidator;

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String getAdd(@RequestParam("idtour") long tourId, Model model) {
        logger.debug("Received request to show add page");

        model.addAttribute("tourId", tourId);
        Transport transport=new Transport();
        model.addAttribute("transportAttribute",transport);

        return "adding/add-transport";
    }


    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String postAdd(@RequestParam("idtour") long tourId,
                          @RequestParam("file") MultipartFile file,
             @ModelAttribute("transportAttribute") @Valid  Transport transport,BindingResult result ) throws IOException {
        logger.debug("Received request to add new transport");

        transportValidator.validate(transport,result);
        if(result.hasErrors()){
            return "adding/add-transport";
        }
        if(file!=null){
            String resultFileName= LoadFile.fileLoading(file);
            transport.setFilename(resultFileName);
        }
        transportService.add(tourId,transport);
        return "redirect:/resort/list";
    }


    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String getDelete(@RequestParam("tourId") long tourId,
                            @RequestParam("transportId") long transportId){
        logger.debug("Received request to delete transport");
        // Delegate to service
        transportService.delete(tourId,transportId);
        // Redirect to url
        return "redirect:/resort/list";
    }

    /**
     * Retrieves the "Edit Existing Credit Card" page
     */
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String getEdit(@RequestParam("tourId") long tourId,
                          @RequestParam("transportId") long transportId, Model model) {
        logger.debug("Received request to show edit page");


        model.addAttribute("tourId", tourId);
        model.addAttribute("transportAttribute", transportService.getOne(transportId));


         return "edit/edit-transport";
    }


    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String postEdit(@RequestParam("id") long transportId,
                           @RequestParam("file") MultipartFile file,
                           @ModelAttribute("transportAttribute") @Valid  Transport transport,BindingResult result) throws IOException {
        logger.debug("Received request to add new transport");

        transportValidator.validate(transport,result);
        if(result.hasErrors()){
            return "edit/edit-transport";
        }
        if(file!=null){
            String resultFileName= LoadFile.fileLoading(file);
            transport.setFilename(resultFileName);
        }
              // Assign id
        transport.setId(transportId);

        // Delegate to service
     transportService.editTransport(transport);

        // Redirect to url
        return "redirect:/resort/list";
    }
}
