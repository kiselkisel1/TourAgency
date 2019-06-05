package net.agency.controller;

import net.agency.model.Hotel;
import net.agency.service.HotelService;
import net.agency.service.impl.HotelServiceImpl;
import net.agency.utils.LoadFile;
import net.agency.validator.HotelValidator;
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
@RequestMapping("/hotel")
public class HotelController {

    private static final Logger logger = LoggerFactory.getLogger(HotelServiceImpl.class);

    @Autowired
    HotelService hotelService;

    @Autowired
    HotelValidator hotelValidator;

//    @Value("${upload.path}")
//    private String uploadPath;

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String getAdd(@RequestParam("idtour") long tourId, Model model) {
        logger.debug("Received request to show add page");

        model.addAttribute("tourId", tourId);
        Hotel hotel=new Hotel();
        model.addAttribute("hotelAttribute", hotel);
        return "adding/add-hotel";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String postAdd(@RequestParam("idtour") long tourId,
                          @RequestParam("file") MultipartFile file,
            @ModelAttribute("hotelAttribute") @Valid Hotel hotel, BindingResult result ) throws IOException {
        logger.debug("Received request to add new hotel");

        if(file!=null){
            String resultFileName=LoadFile.fileLoading(file);
            hotel.setFilename(resultFileName);
        }

        hotelValidator.validate(hotel,result);
        if(result.hasErrors()){
            return "adding/add-hotel";
        }
        // Delegate to service
        hotelService.add(tourId, hotel);
        // Redirect to url
        return "redirect:/resort/list";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String getDelete(@RequestParam("tourId") long tourId,
                            @RequestParam("hotelId") long hotelId){
        logger.debug("Received request to delete hotel");


        // Delegate to service
        hotelService.delete(tourId,hotelId);

        // Redirect to url
        return "redirect:/resort/list";
    }


    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String getEdit(@RequestParam("tourId") long tourId,
                          @RequestParam("hotelId") long hotelId, Model model) {
        logger.debug("Received request to show edit page");
        // Add to model
        model.addAttribute("tourId", tourId);
        model.addAttribute("hotelAttribute", hotelService.getOne(hotelId));

        return "edit/edit-hotel";
    }

    /**
     * Edits an existing credit card
     */
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String postEdit(@RequestParam("id") long hotelId,
                           @RequestParam("file") MultipartFile file,
                           @ModelAttribute("hotelAttribute") @Valid Hotel hotel,BindingResult result) throws IOException {
        logger.debug("Received request to add new hotel");

        hotelValidator.validate(hotel,result);
        if(result.hasErrors()){
            return "edit/edit-hotel";
        }
        if(file!=null){
            String resultFileName=LoadFile.fileLoading(file);
            hotel.setFilename(resultFileName);
        }
        // Assign id
        hotel.setId(hotelId);

        // Delegate to service
        hotelService.editHotel(hotel);

        // Redirect to url
        return "redirect:/resort/list";
    }
}
