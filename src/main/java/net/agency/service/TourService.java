package net.agency.service;

import net.agency.model.Resort;
import net.agency.model.Tour;

import java.util.Date;
import java.util.List;
import java.util.Set;

public interface TourService {
    List<Tour> getAll();
    List<Tour> getFreeAndActiveTours();

    Tour getOne(long id);
    void edit(Tour tour);
    void delete(long idResort);
    Tour add(Tour tour);

    void add(long idResort, Tour tour);
    void delete(long idResort, long idTour);

    Set<Tour> sortByPrice(Resort resort, double price);
    Set<Tour> sortByDate(Resort resort, Date date);
    Set<Tour>findByPriceAndDate(Resort resort, double price, Date date);

    boolean IsActiveTours(List<Resort> resorts);

}
