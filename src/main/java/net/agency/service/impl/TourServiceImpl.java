package net.agency.service.impl;

import net.agency. model.Resort;
import net.agency. model.Tour;
import net.agency.repository.ResortRepository;
import net.agency.repository.TourRepository;
import net.agency.service.HotelService;
import net.agency.service.ResortService;
import net.agency.service.TourService;
import net.agency.service.TransportService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Set;


@Service("tourService")
@Transactional
public class TourServiceImpl implements TourService {

    private static final Logger logger = LoggerFactory.getLogger(Tour.class);

    @Autowired
    TourRepository tourRepository;

    @Autowired
    ResortService resortService;

    @Autowired
    ResortRepository resortRepository;

    @Autowired
    TransportService transportService;

    @Autowired
    HotelService hotelService;

    @Override
    public List<Tour> getAll() {
        return tourRepository.findAll();
    }

    @Override
    public List<Tour> getFreeAndActiveTours() {
        logger.debug("free tours");
        return tourRepository.findFreeAndActive();
    }

    @Override
    public void edit(Tour tour) {
        Tour excistingTour = tourRepository.getOne(tour.getId());
        excistingTour.setName(tour.getName());
        excistingTour.setFull_price(tour.getFull_price());
        excistingTour.setDate_begin(tour.getDate_begin());
        excistingTour.setDate_end(tour.getDate_end());
        excistingTour.setTransports(excistingTour.getTransports());
        excistingTour.setHotels(excistingTour.getHotels());
//        excistingTour.setTransports(tour.getTransports());
//        excistingTour.setHotels(tour.getHotels());
        excistingTour.setFilename(tour.getFilename());
        tourRepository.saveAndFlush(excistingTour);

    }

    @Override
    public void delete(long idResort) {
        Resort resort = resortService.getOne(idResort);
        resort.getTours().forEach(tour -> tour.setActive(false));
    }

    @Override
    public Tour getOne(long id) {
        Tour tour = tourRepository.getOne(id);
        logger.debug("get one tour = " + tour.toString());
        return tour;
    }

    @Override
    public Tour add(Tour tour) {

        Tour savedTour = this.tourRepository.saveAndFlush(tour);
        logger.debug("save tour " + savedTour.toString());
        return savedTour;

    }

    @Override
    public void add(long idResort, Tour tour) {
        Resort excistingResort = resortService.getOne(idResort);
        tour.setResort(excistingResort);
        excistingResort.getTours().add(tour);
        resortService.add(excistingResort);

    }

    @Override
    public void delete(long idResort, long idTour) {

        Resort excistingResort = resortService.getOne(idResort);
        Tour excistingTour = tourRepository.getOne(idTour);
//        excistingResort.getTours().remove(excistingTour);
        excistingResort.getTours().forEach(Tour -> {
            if (Tour == excistingTour) {
                excistingTour.setActive(false);
            }
        });

        hotelService.deleteAll(idTour);
        transportService.deleteAll(idTour);
        resortRepository.saveAndFlush(excistingResort);
    }


    @Override
    public Set<Tour> sortByPrice(Resort resort, double price) {
        logger.debug("sort by price "+resort.toString()+price);
        return tourRepository.findByPrice(resort,price);

    }

    @Override
    public Set<Tour> sortByDate(Resort resort,Date date)
    {
        logger.debug("sort by date "+resort.toString()+date.toString());

        return tourRepository.findByDate(resort,date);
    }

    @Override
    public Set<Tour> findByPriceAndDate(Resort resort,double  price, Date date) {
        logger.debug("find by price"+price+" and date "+date.toString());
        return tourRepository.findByPriceOrDate_begin(resort,date,price);
//        return tourRepository.findAll(where( withPrice(price))
////                .and(name == null ? null : withName(name))
//                .and(date == null ? null : withDate(date)));
//        List<Tour> searchResults =  tourRepository.findAll(where(withPrice(price))
//                .and(withName(name))
//                .and(withDate(date)));
      //  return searchResults;
    }

    @Override
    public boolean IsActiveTours(List<Resort> resorts) {
        boolean active=false;
        for(Resort resort:resorts){
            for(Tour tour:resort.getTours()){
                    if(tour.isActive()==true){
                    active=true;
                }
            }
        }
        return active;
    }

//    @Override
//    public List<Tour> searchByCriteria(Resort resort, Double price, Date date) {
//         logger.debug("search by criteria");
//
//        EntityManagerFactory emfactory = Persistence.
//                createEntityManagerFactory( "Eclipselink_JPA" );
//        EntityManager manager = emfactory.createEntityManager( );
//            CriteriaBuilder cb = manager.getCriteriaBuilder();
//            CriteriaQuery<Tour> query = cb.createQuery(Tour.class);
//            Root<Tour> supplyRoot = query.from(Tour.class);
//            List<Predicate> predicates = new ArrayList<Predicate>();
//            if (resort != null ) {
//                predicates.add(cb.equal(supplyRoot.get("resort"),resort));
//            }
//            if (price!= null) {
//                predicates.add(cb.equal(supplyRoot.get("price"), price));
//            }
//            if (date != null ) {
//                predicates.add(cb.equal(supplyRoot.get("date_begin"), date));
//            }
//
//            query.select(supplyRoot).where(predicates.toArray(new Predicate[predicates.size()]));
//
//            // Predicate[] predicatesarr = predicates.toArray(new
//            // Predicate[predicates.size()]);
//
//            return manager.createQuery(query).getResultList();
//
//
//    }



}
