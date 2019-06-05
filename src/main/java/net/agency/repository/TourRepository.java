package net.agency.repository;

import net.agency.model.Resort;
import net.agency.model.Tour;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Set;

@Repository
public interface TourRepository extends JpaRepository<Tour, Long>{  //, JpaSpecificationExecutor<Tour> {

    @Query("select b from Tour b where b.full_price <= :price and b.resort = :resort")
    Set<Tour> findByPrice(@Param("resort") Resort resort, @Param("price") double price);

    @Query("select b from Tour b where b.date_begin = :date and b.resort = :resort")
    Set<Tour> findByDate(@Param("resort") Resort resort, @Param("date") Date date);

    @Query(value = "select * from tour where booking_id is null and isActive is true", nativeQuery = true)
    List<Tour> findFreeAndActive();

    @Query("select b from Tour b where b.date_begin = :date and b.full_price <= :price and b.resort = :resort")
    Set<Tour> findByPriceOrDate_begin(@Param("resort") Resort resort, @Param("date") Date date, @Param("price") double price);

}
