package net.agency.service;

import net.agency.model.Resort;
import net.agency.model.Tour;
import net.agency.model.Transport;

import java.util.List;

public interface TransportService {
    List<Transport> getAll();
    void add(long idTour, Transport transport);
    Transport getOne(long id);
    Transport editTransport(Transport transport);
    void delete(long idTour, long idTransport);
    void makeBooked(Tour tour, long idTransport);
     void deleteBooking(Tour tour);
    void deleteAll(long idTour);
    boolean IsActiveTransports(List<Resort> resorts);

}
